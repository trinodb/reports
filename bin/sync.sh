#!/usr/bin/env bash
#
# Run the sync program, sync/Sync.java, with the Trino JDBC driver, which it downloads first.
# The settings come from SYNC_* environment variables, described in sync/README.md.

set -euo pipefail

cd "$(dirname -- "${BASH_SOURCE[0]}")/.."
source bin/versions.env

jar=bin/trino-jdbc-$TRINO_VERSION.jar
if [ ! -f "$jar" ]; then
    curl -fLsS -o "$jar" "https://repo1.maven.org/maven2/io/trino/trino-jdbc/$TRINO_VERSION/trino-jdbc-$TRINO_VERSION.jar"
fi

exec java -cp "$jar" sync/Sync.java "$@"
