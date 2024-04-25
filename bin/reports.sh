#!/usr/bin/env bash
#
# Generate reports by executing SQL queries.
#
# Executes SQL queries from multiple files using the Trino CLI available in a
# locally running container called `trino`.
#
# SQL query files should use the following convention:
# * The first line should be a comment (start with `--`) used as the report
#   title.
# * Any additional comment lines are used as the description.
# * If there are no comments, the query is still executed, but results are
#   discarded.
# * Query results are saved as a Markdown table. If the query contains the word
#   "chart" anywhere (like in a column title), results are rendered in a
#   code block.
# * HTML links are rendered by replacing `"label"@http://url ` values with the
#   anchor HTML tag

set -euo pipefail

for cmd in ansi2html docker; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

container_name=trino
if ! status=$(docker inspect $container_name --format "{{json .State.Status}}") || [ "$status" != '"running"' ]; then
    echo >&2 "Container '$container_name' does not exist or is not running (status is $status)"
    exit 1
fi

if [ "$#" -le 2 ]; then
    echo >&2 "Usage: $0 output-file title input-file [input-file ...]"
    echo >&2 ""
    echo >&2 "arguments:"
    echo >&2 " output-file - file where to write the report, as markdown"
    echo >&2 " title - report title"
    echo >&2 " input-file - one or more files with an SQL query"
    exit 1
fi

target=$1
shift
title=$1
shift

queries=("$@")

function run_query() {
    local file=$1
    local format=${2:-ALIGNED}
    echo >&2 "Executing query from $file"
    docker cp "$file" $container_name:/tmp/
    time docker exec \
        $container_name \
        java -Dorg.jline.terminal.dumb=true -jar /usr/bin/trino \
        --catalog trinocicd --schema v2 \
        --debug \
        -f "/tmp/$(basename "$file")" \
        --output-format="$format"
}

function run_query_md() {
    local file=$1
    run_query "$file" MARKDOWN | ansi2html --inline | sed 's,"\([^"]*\)"@https://\([^ ]*\) ,<a href="https://\2">\1</a> ,g'
}

function run_query_mono() {
    local file=$1
    run_query "$file" ALIGNED | ansi2html --inline | sed 's,"\([^"]*\)"@https://\([^ ]*\) ,<a href="https://\2">\1</a> ,g'
}

GITHUB_SERVER_URL=${GITHUB_SERVER_URL:-https://github.com}
GITHUB_REPOSITORY=${GITHUB_REPOSITORY:-}
GITHUB_SHA=${GITHUB_SHA:-master}

mkdir -p "$(dirname "$target")"
{
    echo "---"
    echo "title: $title"
    echo "---"
    echo ""
} >"$target"

for file in "${queries[@]}"; do
    # get all comments from the top of the file
    comments=$(sed -n '/^-/!q;p' "$file" | sed 's/^-- //g')
    if [ -z "$comments" ]; then
        echo >&2 "First line of file $file needs to be an SQL comment with the report title (should start with --), query will run but results will be ignored"
        run_query "$file"
        continue
    fi
    # get the first line but consume the remainder in case that echo continues to print after head is done
    title=$(echo "$comments" | (head -1; dd status=none of=/dev/null))
    desc=$(echo "$comments" | tail -n +2)
    title=${title#--}
    {
        echo "## $title"
        echo ""
        echo "$desc"
        if grep -qi chart "$file"; then
            echo '<pre><code>'
            run_query_mono "$file"
            echo '</code></pre>'
        else
            echo ""
            run_query_md "$file"
            echo ""
        fi
        if [ -n "$GITHUB_REPOSITORY" ]; then
            echo "[query]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/blob/$GITHUB_SHA/$file)"
        fi
        echo ""
    } >>"$target"
done

echo "Generated on $(date)" >>"$target"
