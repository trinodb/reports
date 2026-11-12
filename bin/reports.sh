#!/usr/bin/env bash
#
# Generate the pages of reports in reports/, from the queries in sql/, with sql/Reports.java.
# Generates all pages listed in sql/pages.properties, or only the ones given as arguments, like: bin/reports.sh overview
#
# Needs Trino started by bin/run-trino.sh git, or at TRINO_URL. Reports.java runs the queries with the client in the
# Trino CLI, which it copies from the Trino image first, so it's the same version as the server.

set -euo pipefail

for cmd in docker java; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

cd "$(dirname -- "${BASH_SOURCE[0]}")/.."
source bin/versions.env

jar=bin/trino-cli-$TRINO_VERSION.jar
if [ ! -f "$jar" ]; then
    container=$(docker create "trinodb/trino:$TRINO_VERSION")
    docker cp -q "$container:/usr/bin/trino" "$jar"
    docker rm "$container" >/dev/null
fi

exec java -cp "$jar" sql/Reports.java "$@"
