--- REFERENTIAL INTEGRITY CHECK : Orphaned receipt items
--- identifies receipt items without parent receipt

SELECT 
  COUNT(*) AS orphaned_items_count,
  COUNT(DISTINCT ri.receipt_id) AS orphaned_receipt_ids
FROM `fetch-coding-challenge.fetch_data_clean_stg.receipt_items_stg` ri   
LEFT JOIN `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg` r   
ON ri.receipt_id = r.receipt_id
WHERE r.receipt_id IS NULL