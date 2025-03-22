---When considering average spend from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
SELECT
  ROUND(AVG(total_spent), 2) avg_spend,
  rewards_receipt_status
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg`
WHERE rewards_receipt_status IN ('FINISHED', 'REJECTED')
GROUP BY 2
ORDER BY avg_spend DESC

---results: "FINISHED" had an average spend of $80.85, "REJECTED" had an average spend of $23.33, thus "FINISHED" had the greater average spend.
---Question: Is "ACCEPTED" defined by "FINISHED" in the receipts table?