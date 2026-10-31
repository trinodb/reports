#!/usr/bin/env bash
#
# Start a Trino container to verify the migration from trino-rest to
# trino-openapi, with these catalogs:
# * legacy - the current Hive tables, read-only
# * rest - the trino-rest GitHub connector
# * github - the OpenAPI connector with the GitHub spec from sync/specs
# * trinocicd - a scratch Iceberg catalog in sync/verify/.data
# * git - the Git connector, used by some reports
# * memory - used by some reports
#
# See the "Phase 0" section in sync/MIGRATION.md.

set -euo pipefail

for cmd in curl unzip docker; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

if [ -z "${AWS_REGION:-}" ] || [ -z "${AWS_ACCESS_KEY_ID:-}" ] || [ -z "${AWS_SECRET_ACCESS_KEY:-}" ] || [ -z "${GITHUB_TOKEN:-}" ]; then
    echo >&2 "Following environmental variables need to be set: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, GITHUB_TOKEN"
    exit 1
fi

CONTAINER_NAME=${CONTAINER_NAME:-trino-verify}
PORT=${PORT:-8081}
TRINO_VERSION=484
TRINO_OPENAPI_VERSION=2.2
TRINO_REST_VERSION=0.178
TRINO_GIT_VERSION=1.0

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
PLUGINS_DIR="$SCRIPT_DIR/.plugins"
DATA_DIR="$SCRIPT_DIR/.data"
mkdir -p "$PLUGINS_DIR" "$DATA_DIR/metastore" "$DATA_DIR/http-cache"
chmod -R go+w "$DATA_DIR"
cd "$PLUGINS_DIR"

if [ ! -d trino-openapi-$TRINO_OPENAPI_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-openapi/releases/download/v$TRINO_OPENAPI_VERSION/trino-openapi-$TRINO_OPENAPI_VERSION.zip
    unzip -q trino-openapi-$TRINO_OPENAPI_VERSION.zip
fi

if [ ! -d trino-rest-github-$TRINO_REST_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-rest/releases/download/v$TRINO_REST_VERSION/trino-rest-github-$TRINO_REST_VERSION.zip
    unzip -q trino-rest-github-$TRINO_REST_VERSION.zip
fi

if [ ! -d trino-git-$TRINO_GIT_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-git/releases/download/v$TRINO_GIT_VERSION/trino-git-$TRINO_GIT_VERSION.zip
    unzip -q trino-git-$TRINO_GIT_VERSION.zip
fi

docker run \
    -v "$PLUGINS_DIR"/trino-openapi-$TRINO_OPENAPI_VERSION:/usr/lib/trino/plugin/openapi \
    -v "$SCRIPT_DIR"/../specs/github.json:/etc/trino/specs/github.json \
    -v "$PLUGINS_DIR"/trino-rest-github-$TRINO_REST_VERSION:/usr/lib/trino/plugin/github \
    -v "$PLUGINS_DIR"/trino-git-$TRINO_GIT_VERSION:/usr/lib/trino/plugin/git \
    -v "$SCRIPT_DIR"/catalog:/etc/trino/catalog \
    -v "$SCRIPT_DIR"/log.properties:/etc/trino/log.properties \
    -v "$DATA_DIR":/data \
    -v "$SCRIPT_DIR"/../..:/reports \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_REGION \
    -e GITHUB_TOKEN \
    -p "$PORT":8080 \
    --name "$CONTAINER_NAME" \
    -d \
    trinodb/trino:$TRINO_VERSION

i=0
until status=$(docker inspect "$CONTAINER_NAME" --format "{{json .State.Health.Status }}") && echo "$status" | grep -q '"healthy"'; do
    if [[ $((i++)) -ge 10 ]]; then
        echo >&2 "🚨 Too many retries waiting for Trino to start"
        exit 1
    fi
    echo >&2 "Status is: $status, sleeping 10 seconds"
    sleep 10
done

echo >&2 "Status is: $status, connect to trino://localhost:$PORT/trinocicd/github"
