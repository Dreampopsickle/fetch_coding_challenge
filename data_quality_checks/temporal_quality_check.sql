---TEMPORAL QUALITY CHECK: Brand identification by month
--- how data quality changes over time

WITH monthly_stats AS (
  SELECT
    FORMAT_DATE('%Y-%m', r.date_scanned) AS month,
    COUNT(ri.receipt_id) AS total_items,
    COUNTIF(ri.barcode IS NOT NULL OR ri.brand_code IS NOT NULL) AS identifiable_items
  FROM `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg` r 
  JOIN `fetch-coding-challenge.fetch_data_clean_stg.receipt_items_stg` ri   
  ON r.receipt_id = ri.receipt_id
  WHERE r.date_scanned IS NOT NULL
  GROUP BY FORMAT_DATE('%Y-%m', r.date_scanned)
)

SELECT
  month,
  total_items,
  identifiable_items,
  ROUND((identifiable_items / total_items) * 100, 2) AS pct_identifiable
FROM monthly_stats
ORDER by month DESC