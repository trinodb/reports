/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.io.IOException;
import java.io.Reader;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

import static java.util.Objects.requireNonNull;

/**
 * Runs SQL steps that copy data from one Trino catalog to another, like from a catalog using the OpenAPI connector
 * to an Iceberg catalog. A failed step is reported, and the next steps still run.
 * <p>
 * Ported from the sync program in <a href="https://github.com/nineinchnick/trino-openapi/pull/270">trino-openapi#270</a>,
 * to run with the Java source launcher and only the Trino JDBC driver in the class path:
 * {@code java -cp trino-jdbc.jar sync/Sync.java [sync.properties]}
 */
public final class Sync
{
    private static final Logger log;

    static {
        // one line per message, so the output of scheduled runs is easy to search
        System.setProperty("java.util.logging.SimpleFormatter.format", "%1$tF %1$tT %4$s %5$s%6$s%n");
        log = Logger.getLogger(Sync.class.getName());
    }

    private final SyncConfig config;
    private final StepCatalog catalog;

    public Sync(SyncConfig config)
    {
        this.config = requireNonNull(config, "config is null");
        this.catalog = new StepCatalog(config.stepsDir());
    }

    public static void main(String[] args)
            throws Exception
    {
        Optional<Path> propertiesFile = args.length > 0 ? Optional.of(Path.of(args[0])) : Optional.empty();
        SyncConfig config = SyncConfig.load(propertiesFile, System.getenv());
        config.describe().forEach((name, value) -> log.info("%s=%s".formatted(name, value)));
        List<String> failedSteps = new Sync(config).run();
        if (!failedSteps.isEmpty()) {
            log.severe("Failed steps: " + String.join(", ", failedSteps));
            System.exit(1);
        }
    }

    /**
     * Returns the names of steps that failed.
     */
    public List<String> run()
            throws SQLException, InterruptedException
    {
        List<String> stepNames = config.steps().orElseGet(catalog::stepNames);
        // load all steps first, so a typo in a step name or a script fails before changing any data
        List<Step> steps = stepNames.stream()
                .map(catalog::step)
                .toList();
        List<String> failedSteps = new ArrayList<>();
        try (Connection connection = connect()) {
            StepRunner runner = new StepRunner(connection, config);
            for (Step step : steps) {
                long start = System.nanoTime();
                try {
                    long changedRows = runner.run(step, config.parameters());
                    log.info("%s: finished, changed %d rows in %s".formatted(step.name(), changedRows, elapsed(start)));
                }
                catch (SQLException | RuntimeException e) {
                    log.log(Level.SEVERE, "%s: failed after %s".formatted(step.name(), elapsed(start)), e);
                    failedSteps.add(step.name());
                }
            }
        }
        return List.copyOf(failedSteps);
    }

    private Connection connect()
            throws SQLException
    {
        Properties properties = new Properties();
        properties.setProperty("user", config.trinoUser());
        // steps compare timestamps from APIs, which are in UTC, with the current time
        properties.setProperty("timezone", "UTC");
        config.trinoPassword().ifPresent(password -> properties.setProperty("password", password));
        config.sessionProperties().ifPresent(sessionProperties -> properties.setProperty("sessionProperties", sessionProperties));
        return DriverManager.getConnection(config.trinoUrl(), properties);
    }

    static Duration elapsed(long startNanos)
    {
        return Duration.ofMillis((System.nanoTime() - startNanos) / 1_000_000);
    }

    /**
     * Settings read from a properties file and environment variables, where {@code SYNC_TRINO_URL} sets {@code trino_url}.
     * Keys other than the settings of the driver are parameters of statements.
     */
    record SyncConfig(Map<String, String> values)
    {
        static final String ENV_PREFIX = "SYNC_";
        static final String TRINO_URL = "trino_url";
        static final String TRINO_USER = "trino_user";
        static final String TRINO_PASSWORD = "trino_password";
        static final String SESSION_PROPERTIES = "session_properties";
        static final String STEPS_DIR = "steps_dir";
        static final String STEPS = "steps";
        static final String MAX_RETRIES = "max_retries";
        static final String RETRY_DELAY = "retry_delay";
        static final String MAX_ITERATIONS = "max_iterations";

