MODEL (
  name sqlmesh_example.incremental_test,
  kind INCREMENTAL_BY_UNIQUE_KEY (
    unique_key opportunity_id,
  ),
  cron '@daily',
  grain (opportunity_id)
);

SELECT
  opportunity_id, /* primary key */
  opportunity_probability * opportunity_amount as forecasted_amount,
  AVG(opportunity_amount) OVER (ORDER BY opportunity_id) AS total_amount
FROM sqlmesh_example.sfdc_opp_model

