#!/usr/bin/env bash

set -euo pipefail

for cmd in csv2md ansi2html docker; do
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
    echo >&2 "Executing query from $file"
    docker cp "$file" $container_name:/tmp/
    docker exec \
        $container_name \
        java -Dorg.jline.terminal.dumb=true -jar /usr/bin/trino \
        --catalog trinocicd --schema v2 \
        -f "/tmp/$(basename "$file")" \
        --output-format=CSV_HEADER | csv2md | ansi2html --inline | sed 's,| \(.*\) @https://\([^ ]*\),| <a href="https://\2">\1</a>,g'
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
    title=$(echo "$comments" | head -1)
    desc=$(echo "$comments" | tail -n +2)
    title=${title#--}
    {
        echo "# $title"
        echo ""
        echo "$desc"
        echo ""
        run_query "$file"
        echo ""
        if [ -n "$GITHUB_REPOSITORY" ]; then
            echo "[query]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/blob/$GITHUB_SHA/$file)"
        fi
        echo ""
    } >>"$target"
done

echo "Generated on $(date)" >>"$target"