        private static final Set<String> SETTINGS = Set.of(TRINO_URL, TRINO_USER, TRINO_PASSWORD, SESSION_PROPERTIES, STEPS_DIR, STEPS, MAX_RETRIES, RETRY_DELAY, MAX_ITERATIONS);
        private static final Pattern DURATION = Pattern.compile("(\\d+)(ms|s|m|h)");

        SyncConfig(Map<String, String> values)
        {
            this.values = Map.copyOf(values);
            checkArgument(values.containsKey(STEPS_DIR), "%s must be set", STEPS_DIR);
            checkArgument(maxRetries() >= 0, "%s must not be negative", MAX_RETRIES);
            checkArgument(maxIterations() > 0, "%s must be positive", MAX_ITERATIONS);
        }

        public static SyncConfig load(Optional<Path> propertiesFile, Map<String, String> environment)
                throws IOException
        {
            Map<String, String> values = new HashMap<>();
            if (propertiesFile.isPresent()) {
                Properties properties = new Properties();
                try (Reader reader = Files.newBufferedReader(propertiesFile.get())) {
                    properties.load(reader);
                }
                properties.stringPropertyNames().forEach(name -> values.put(name, properties.getProperty(name)));
            }
            environment.forEach((name, value) -> {
                if (name.startsWith(ENV_PREFIX)) {
                    values.put(name.substring(ENV_PREFIX.length()).toLowerCase(Locale.ENGLISH), value);
                }
            });
            return new SyncConfig(values);
        }

        public String trinoUrl()
        {
            return values.getOrDefault(TRINO_URL, "jdbc:trino://localhost:8080");
        }

        public String trinoUser()
        {
            return values.getOrDefault(TRINO_USER, "sync");
        }

        public Optional<String> trinoPassword()
        {
            return Optional.ofNullable(values.get(TRINO_PASSWORD));
        }

        /**
         * Session properties in the format of the {@code sessionProperties} parameter of the JDBC driver, like {@code github.http_cache_enabled:false}.
         */
        public Optional<String> sessionProperties()
        {
            return Optional.ofNullable(values.get(SESSION_PROPERTIES));
        }

        public Path stepsDir()
        {
            return Path.of(values.get(STEPS_DIR));
        }

        public Optional<List<String>> steps()
        {
            return Optional.ofNullable(values.get(STEPS))
                    .map(steps -> Pattern.compile(",").splitAsStream(steps)
                            .map(String::strip)
                            .filter(step -> !step.isEmpty())
                            .toList());
        }

        public int maxRetries()
        {
            return Integer.parseInt(values.getOrDefault(MAX_RETRIES, "3"));
        }

        /**
         * Delay before the first retry, like {@code 500ms}, {@code 10s}, {@code 10m}, or {@code 1h}.
         */
        public Duration retryDelay()
        {
            String value = values.getOrDefault(RETRY_DELAY, "10s");
            Matcher matcher = DURATION.matcher(value);
            checkArgument(matcher.matches(), "Invalid %s: %s", RETRY_DELAY, value);
            long amount = Long.parseLong(matcher.group(1));
            return switch (matcher.group(2)) {
                case "ms" -> Duration.ofMillis(amount);
                case "s" -> Duration.ofSeconds(amount);
                case "m" -> Duration.ofMinutes(amount);
                case "h" -> Duration.ofHours(amount);
                default -> throw new IllegalStateException("Unexpected unit: " + matcher.group(2));
            };
        }

        public int maxIterations()
        {
            return Integer.parseInt(values.getOrDefault(MAX_ITERATIONS, "1000"));
        }

        public Map<String, String> parameters()
        {
            Map<String, String> parameters = new HashMap<>(values);
            parameters.keySet().removeAll(SETTINGS);
            return Map.copyOf(parameters);
        }

