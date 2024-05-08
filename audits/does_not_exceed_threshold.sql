Audit (
  name does_not_exceed_threshold
);

SELECT
  *
FROM @this_model
WHERE
  @column >= @threshold