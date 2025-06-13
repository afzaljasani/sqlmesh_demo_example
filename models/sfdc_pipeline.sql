MODEL (
  name sqlmesh_example.sfdc_pipeline,
  audits (DOES_NOT_EXCEED_THRESHOLD(column = expected_amount, threshold = 100000), NOT_NULL(columns = (
    opportunity_name
  ))),
  kind VIEW,
  owner afzal,
  grain (
    id
  )
);

SELECT
  opportunity_id AS id, /* primary key of opportunity table */
  opportunity_name, /* name of the opportunity */
  opportunity_stage, /* stage name from salesforce */
  close_date, /* this is the projected closed date */
  ROUND(opportunity_probability * opportunity_amount, 2) AS expected_amount,
  CASE
    WHEN opportunity_stage = 'demo'
    THEN 3.99 * opportunity_probability
    ELSE NULL
  END AS opportunity_probability_new /* custom probability forecasting */

FROM sqlmesh_example.sfdc_opp_model