        /**
         * All values, with the password masked, for logging.
         */
        public Map<String, String> describe()
        {
            Map<String, String> described = new LinkedHashMap<>();
            values.keySet().stream().sorted().forEach(name -> described.put(name, name.equals(TRINO_PASSWORD) ? "***" : values.get(name)));
            return described;
        }
    }

    /**
     * Steps stored in a directory, which run in the order of their names, starting with two digits, like {@code 01-tables}.
     * A step is a {@code .sql} file with one statement, or a directory of such files, which run in the order of their names.
     * Other files are ignored.
     */
    record StepCatalog(Path directory)
    {
        private static final Pattern STEP_FILE = Pattern.compile("\\d{2}-([a-z0-9_]+)\\.sql");
        private static final Pattern STEP_DIRECTORY = Pattern.compile("\\d{2}-([a-z0-9_]+)");

        StepCatalog
        {
            requireNonNull(directory, "directory is null");
        }

        public List<String> stepNames()
        {
            return List.copyOf(stepPaths().keySet());
        }

        public Step step(String name)
        {
            Path path = stepPaths().get(name);
            checkArgument(path != null, "Unknown step %s, missing in %s", name, directory);
            List<Path> files = List.of(path);
            if (Files.isDirectory(path)) {
                files = list(path).stream()
                        .filter(file -> file.getFileName().toString().endsWith(".sql"))
                        .toList();
            }
            checkArgument(!files.isEmpty(), "Step %s has no statements in %s", name, path);
            return Step.parse(name, files.stream()
                    .map(file -> StepStatement.read(directory.relativize(file), readString(file)))
                    .toList());
        }

        private Map<String, Path> stepPaths()
        {
            Map<String, Path> paths = new LinkedHashMap<>();
            for (Path path : list(directory)) {
                Optional<String> name = stepName(path);
                if (name.isEmpty()) {
                    continue;
                }
                Path previous = paths.putIfAbsent(name.get(), path);
                checkArgument(previous == null, "Step %s is defined by both %s and %s", name.get(), previous, path);
            }
            return paths;
        }

        private static Optional<String> stepName(Path path)
        {
            Pattern pattern = STEP_FILE;
            if (Files.isDirectory(path)) {
                pattern = STEP_DIRECTORY;
            }
            Matcher matcher = pattern.matcher(path.getFileName().toString());
            if (!matcher.matches()) {
                return Optional.empty();
            }
            return Optional.of(matcher.group(1));
        }

        private static List<Path> list(Path directory)
        {
            try (Stream<Path> paths = Files.list(directory)) {
                return paths.sorted(Comparator.comparing(path -> path.getFileName().toString()))
                        .toList();
            }
            catch (IOException e) {
                throw new UncheckedIOException(e);
            }
        }

        private static String readString(Path file)
        {
            try {
                return Files.readString(file);
            }
            catch (IOException e) {
                throw new UncheckedIOException(e);
            }
        }
    }

    /**
     * Statements of a step. Statements before the one with a {@code -- loop: <mode>} directive run once,
     * and the rest run repeatedly, until the last one changes no rows.
     */
    record Step(String name, List<StepStatement> setup, Optional<Loop> loop)
    {
        Step
        {
            requireNonNull(name, "name is null");
            setup = List.copyOf(setup);
            requireNonNull(loop, "loop is null");
        }

        public static Step parse(String name, List<StepStatement> statements)
        {
            List<StepStatement> setup = new ArrayList<>();
            List<StepStatement> body = new ArrayList<>();
            Optional<LoopMode> mode = Optional.empty();
            int stopAfter = 1;
            for (StepStatement statement : statements) {
                if (statement.loopMode().isPresent()) {
                    checkArgument(mode.isEmpty(), "Step %s has more than one loop directive", name);
                    mode = statement.loopMode();
                }
                if (statement.stopAfter().isPresent()) {
                    checkArgument(stopAfter == 1, "Step %s has more than one stop-after directive", name);
                    stopAfter = statement.stopAfter().get();
                }
                if (mode.isEmpty()) {
                    setup.add(statement);
                    continue;
                }
                body.add(statement);
            }
            if (mode.isEmpty()) {
                checkArgument(stopAfter == 1, "Step %s: stop-after requires a loop directive", name);
                return new Step(name, setup, Optional.empty());
            }
            return new Step(name, setup, Optional.of(new Loop(mode.get(), stopAfter, body)));
        }
    }

