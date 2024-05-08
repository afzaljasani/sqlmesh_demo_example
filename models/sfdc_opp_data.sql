MODEL (
  name sqlmesh_example.sfdc_opp_model,
  kind SEED (
    path '../seeds/sfdc_opp.csv'
  ),
  columns (
    opportunity_id INT,
    opportunity_name TEXT,
    opportunity_probability REAL,
    opportunity_amount INT,
    opportunity_stage TEXT,
    close_date DATE
  ),
  grain (
    opportunity_id
  )
)