#!/usr/bin/env bash

set -euo pipefail

declare -A queries
queries[runs-queue-time-per-week.sql]="Runs queue time per week"

mkdir -p reports
{
    echo "Trino CI/CD reports"
    echo "==================="
    echo ""
} >reports/index.md

for file in "${!queries[@]}"; do
    title="${queries[$file]}"
    {
        echo "# $title"
        echo '```'
        docker exec \
            trino \
            trino --catalog hive --schema v2 \
            -f "/sql/$file" \
            --output-format=ALIGNED
        echo '```'
        echo "[query]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/blob/$GITHUB_SHA/sql/$file)"
        echo ""
    } >>reports/index.md
done
