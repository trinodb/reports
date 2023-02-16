-- Time since last activity on a PR
WITH
    pulls AS (
        SELECT
            owner,
            repo,
            number AS pull_number,
            created_at,
            issue_url
        FROM unique_pulls
        WHERE owner = 'trinodb' AND repo = 'trino'
        AND state = 'open'
    ),
    last_review_comments AS (
        SELECT
            r.pull_number,
            CAST (CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS TIMESTAMP) - max(r.submitted_at) AS time_since_review
        FROM pulls p
        JOIN reviews r ON (r.owner, r.repo, r.pull_number) = (p.owner, p.repo, p.pull_number)
        GROUP BY 1
    ),
    last_pull_comments AS (
        SELECT
            p.pull_number AS pull_number,
            CAST (CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS TIMESTAMP) - max(ic.created_at) AS time_since_comment
        FROM pulls p
        JOIN issue_comments ic ON ic.issue_url = p.issue_url
        GROUP BY 1
    ),
    last_commits AS (
        SELECT
            pc.pull_number,
            CAST (CURRENT_TIMESTAMP AT TIME ZONE 'UTC' AS TIMESTAMP) - max(pc.committer_date) AS time_since_commit
        FROM pulls p
        JOIN pull_commits pc ON (pc.owner, pc.repo, pc.pull_number) = (p.owner, p.repo, p.pull_number)
        GROUP BY 1
    ),
    last_activity AS (
        SELECT
            least(
              COALESCE(time_since_review, INTERVAL '36500' day),
              COALESCE(time_since_comment, INTERVAL '36500' day),
              COALESCE(time_since_commit, INTERVAL '36500' day)
                ) tsla,
            p.pull_number
        FROM pulls p
        LEFT JOIN last_commits lc ON lc.pull_number = p.pull_number
        LEFT JOIN last_pull_comments lpc ON lpc.pull_number = p.pull_number
        LEFT JOIN last_review_comments lrc ON lrc.pull_number = p.pull_number
    ),
    histogram AS (
      SELECT
          tsla AS key,
          width_bucket(
          to_milliseconds(tsla) / 60000.0,
          ARRAY [0,
          1440,
          4320,
          10080,
          20160,
          30240,
          43200,
          129600]
          ) AS bucket,
          count (*) AS value,
          ARRAY_AGG(pull_number) as num
      FROM last_activity
      GROUP BY tsla
    ),
    grouped AS (
        SELECT
            bucket,
            element_at(
            ARRAY ['up to 24 hours ago',
            '1 to 3 days ago',
            '3 to 7 days ago',
            '7 to 14 days ago',
            '14 to 21 days ago',
            '21 to 30 days ago',
            '30 to 90 days ago',
            'over 90 days ago'],
            bucket
            ) AS "last activity",
            sum (value) AS count,
            ARRAY_SORT(FLATTEN(ARRAY_AGG(num))) AS "pull request IDs"
        FROM
            histogram
        GROUP BY bucket
        ORDER BY bucket
    )
SELECT
    "last activity",
    count,
    "pull request IDs"
FROM grouped
ORDER BY bucket;
