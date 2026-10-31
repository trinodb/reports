-- Runs cumulative job duration on master per day
-- The cumulative duration should represent how much work is being done
-- and given there's an upper limit on the number of runners available,
-- correlate with the queue duration.
-- Showing all runs from master branch in last 14 days, even failed ones,
-- since there's a very low chance of all jobs finishing successfully.
WITH latest_attempts AS (
  -- runs have a row for every attempt, and the last one has the conclusion of the run
  SELECT
      id
    , max_by(conclusion, (COALESCE(run_attempt, 1), updated_at)) AS conclusion
    , cast(min(created_at) AS date) AS day
  FROM runs
  WHERE owner = 'trinodb' AND repo = 'trino' AND name = 'ci'
  AND created_at > CURRENT_DATE - INTERVAL '14' DAY
  AND head_branch = 'master'
  GROUP BY 1
),
copied_jobs AS (
  -- later attempts include copies of the successful jobs of previous attempts, with their original times
  SELECT DISTINCT later.id
  FROM jobs later
  JOIN jobs earlier ON earlier.run_id = later.run_id AND earlier.name = later.name
    AND earlier.started_at = later.started_at AND earlier.completed_at = later.completed_at
  WHERE COALESCE(earlier.run_attempt, 1) < COALESCE(later.run_attempt, 1)
  AND later.started_at > CURRENT_DATE - INTERVAL '14' DAY
  AND earlier.started_at > CURRENT_DATE - INTERVAL '14' DAY
),
runs AS (
  SELECT
      r.id AS run_id
    , r.conclusion
    , r.day
    , count(j.id) AS jobs_count
    , sum(j.completed_at - j.started_at) AS duration
  FROM latest_attempts r
  JOIN jobs j ON r.id = j.run_id
  LEFT JOIN copied_jobs c ON c.id = j.id
  WHERE c.id IS NULL
  GROUP BY 1, 2, 3
),
main AS (
  SELECT
    r.day
    , max(jobs_count) AS jobs_count
    , min(duration) AS min_dur
    , max(duration) AS max_dur
    , avg(duration) AS avg_dur
    , count(*) AS runs_count
    , count(*) FILTER (WHERE r.conclusion = 'success') AS runs_ok_count
    , approx_percentile(to_milliseconds(duration), ARRAY[0.75, 0.90, 0.95, 0.99]) AS perc
  FROM runs r
  GROUP BY 1
)
SELECT
   day AS "Day"
   , bar(CAST(perc[3] AS double) / max(perc[3]) OVER (), 40, rgb(0, 155, 0), rgb(255, 0, 0)) AS "P₉₅ runs cumulative job duration chart"
   , runs_count AS "Runs count"
   , runs_ok_count AS "Successful runs"
   , jobs_count AS "Max jobs count"
   , transform(perc, m -> parse_duration(cast(m as varchar) || 'ms')) AS "Runs job duration percentiles 75, 90, 95, 99"
   , min_dur AS "Min jobs dur"
   , avg_dur AS "Avg jobs dur"
   , max_dur AS "Max jobs dur"
FROM main
ORDER BY 1 DESC
;
