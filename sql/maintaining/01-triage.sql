-- Open pull requests by who has to act next
-- Work from the top: the first three rows wait on maintainers and reviewers. Approved: the last verdict is an approval, and only approvers spoke after it. No response yet: nobody who reviews in this project commented or reviewed. Waiting on reviewers or on the author: who spoke or pushed last. CLA not signed: it can't be merged until the author signs.
-- The age columns count from when the pull request got into its state. Newcomers have no merged pull request yet. The stale bot closes pull requests 21 days after marking them stale, unless someone acts, and never closes those labeled stale-ignore. Bots' pull requests are not counted.
WITH
counted AS (
    SELECT
        triage_rank
      , triage_label
      , next_actor
      , count(*) AS prs
      , count(*) FILTER (WHERE author_cohort_rank = 1) AS from_newcomers
      , count(*) FILTER (WHERE waiting_since > current_timestamp - INTERVAL '7' DAY) AS under_week
      , count(*) FILTER (WHERE waiting_since <= current_timestamp - INTERVAL '7' DAY AND waiting_since > current_timestamp - INTERVAL '28' DAY) AS under_month
      , count(*) FILTER (WHERE waiting_since <= current_timestamp - INTERVAL '28' DAY AND waiting_since > current_timestamp - INTERVAL '3' MONTH) AS under_quarter
      , count(*) FILTER (WHERE waiting_since <= current_timestamp - INTERVAL '3' MONTH AND waiting_since > current_timestamp - INTERVAL '1' YEAR) AS under_year
      , count(*) FILTER (WHERE waiting_since <= current_timestamp - INTERVAL '1' YEAR) AS over_year
      , approx_percentile(to_milliseconds(current_timestamp - waiting_since) / 1000e0, 0.5) AS median_wait
      , count(*) FILTER (WHERE marked_stale) AS stale
      , count(*) FILTER (WHERE stale_ignored) AS stale_ignored
    FROM memory.default.open_pull_request_states
    GROUP BY GROUPING SETS ((triage_rank, triage_label, next_actor), ())
)
SELECT
    coalesce(triage_label, 'All open pull requests') AS "State"
  , CASE next_actor WHEN 'maintainers' THEN 'Maintainers' WHEN 'reviewers' THEN 'Reviewers' WHEN 'author' THEN 'Author' ELSE '' END AS "Next step by"
  , prs AS "Pull requests"
  , from_newcomers AS "From newcomers"
  , under_week AS "Under 1 week"
  , under_month AS "1 to 4 weeks"
  , under_quarter AS "1 to 3 months"
  , under_year AS "3 to 12 months"
  , over_year AS "Over 1 year"
  , memory.default.human_duration(median_wait) AS "Median wait"
  , stale AS "Marked stale"
  , stale_ignored AS "Labeled stale-ignore"
FROM counted
ORDER BY coalesce(triage_rank, 99)
;
