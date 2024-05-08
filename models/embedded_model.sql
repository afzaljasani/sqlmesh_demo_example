MODEL (
  name sqlmesh_example.embedded_test,
  kind EMBEDDED
);

SELECT
  item_id,
  COUNT(DISTINCT id) AS num_orders
FROM sqlmesh_example.incremental_model
GROUP BY
  item_id