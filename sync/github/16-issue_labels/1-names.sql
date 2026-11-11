-- Until the issues step saved only the names of labels, it saved whole labels, as JSON objects.
UPDATE trinocicd.github.issues
SET labels = transform(labels, label -> coalesce(json_extract_scalar(label, '$.name'), json_extract_scalar(label, '$')))
WHERE owner = 'trinodb' AND repo = 'trino'
    AND any_match(labels, label -> json_extract_scalar(label, '$.name') IS NOT NULL);
