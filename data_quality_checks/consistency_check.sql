--- CONSISTENCY CHECK: Barcode format inconsistencies
--- Identifies misplaced or incorrectly formatted barcodes

SELECT
  'brands' AS table_name,
  COUNT(*) AS total_records,
  COUNTIF(SAFE_CAST(barcode AS STRING) LIKE '511111%') AS standard_barcode_format,
  COUNTIF(SAFE_CAST(barcode AS STRING) NOT LIKE '511111%') AS non_standard_format,
  COUNTIF(brand_code LIKE '511111%') AS brand_code_barcode_look_a_like
FROM `fetch-coding-challenge.fetch_data_clean_stg.brands_stg`
UNION ALL
SELECT
  'receipt_items' AS table_name,
  COUNT(*) AS total_records,
  COUNTIF(SAFE_CAST(barcode AS STRING) LIKE '511111%') AS standard_barcode_format,
  COUNTIF(SAFE_CAST(barcode AS STRING) NOT LIKE '511111%') AS non_standard_format,
  COUNTIF(brand_code LIKE '511111%') AS brand_code_barcode_look_a_like
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipt_items_stg`