    /**
     * A statement read from a file, with directives in the comments before it:
     * <ul>
     * <li>{@code -- loop: batches|pages} repeats this statement and the next ones of the step;
     * <li>{@code -- stop-after: <iterations>} sets {@link Loop#stopAfter()};
     * <li>{@code -- parameters: <name>, ...} names the values bound to the {@code ?} placeholders, in order:
     * {@code page} in a loop of pages, or a parameter from the settings. Parameters without a value are bound as {@code NULL}.
     * </ul>
     */
    record StepStatement(String name, String sql, List<String> parameters, Optional<LoopMode> loopMode, Optional<Integer> stopAfter)
    {
        private static final Pattern DIRECTIVE = Pattern.compile("^--\\s*(loop|stop-after|parameters)\\s*:\\s*(.*?)\\s*$", Pattern.MULTILINE);
        private static final Pattern PARAMETER_NAME = Pattern.compile("[a-z_][a-z0-9_]*");

        StepStatement
        {
            requireNonNull(name, "name is null");
            requireNonNull(sql, "sql is null");
            parameters = List.copyOf(parameters);
            requireNonNull(loopMode, "loopMode is null");
            requireNonNull(stopAfter, "stopAfter is null");
        }

        /**
         * Reads a statement from the text of a file, which can end with a semicolon.
         */
        public static StepStatement read(Path file, String text)
        {
            String sql = text.strip();
            if (sql.endsWith(";")) {
                sql = sql.substring(0, sql.length() - 1).stripTrailing();
            }
            List<String> parameters = List.of();
            Optional<LoopMode> loopMode = Optional.empty();
            Optional<Integer> stopAfter = Optional.empty();
            Matcher matcher = DIRECTIVE.matcher(leadingComments(sql));
            while (matcher.find()) {
                String value = matcher.group(2);
                switch (matcher.group(1)) {
                    case "loop" -> loopMode = Optional.of(LoopMode.valueOf(value.toUpperCase(Locale.ENGLISH)));
                    case "stop-after" -> {
                        stopAfter = Optional.of(Integer.parseInt(value));
                        checkArgument(stopAfter.get() > 0, "%s: stop-after must be positive, got %s", file, value);
                    }
                    case "parameters" -> {
                        parameters = Pattern.compile(",").splitAsStream(value)
                                .map(String::strip)
                                .toList();
                        parameters.forEach(parameter -> checkArgument(PARAMETER_NAME.matcher(parameter).matches(), "%s: invalid parameter name: '%s'", file, parameter));
                    }
                    default -> throw new IllegalStateException("Unexpected directive: " + matcher.group(1));
                }
            }
            return new StepStatement(file.toString(), sql, parameters, loopMode, stopAfter);
        }

        private static String leadingComments(String sql)
        {
            StringBuilder comments = new StringBuilder();
            for (String line : sql.lines().toList()) {
                String trimmed = line.strip();
                if (!trimmed.isEmpty() && !trimmed.startsWith("--")) {
                    break;
                }
                comments.append(trimmed).append('\n');
            }
            return comments.toString();
        }
    }

    enum LoopMode
    {
        /**
         * Repeats the statements, for example to process parents missing children in batches.
         */
        BATCHES,
        /**
         * Repeats the statements with the {@code page} parameter set to 1, 2, and so on.
         */
        PAGES,
    }

    /**
     * @param stopAfter the number of consecutive iterations in which the last statement changed no rows, that stops the loop
     */
    record Loop(LoopMode mode, int stopAfter, List<StepStatement> statements)
    {
        Loop
        {
            requireNonNull(mode, "mode is null");
            checkArgument(stopAfter > 0, "stopAfter must be positive");
            statements = List.copyOf(statements);
            checkArgument(!statements.isEmpty(), "statements is empty");
        }
    }

