
-- this is not a report, just a setup
-- functions shared by all reports, so the same things are drawn and counted the same way everywhere

-- automation accounts, which are not people; accounts without the [bot] suffix are listed by name
CREATE OR REPLACE FUNCTION memory.default.is_bot(login varchar)
RETURNS boolean
RETURN coalesce(login LIKE '%[bot]' OR login IN ('Copilot', 'academy-codex', 'rclaude', 'starburstdata-automation', 'web-flow'), false);

-- a horizontal bar of up to `width` characters; a value too small for one character is drawn as a thin line
CREATE OR REPLACE FUNCTION memory.default.hbar(value double, max_value double, width integer)
RETURNS varchar
RETURN CASE
    WHEN value IS NULL OR max_value IS NULL OR max_value <= 0 OR value <= 0 THEN ''
    WHEN round(least(value / max_value, 1) * width) < 1 THEN '▏'
    ELSE rpad('', cast(round(least(value / max_value, 1) * width) AS integer), '█')
END;

-- one character per value, scaled to `max_value`; a missing value is a space, and zero is a dot
CREATE OR REPLACE FUNCTION memory.default.sparkline(vals array(double), max_value double)
RETURNS varchar
RETURN array_join(transform(vals, v -> CASE
    WHEN v IS NULL THEN ' '
    WHEN v <= 0 OR max_value IS NULL OR max_value <= 0 THEN '.'
    ELSE element_at(ARRAY['▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'], greatest(1, least(8, cast(ceil(v * 8 / max_value) AS integer))))
END), '');

-- one character per value, oldest first, scaled to the largest value
CREATE OR REPLACE FUNCTION memory.default.sparkline(vals array(double))
RETURNS varchar
RETURN memory.default.sparkline(vals, reduce(vals, 0e0, (s, v) -> greatest(s, coalesce(v, 0e0)), s -> s));

-- a bar of exactly `width` characters split between the parts, drawn with one glyph per part, like '█▒░'
CREATE OR REPLACE FUNCTION memory.default.stacked(parts array(double), glyphs varchar, width integer)
RETURNS varchar
RETURN CASE
    WHEN reduce(parts, 0e0, (s, v) -> s + coalesce(v, 0e0), s -> s) <= 0 THEN ''
    ELSE array_join(transform(sequence(1, cardinality(parts)), i -> rpad(
        '',
        cast(round(reduce(slice(parts, 1, i), 0e0, (s, v) -> s + coalesce(v, 0e0), s -> s) * width / reduce(parts, 0e0, (s, v) -> s + coalesce(v, 0e0), s -> s))
            - round(reduce(slice(parts, 1, i - 1), 0e0, (s, v) -> s + coalesce(v, 0e0), s -> s) * width / reduce(parts, 0e0, (s, v) -> s + coalesce(v, 0e0), s -> s)) AS integer),
        substr(glyphs, i, 1))), '')
END;

-- a position of a duration on a log scale from 1 minute to 1 year, from 1 to `width`, so box plots of every row share one axis
CREATE OR REPLACE FUNCTION memory.default.log_position(seconds double, width integer)
RETURNS integer
RETURN CAST(greatest(0, least(width - 1, round((ln(greatest(seconds, 60)) - ln(60)) / (ln(365 * 86400) - ln(60)) * (width - 1)))) AS integer) + 1;

-- a box plot of durations on a log scale from 1 minute to 1 year: whiskers from the 10th to the 90th percentile, a box from
-- the 25th to the 75th, and the median
CREATE OR REPLACE FUNCTION memory.default.boxplot(p10 double, p25 double, p50 double, p75 double, p90 double, width integer)
RETURNS varchar
RETURN CASE
    WHEN p50 IS NULL THEN ''
    ELSE array_join(transform(sequence(1, width), i -> CASE
        WHEN i = memory.default.log_position(p50, width) THEN '█'
        WHEN i BETWEEN memory.default.log_position(p25, width) AND memory.default.log_position(p75, width) THEN '▒'
        WHEN i BETWEEN memory.default.log_position(p10, width) AND memory.default.log_position(p90, width) THEN '─'
        ELSE ' '
    END), '')
END;

-- one heatmap cell: a space for nothing, and darker shades for larger values
CREATE OR REPLACE FUNCTION memory.default.shade(value double, max_value double)
RETURNS varchar
RETURN CASE
    WHEN value IS NULL OR value <= 0 OR max_value IS NULL OR max_value <= 0 THEN ' '
    ELSE element_at(ARRAY['░', '▒', '▓', '█'], greatest(1, least(4, cast(ceil(value * 4 / max_value) AS integer))))
END;

-- durations as people say them: 45s, 12m 05s, 3h 20m, 4d 6h
CREATE OR REPLACE FUNCTION memory.default.human_duration(seconds double)
RETURNS varchar
RETURN CASE
    WHEN seconds IS NULL THEN NULL
    WHEN abs(seconds) < 60 THEN format('%s%ds', if(seconds < 0, '-', ''), cast(round(abs(seconds)) AS bigint))
    WHEN abs(seconds) < 3600 THEN format('%s%dm %02ds', if(seconds < 0, '-', ''), cast(floor(abs(seconds) / 60) AS bigint), cast(floor(abs(seconds)) AS bigint) % 60)
    WHEN abs(seconds) < 86400 THEN format('%s%dh %02dm', if(seconds < 0, '-', ''), cast(floor(abs(seconds) / 3600) AS bigint), cast(floor(abs(seconds) / 60) AS bigint) % 60)
    ELSE format('%s%dd %dh', if(seconds < 0, '-', ''), cast(floor(abs(seconds) / 86400) AS bigint), cast(floor(abs(seconds) / 3600) AS bigint) % 24)
END;

-- the largest interval type, which the difference of two timestamps has, and to which shorter intervals are coerced
CREATE OR REPLACE FUNCTION memory.default.human_duration(duration interval day(9) to second(6))
RETURNS varchar
RETURN memory.default.human_duration(to_milliseconds(duration) / 1000e0);

-- the change against a previous period: ▲ +12%, ▼ -5%
CREATE OR REPLACE FUNCTION memory.default.delta(current_value double, previous_value double)
RETURNS varchar
RETURN CASE
    WHEN current_value IS NULL OR previous_value IS NULL OR previous_value = 0 THEN ''
    WHEN round((current_value - previous_value) * 100 / abs(previous_value)) > 0 THEN format('▲ +%d%%', cast(round((current_value - previous_value) * 100 / abs(previous_value)) AS bigint))
    WHEN round((current_value - previous_value) * 100 / abs(previous_value)) < 0 THEN format('▼ %d%%', cast(round((current_value - previous_value) * 100 / abs(previous_value)) AS bigint))
    ELSE '= 0%'
END;

-- links, in the format that bin/reports.sh turns into anchors
CREATE OR REPLACE FUNCTION memory.default.pr_link(number bigint)
RETURNS varchar
RETURN format('"#%d"@https://github.com/trinodb/trino/pull/%d ', number, number);

CREATE OR REPLACE FUNCTION memory.default.user_link(login varchar)
RETURNS varchar
RETURN format('"%s"@https://github.com/%s ', login, login);
