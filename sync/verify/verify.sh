#!/usr/bin/env bash
#
# Run the steps of the migration verification against the container started
# by run-trino.sh. See the "Phase 0" section in sync/MIGRATION.md.
#
# Usage:
#   verify.sh reset                    - drop and create the tables in the scratch catalog
#   verify.sh backfill [cutoff]        - copy the old data from before the cutoff, like '2026-10-25 00:00:00'
#   verify.sh sync                     - run the new sync, reading from the OpenAPI connector
#   verify.sh connectors               - V1: compare the trino-rest and OpenAPI connectors
#   verify.sh compare cutoff until     - V2: compare the old and new tables between cutoff and until
#   verify.sh reports [base]           - V3: run the CI reports from base, origin/main by default, on the old tables,
#                                        and the current ones on the new tables, and compare results

set -euo pipefail

CONTAINER_NAME=${CONTAINER_NAME:-trino-verify}
# the container started by bin/run-trino.sh, with the old tables in the legacy catalog
LEGACY_CONTAINER_NAME=${LEGACY_CONTAINER_NAME:-trino}
PORT=${PORT:-8081}
TRINO_VERSION=484
OWNER=trinodb
REPO=trino
SCHEMA=trinocicd.github

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SYNC_DIR="$SCRIPT_DIR/.."
JDBC_JAR="$SCRIPT_DIR/.plugins/trino-jdbc-$TRINO_VERSION.jar"

function main() {
    local command=${1:-}
    shift || true
    case "$command" in
        reset) reset ;;
        backfill) run_sync "$SYNC_DIR/backfill" ${1:+"SYNC_CUTOFF=$1"} ;;
        sync) run_sync "$SYNC_DIR/github" SYNC_SESSION_PROPERTIES=github.http_cache_enabled:false ;;
        connectors) connectors ;;
        compare) compare "$@" ;;
        reports) reports "${1:-origin/main}" ;;
        *)
            sed -n '/^# Usage/,/^$/p' "${BASH_SOURCE[0]}" >&2
            exit 1
            ;;
    esac
}

function reset() {
    local table
    for table in $(query TSV "SHOW TABLES FROM $SCHEMA"); do
        query TSV "DROP TABLE $SCHEMA.$table" >/dev/null
    done
    run_sync "$SYNC_DIR/github" SYNC_STEPS=tables
}

function run_sync() {
    local steps_dir=$1
    shift
    if [ ! -f "$JDBC_JAR" ]; then
        curl -fLsS -o "$JDBC_JAR" https://repo1.maven.org/maven2/io/trino/trino-jdbc/$TRINO_VERSION/trino-jdbc-$TRINO_VERSION.jar
    fi
    env \
        SYNC_TRINO_URL=jdbc:trino://localhost:$PORT \
        SYNC_STEPS_DIR="$steps_dir" \
        "$@" \
        java -cp "$JDBC_JAR" "$SYNC_DIR/Sync.java"
}

function connectors() {
    local run_ids pull_numbers since
    # completed runs, so their jobs don't change between reading them with both connectors
    run_ids=$(query TSV "SELECT array_join(array_agg(id), ', ') FROM (SELECT DISTINCT id FROM legacy.v2.runs WHERE owner = '$OWNER' AND repo = '$REPO' AND status = 'completed' ORDER BY id DESC LIMIT 5)")
    pull_numbers=$(query TSV "SELECT array_join(array_agg(number), ', ') FROM (SELECT DISTINCT number FROM legacy.v2.reviews r JOIN legacy.v2.pulls p ON p.number = r.pull_number WHERE r.owner = '$OWNER' AND r.repo = '$REPO' ORDER BY number DESC LIMIT 5)")
    since=$(date -u -v-1d '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -u -d '1 day ago' '+%Y-%m-%d %H:%M:%S')
    render "$SCRIPT_DIR/connectors.sql" run_ids="$run_ids" pull_numbers="$pull_numbers" since="$since" | query_file
}

function compare() {
    if [ "$#" -ne 2 ]; then
        echo >&2 "Usage: $0 compare cutoff until"
        exit 1
    fi
    render "$SCRIPT_DIR/sync.sql" cutoff="$1" until="$2" | query_file
}

function reports() {
    local base=$1
    local out_dir=$SCRIPT_DIR/.data/reports
    rm -rf "$out_dir"
    mkdir -p "$out_dir/legacy" "$out_dir/new"
    # the files with reports that run in CI, from the reports workflow, in the same order,
    # because the first PR report creates tables that the next ones read
    local files
    files=$(grep -oE 'sql/[a-z/-]+/\{[^}]+\}\.sql|sql/[a-z/-]+\.sql' "$SCRIPT_DIR/../../.github/workflows/reports.yml" | while read -r pattern; do eval "echo $pattern"; done | tr ' ' '\n')
    local file name
    for file in $files; do
        name=$(echo "$file" | tr / _)
        git -C "$SCRIPT_DIR" show "$base:$file" >"$out_dir/legacy/$name.sql"
        run_report "$LEGACY_CONTAINER_NAME" legacy v2 "$out_dir/legacy/$name.sql" "$out_dir/legacy/$name"
        run_report "$CONTAINER_NAME" trinocicd github "$SCRIPT_DIR/../../$file" "$out_dir/new/$name"
        if cmp -s "$out_dir/legacy/$name.normalized" "$out_dir/new/$name.normalized"; then
            echo "same      $file"
        else
            echo "different $file ($(diff "$out_dir/legacy/$name.normalized" "$out_dir/new/$name.normalized" | grep -c '^[<>]') lines)"
        fi
    done
    echo >&2 "Results are in $out_dir"
}

# Runs a report, and saves its results, with timestamps normalized to milliseconds, which the old tables have.
function run_report() {
    local container=$1 catalog=$2 schema=$3 file=$4 out=$5
    docker exec -i "$container" trino --catalog "$catalog" --schema "$schema" --output-format=CSV_HEADER <"$file" >"$out.csv" 2>"$out.err" ||
        echo >&2 "$container: $file failed: $(grep -v -iE 'jline|^WARNING: Unable' "$out.err" | head -1)"
    perl -pe 's/(\d{2}:\d{2}:\d{2}\.\d{3})000\b/$1/g' "$out.csv" >"$out.normalized"
}

# Replaces ${name} placeholders with values given as name=value arguments.
function render() {
    local file=$1
    shift
    local script
    script=$(cat "$file")
    local pair
    for pair in "$@"; do
        script=${script//"\${${pair%%=*}}"/${pair#*=}}
    done
    echo "$script"
}

function query() {
    local format=$1
    local sql=$2
    docker exec "$CONTAINER_NAME" trino --output-format="$format" --execute "$sql" 2> >(grep -v -iE 'jline|^WARNING: Unable' >&2)
}

function query_file() {
    docker exec -i "$CONTAINER_NAME" trino --output-format=ALIGNED 2> >(grep -v -iE 'jline|^WARNING: Unable' >&2)
}

main "$@"
