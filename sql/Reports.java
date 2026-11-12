import io.trino.cli.AlignedTablePrinter;
import io.trino.cli.MarkdownTablePrinter;
import io.trino.cli.OutputPrinter;
import io.trino.cli.Theme;
import io.trino.cli.lexer.StatementSplitter;
import io.trino.client.ClientSession;
import io.trino.client.Column;
import io.trino.client.StatementClient;
import okhttp3.OkHttpClient;

import static io.trino.client.StatementClientFactory.newStatementClient;

// Generates the pages in reports/ from the queries in sql/, listed in sql/pages.properties, with the Trino CLI in the
// class path, which splits the files into statements and prints the results: bin/reports.sh [page ...]
// Every file is a section of its page: the first comment line is the title, and the next ones are the description.
// The result is a Markdown table, or, if the file has the word "chart" anywhere, a table in a monospace font.

// A value like "label"@https://example.com becomes a link. The printers align columns by the length of values without
// escape sequences, so they get only the label, between two of them, and the Markdown printer escapes their bracket.
final Pattern LINK = Pattern.compile("\"([^\"]*)\"@(https://[^ ]*) ");
final Pattern PRINTED_LINK = Pattern.compile("\u001b\\\\?\\[(\\d+);98m(.*?)\u001b\\\\?\\[99m");

final OkHttpClient httpClient = new OkHttpClient();
// in UTC, like the server, so functions like current_date don't depend on where this runs
final ClientSession session = ClientSession.builder()
        .server(URI.create(System.getenv().getOrDefault("TRINO_URL", "http://localhost:8080")))
        .user(Optional.of("reports"))
        .source("reports")
        .catalog("trinocicd")
        .schema("github")
        .timeZone(ZoneId.of("UTC"))
        .build();
int failedReports;

void main(String[] args)
        throws Exception
{
    Properties pages = new Properties();
    pages.load(Files.newBufferedReader(Path.of("sql/pages.properties")));
    String menu = Files.readString(Path.of("_config.yml"));
    String index = Files.readString(Path.of("reports/index.md"));
    List<String> names = List.of(args.length > 0 ? args : pages.getProperty("pages").split(","));
    for (String name : names) {
        if (!pages.containsKey(name + ".title") || !menu.contains("reports/%s/index.md".formatted(name)) || !index.contains("/reports/%s/".formatted(name))) {
            throw new IllegalArgumentException("Add the page %s to sql/pages.properties, nav_pages in _config.yml, and reports/index.md".formatted(name));
        }
    }

    // tables and functions in the memory catalog, which all reports use, so a failure stops all of them
    for (Path file : sqlFiles("setup")) {
        run(Files.readString(file));
    }
    for (String name : names) {
        StringBuilder page = new StringBuilder("---\ntitle: %s\n---\n\n".formatted(pages.getProperty(name + ".title")));
        for (Path file : sqlFiles(name)) {
            page.append(section(file));
        }
        page.append("Generated on ").append(new Date()).append('\n');
        Files.createDirectories(Path.of("reports", name));
        Files.writeString(Path.of("reports", name, "index.md"), page);
    }
    if (failedReports > 0) {
        System.err.printf("%d reports failed%n", failedReports);
    }
    // the HTTP client keeps threads that would keep the JVM running for a while
    System.exit(failedReports > 0 ? 1 : 0);
}

String section(Path file)
        throws IOException
{
    System.err.println("Executing query from " + file);
    String sql = Files.readString(file);
    List<String> comments = sql.lines()
            .takeWhile(line -> line.startsWith("--"))
            .map(line -> line.replaceFirst("^-- ?", ""))
            .toList();
    boolean monospace = sql.toLowerCase(Locale.ENGLISH).contains("chart");
    String result;
    try {
        StringBuilder tables = new StringBuilder();
        for (Result query : run(sql)) {
            tables.append(print(query, monospace));
        }
        result = monospace ? "<pre><code>\n" + tables + "</code></pre>\n" : tables + "\n";
    }
    catch (QueryFailedException e) {
        failedReports++;
        System.err.printf("Query in %s failed: %s%n", file, e.getMessage());
        result = "This report failed: " + escapeHtml(e.getMessage()) + "\n\n";
    }
    String query = Optional.ofNullable(System.getenv("GITHUB_REPOSITORY"))
            .map(repository -> "[query](%s/%s/blob/%s/%s)\n".formatted(
                    System.getenv().getOrDefault("GITHUB_SERVER_URL", "https://github.com"),
                    repository,
                    System.getenv().getOrDefault("GITHUB_SHA", "main"),
                    file))
            .orElse("");
    return "## %s\n\n%s\n\n%s%s\n".formatted(comments.getFirst(), String.join("\n", comments.subList(1, comments.size())), result, query);
}

List<Result> run(String sql)
        throws QueryFailedException
{
    StatementSplitter splitter = new StatementSplitter(sql);
    List<String> statements = new ArrayList<>(splitter.getCompleteStatements().stream().map(StatementSplitter.Statement::statement).toList());
    if (!StatementSplitter.isEmptyStatement(splitter.getPartialStatement())) {
        statements.add(splitter.getPartialStatement());
    }
    List<Result> results = new ArrayList<>();
    for (String statement : statements) {
        try (StatementClient client = newStatementClient(httpClient, session, statement, Optional.empty())) {
            List<List<Object>> rows = new ArrayList<>();
            while (client.isRunning()) {
                client.currentRows().forEach(rows::add);
                client.advance();
            }
            var status = client.finalStatusInfo();
            if (status.getError() != null) {
                throw new QueryFailedException(status.getError().getMessage());
            }
            if (status.getColumns() != null) {
                results.add(new Result(status.getColumns(), rows));
            }
        }
    }
    return results;
}

String print(Result result, boolean monospace)
        throws IOException
{
    List<String> urls = new ArrayList<>();
    List<List<?>> rows = result.rows().stream()
            .<List<?>>map(row -> row.stream()
                    .map(value -> value instanceof String text ? LINK.matcher(text).replaceAll(link -> {
                        urls.add(link.group(2));
                        return Matcher.quoteReplacement("\u001b[%d;98m%s\u001b[99m ".formatted(urls.size() - 1, link.group(1)));
                    }) : value)
                    .toList())
            .toList();
    StringWriter output = new StringWriter();
    OutputPrinter printer = monospace ? new AlignedTablePrinter(result.columns(), output, Theme.NONE) : new MarkdownTablePrinter(result.columns(), output);
    printer.printRows(rows, true);
    printer.finish();
    // the page is HTML, so the printed values can't add tags, except for links
    return PRINTED_LINK.matcher(escapeHtml(output.toString())).replaceAll(link -> Matcher.quoteReplacement("<a href=\"%s\">%s</a>".formatted(
            escapeHtml(urls.get(Integer.parseInt(link.group(1)))),
            link.group(2))));
}

static String escapeHtml(String text)
{
    return text.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
}

static List<Path> sqlFiles(String dir)
        throws IOException
{
    try (Stream<Path> files = Files.list(Path.of("sql", dir))) {
        return files.filter(file -> file.toString().endsWith(".sql")).sorted().toList();
    }
}

record Result(List<Column> columns, List<List<Object>> rows) {}

static class QueryFailedException
        extends Exception
{
    QueryFailedException(String message)
    {
        super(message);
    }
}
