--- VALIDITY CHECK: Implausible values in receipt data
--- Identifies outliers that may indicate data issues

SELECT
  MIN(total_spent) AS min_spent,
  MAX(total_spent) AS max_spent,
  AVG(total_spent) AS avg_spent,
  COUNTIF(total_spent < 0) AS negative_totals,
  COUNTIF(total_spent > 1000) AS suspiciously_high_totals,
  COUNTIF(purchased_item_count > 100) AS suspiciously_high_item_counts,
  COUNTIF(DATE(purchase_date) > CURRENT_DATE()) AS future_dated_purchases
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg`