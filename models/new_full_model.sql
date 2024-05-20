MODEL (
  name sqlmesh_example.new_full_model,
  kind FULL,
  cron '@daily',
  owner afzal,
  grain event_date
);

SELECT
  event_date,
  COUNT(DISTINCT id) AS num_id, /* total number of IDs */
  COUNT(*) AS total_rows /* total number of rows in table */
FROM sqlmesh_example.seed_model
GROUP BY
  1