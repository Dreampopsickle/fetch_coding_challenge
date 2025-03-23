---Trim columns for format standardization
CREATE OR REPLACE TABLE `fetch-coding-challenge.fetch_data_clean_stg.brands_stg` AS 
  SELECT
  TRIM(_id) AS brand_id,
  barcode AS barcode,
  brandCode AS brand_code,
  TRIM(category) AS category,
  TRIM(categoryCode) AS category_code,
  TRIM(cpg.ref) AS cpg_ref,
  TRIM(cpg.id) AS cpg_id,
  TRIM(name) AS name,
  topBrand AS top_brand 
  FROM `fetch-coding-challenge.fetch_data.brands`