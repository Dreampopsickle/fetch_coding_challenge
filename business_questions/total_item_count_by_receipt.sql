--- When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
SELECT
  SUM(purchased_item_count) AS total_item_count,
  rewards_receipt_status
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg`
WHERE rewards_receipt_status IN ('FINISHED', 'REJECTED')
GROUP BY 2
ORDER BY total_item_count DESC

---Results: "FINISHED" had a total item count of 8184, "REJECTED" had a total item count of 173, thus "FINISHED" had the greater share.
---Question: Is "ACCEPTED" defined by "FINISHED"?