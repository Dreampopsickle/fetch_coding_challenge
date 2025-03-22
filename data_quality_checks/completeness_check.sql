-- COMPLETENESS CHECK: Missing key identifiers in receipt_items
-- Quantifies NULL values in key linking fields
SELECT  
  COUNT(*) AS total_receipt_items,
  COUNTIF(barcode IS NULL) AS missing_barcode_count,
  COUNTIF(brand_code IS NULL) AS missing_brand_code_count,
  COUNTIF(barcode IS NULL AND brand_code IS NULL) AS missing_both_count,
  ROUND(COUNTIF(barcode IS NULL AND brand_code IS NULL) / COUNT(*) * 100, 2) AS pct_unidentifiable_items
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipt_items_stg` 