    /**
     * Runs the statements of a step, retrying ones that failed with errors that might be transient.
     * Statements must be safe to repeat, like a {@code MERGE} keyed by an identifier.
     */
    static final class StepRunner
    {
        // Trino reports errors caused by the query, like a syntax error or a missing table, with codes below this value
        private static final int MIN_NON_USER_ERROR_CODE = 0x0001_0000;
        private static final String PAGE = "page";

        private final Connection connection;
        private final int maxRetries;
        private final Duration retryDelay;
        private final int maxIterations;

        public StepRunner(Connection connection, SyncConfig config)
        {
            this.connection = requireNonNull(connection, "connection is null");
            this.maxRetries = config.maxRetries();
            this.retryDelay = config.retryDelay();
            this.maxIterations = config.maxIterations();
        }

        /**
         * Returns the number of rows changed by all statements.
         */
        public long run(Step step, Map<String, String> parameters)
                throws SQLException, InterruptedException
        {
            long changedRows = 0;
            for (StepStatement statement : step.setup()) {
                changedRows += execute(step.name(), statement, parameters);
            }
            if (step.loop().isEmpty()) {
                return changedRows;
            }
            Loop loop = step.loop().get();
            int unchangedIterations = 0;
            for (int iteration = 1; unchangedIterations < loop.stopAfter(); iteration++) {
                if (iteration > maxIterations) {
                    throw new IllegalStateException("Step %s didn't finish after %s iterations".formatted(step.name(), maxIterations));
                }
                Map<String, Object> iterationParameters = new HashMap<>(parameters);
                if (loop.mode() == LoopMode.PAGES) {
                    iterationParameters.put(PAGE, iteration);
                }
                long lastChangedRows = 0;
                for (StepStatement statement : loop.statements()) {
                    lastChangedRows = execute(step.name(), statement, iterationParameters);
                    changedRows += lastChangedRows;
                }
                unchangedIterations++;
                if (lastChangedRows > 0) {
                    unchangedIterations = 0;
                }
            }
            return changedRows;
        }

        private long execute(String stepName, StepStatement statement, Map<String, ?> parameters)
                throws SQLException, InterruptedException
        {
            for (int attempt = 0; ; attempt++) {
                long start = System.nanoTime();
                try (PreparedStatement prepared = connection.prepareStatement(statement.sql())) {
                    bind(prepared, statement.parameters(), parameters);
                    long changedRows = Math.max(prepared.executeLargeUpdate(), 0);
                    log.info("%s: changed %d rows in %s: %s".formatted(stepName, changedRows, elapsed(start), statement.name()));
                    return changedRows;
                }
                catch (SQLException e) {
                    if (attempt >= maxRetries || !isTransient(e)) {
                        throw e;
                    }
                    long delayMillis = retryDelay.toMillis() << attempt;
                    log.warning("%s: retrying %s in %d ms, attempt %d of %d, after failure: %s".formatted(stepName, statement.name(), delayMillis, attempt + 1, maxRetries, e.getMessage()));
                    Thread.sleep(delayMillis);
                }
            }
        }

        private static void bind(PreparedStatement prepared, List<String> names, Map<String, ?> parameters)
                throws SQLException
        {
            for (int index = 0; index < names.size(); index++) {
                Object value = parameters.get(names.get(index));
                if (value == null) {
                    prepared.setNull(index + 1, Types.VARCHAR);
                    continue;
                }
                prepared.setObject(index + 1, value);
            }
        }

        private static boolean isTransient(SQLException e)
        {
            // the JDBC driver reports failed requests, for example when the server is restarting, with a code of 0 and the cause,
            // and errors detected by the driver itself, like a statement that is not an update, without a cause
            return (e.getErrorCode() == 0 && e.getCause() != null) || e.getErrorCode() >= MIN_NON_USER_ERROR_CODE;
        }
    }

    static void checkArgument(boolean condition, String format, Object... args)
    {
        if (!condition) {
            throw new IllegalArgumentException(format.formatted(args));
        }
    }
}
