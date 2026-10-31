# OpenAPI specs

The OpenAPI connector reads the tables and their columns from these specs.
They're kept here, instead of being downloaded when the sync runs, because the
patched versions aren't released as files, and the upstream specs change
almost every day.

## GitHub

`github.json` is GitHub's
[REST API description](https://github.com/github/rest-api-description), MIT
licensed, from commit `bb754941722779d8a5b3a2f25a5fbb7ce794e1ea`, with the
changes from `github.patch.json`. The patch and `merge-patch.jq` come from
`dev/specs` in [trino-openapi](https://github.com/nineinchnick/trino-openapi)
v2.2, with the patch reduced to the operations of the tables that `sync/github`
and `sync/verify` read.

The patch is a [JSON Merge Patch](https://www.rfc-editor.org/rfc/rfc7386). It
merges objects recursively, removes members set to `null`, and replaces any
other value, so changing one element of an array requires the whole array in
the patch. It adds `x-trino` extensions:

* to the whole document, with the headers of GitHub's
  [rate limits](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api),
  so queries wait until an exceeded limit resets, and `errorPath`, so failed
  queries show GitHub's error message;
* to the paginated operations the sync reads, with the page and limit
  parameters, and `parameterDefaults` that read the most rows per request, like
  `per_page` set to 100, and `state` and `filter` set to `all`, so queries read
  closed issues and pull requests, and jobs and check runs of all attempts;
* to operations that can sort or filter by time, so the connector pushes down
  `ORDER BY` on `created_at` or `updated_at`, and lower bounds of `updated_at`
  as the `since` parameter.

To update the spec, choose a newer commit of the upstream repository, and run
from the repository root, with `jq` 1.7 or newer, which keeps number literals
unchanged:

```shell
REF=bb754941722779d8a5b3a2f25a5fbb7ce794e1ea
curl -fsSL -o /tmp/github.json "https://raw.githubusercontent.com/github/rest-api-description/$REF/descriptions/api.github.com/api.github.com.json"
jq --indent 2 --slurpfile patch sync/specs/github.patch.json -f sync/specs/merge-patch.jq /tmp/github.json > sync/specs/github.json
```

Then update the commit in this file, and check that the tables used by
`sync/github` still have the same columns, for example by running
`./sync/verify/verify.sh reset` and the sync.

Other tables of the `github` catalog return only the first page of results.
Before a step reads another paginated operation, add it to the patch, for
example by copying its entry from the patch in trino-openapi.
