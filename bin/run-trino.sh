#!/usr/bin/env bash
#
# Start Trino in a container called trino, listening on port 8080, and wait for it to be ready.
#
# It always has the trinocicd catalog, with the tables that the sync writes, and the catalogs given as arguments:
# * git - the trinodb/trino repository, which reports read for commits and their authors
# * github - the GitHub API, which the GitHub sync reads, with GITHUB_TOKEN
# * slack - the Slack API, which the Slack sync reads, with SLACK_API_TOKEN
#
# The workflows use it too, so they all run the same Trino, with the plugin versions from versions.env.

set -euo pipefail

for cmd in curl unzip docker; do
    if ! command -v "$cmd" >/dev/null; then
        echo >&2 "Missing the $cmd command"
        exit 1
    fi
done

cd "$(dirname -- "${BASH_SOURCE[0]}")/.."
source bin/versions.env

CONTAINER_NAME=trino

if docker inspect "$CONTAINER_NAME" >/dev/null 2>&1; then
    echo >&2 "The $CONTAINER_NAME container already exists, remove it with: docker rm -f $CONTAINER_NAME"
    exit 1
fi

function download_plugin() {
    local name=$1
    local version=$2
    if [ ! -d "bin/$name-$version" ]; then
        curl -fLsS -o "bin/$name-$version.zip" "https://github.com/nineinchnick/$name/releases/download/v$version/$name-$version.zip"
        unzip -q "bin/$name-$version.zip" -d bin
        rm "bin/$name-$version.zip"
    fi
}

function require_env() {
    for name in "$@"; do
        if [ -z "${!name:-}" ]; then
            echo >&2 "The $name environment variable needs to be set"
            exit 1
        fi
    done
}

mkdir -p hive-cache http-cache
for dir in hive-cache http-cache; do
    # the sync workflow gives the HTTP cache it restores to the user running Trino, so it can't be changed here
    if [ -O "$dir" ]; then
        chmod go+w "$dir"
    fi
done
args=(
    -v "$PWD/etc/config.properties:/etc/trino/config.properties"
    -v "$PWD/etc/cache-manager-alluxio.properties:/etc/trino/cache-manager-alluxio.properties"
    -v "$PWD/hive-cache:/opt/hive-cache"
    -v "$PWD/catalog/trinocicd.properties:/etc/trino/catalog/trinocicd.properties"
)
require_env AWS_REGION

for catalog in "$@"; do
    case "$catalog" in
        git)
            download_plugin trino-git "$TRINO_GIT_VERSION"
            args+=(
                -v "$PWD/bin/trino-git-$TRINO_GIT_VERSION:/usr/lib/trino/plugin/git"
                -v "$PWD/catalog/git.properties:/etc/trino/catalog/git.properties"
            )
            ;;
        github | slack)
            download_plugin trino-openapi "$TRINO_OPENAPI_VERSION"
            args+=(
                -v "$PWD/bin/trino-openapi-$TRINO_OPENAPI_VERSION:/usr/lib/trino/plugin/openapi"
                -v "$PWD/sync/specs/$catalog.json:/etc/trino/specs/$catalog.json"
                -v "$PWD/catalog/$catalog.properties:/etc/trino/catalog/$catalog.properties"
            )
            if [ "$catalog" = github ]; then
                require_env GITHUB_TOKEN
                args+=(-v "$PWD/http-cache:/opt/http-cache")
            else
                require_env SLACK_API_TOKEN
            fi
            ;;
        *)
            echo >&2 "Unknown catalog: $catalog, use git, github, or slack"
            exit 1
            ;;
    esac
done

docker run \
    "${args[@]}" \
    -e AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY \
    -e AWS_SESSION_TOKEN \
    -e AWS_REGION \
    -e GITHUB_TOKEN \
    -e SLACK_API_TOKEN \
    -p 8080:8080 \
    --name "$CONTAINER_NAME" \
    -d \
    "trinodb/trino:$TRINO_VERSION" >/dev/null

i=0
until status=$(docker inspect "$CONTAINER_NAME" --format "{{json .State.Health.Status }}") && echo "$status" | grep -q '"healthy"'; do
    if [[ $((i++)) -ge 20 ]]; then
        echo >&2 "Too many retries waiting for Trino to start, check: docker logs $CONTAINER_NAME"
        exit 1
    fi
    echo >&2 "Status is: $status, sleeping 10 seconds"
    sleep 10
done

echo >&2 "Trino is ready, connect to trino://localhost:8080/trinocicd/github"
