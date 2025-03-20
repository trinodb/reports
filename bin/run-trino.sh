#!/usr/bin/env bash
#
# Start a Trino container with additional connectors and catalogs
# configured and wait for it to be ready.

set -euo pipefail

for cmd in curl unzip docker; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

if [ -z "$AWS_REGION" ] || [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$GITHUB_TOKEN" ] || [ -z "$SLACK_API_TOKEN" ]; then
    echo >&2 "Following environmental variables need to be set: AWS_REGION, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, GITHUB_TOKEN, SLACK_API_TOKEN"
    exit 1
fi

CONTAINER_NAME=trino
TRINO_VERSION=473
TRINO_GIT_VERSION=0.95
TRINO_REST_VERSION=0.168

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
cd "$SCRIPT_DIR" || exit 1

if [ ! -d trino-git-$TRINO_GIT_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-git/releases/download/v$TRINO_GIT_VERSION/trino-git-$TRINO_GIT_VERSION.zip
    unzip trino-git-$TRINO_GIT_VERSION.zip
fi

if [ ! -d trino-rest-github-$TRINO_REST_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-rest/releases/download/v$TRINO_REST_VERSION/trino-rest-github-$TRINO_REST_VERSION.zip
    unzip trino-rest-github-$TRINO_REST_VERSION.zip
fi

if [ ! -d trino-rest-slack-$TRINO_REST_VERSION ]; then
    curl -fLOsS https://github.com/nineinchnick/trino-rest/releases/download/v$TRINO_REST_VERSION/trino-rest-slack-$TRINO_REST_VERSION.zip
    unzip trino-rest-slack-$TRINO_REST_VERSION.zip
fi

cat <<EOF >config.properties
coordinator=true
node-scheduler.include-coordinator=true
http-server.http.port=8080
discovery.uri=http://localhost:8080
query.max-memory-per-node=4086929818B
EOF

mkdir -p "$SCRIPT_DIR"/hive-cache
chmod 777 "$SCRIPT_DIR"/hive-cache
docker run \
    -v "$SCRIPT_DIR"/config.properties:/etc/trino/config.properties \
    -v "$SCRIPT_DIR"/trino-git-$TRINO_GIT_VERSION:/usr/lib/trino/plugin/git \
    -v "$SCRIPT_DIR"/trino-rest-github-$TRINO_REST_VERSION:/usr/lib/trino/plugin/github \
    -v "$SCRIPT_DIR"/trino-rest-slack-$TRINO_REST_VERSION:/usr/lib/trino/plugin/slack \
    -v "$SCRIPT_DIR"/../catalog/git.properties:/etc/trino/catalog/git.properties \
    -v "$SCRIPT_DIR"/../catalog/github.properties:/etc/trino/catalog/github.properties \
    -v "$SCRIPT_DIR"/../catalog/slack.properties:/etc/trino/catalog/slack.properties \
    -v "$SCRIPT_DIR"/../catalog/trinocicd.properties:/etc/trino/catalog/trinocicd.properties \
    -v "$SCRIPT_DIR"/hive-cache:/opt/hive-cache \
    -v "$SCRIPT_DIR"/../sql:/sql \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_REGION \
    -e GITHUB_TOKEN \
    -e SLACK_API_TOKEN \
    -p 8080:8080 \
    --name $CONTAINER_NAME \
    -d \
    trinodb/trino:$TRINO_VERSION

i=0
until status=$(docker inspect $CONTAINER_NAME --format "{{json .State.Health.Status }}") && echo "$status" | grep -q '"healthy"'; do
    if [[ $((i++)) -ge 10 ]]; then
        echo >&2 "🚨 Too many retries waiting for Trino to start"
        exit 1
    fi
    echo >&2 "Status is: $status, sleeping 10 seconds"
    sleep 10
done

echo >&2 "Status is: $status, connect to trino://localhost:8080/trinocicd/v2"
