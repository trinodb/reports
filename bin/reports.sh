#!/usr/bin/env bash

set -euo pipefail

for cmd in aha docker; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

queries=(
    "health.sql"
    "runs-queue-time-per-day.sql"
    "runs-duration-per-day.sql"
    "jobs-duration.sql"
    "flaky-tests.sql"
)

titles=(
    "CI workflow health"
    "Runs queue time per day"
    "Runs duration per day"
    "Job duration in last 30 days"
    "Flaky tests per week"
)

if [ "${#queries[@]}" -ne "${#titles[@]}" ]; then
    echo >&2 "Length of queries (${#queries[@]}) is different than titles (${#titles[@]})"
    exit 1
fi

mkdir -p reports
{
    echo "Trino CI/CD reports"
    echo "==================="
    echo ""
} >reports/index.md

for index in "${!queries[@]}"; do
    file=${queries[$index]}
    title="${titles[$index]}"
    {
        echo "# $title"
        echo '<pre><code>'
        docker exec \
            trino \
            trino --catalog hive --schema v2 \
            -f "/sql/$file" \
            --output-format=ALIGNED | aha -n
        echo '</code></pre>'
        echo "[query]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/blob/$GITHUB_SHA/sql/$file)"
        echo ""
    } >>reports/index.md
done

echo "Generated on $(date)" >>reports/index.md
