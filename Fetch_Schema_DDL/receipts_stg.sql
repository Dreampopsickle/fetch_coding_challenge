---TRIM columns to clean and format standardization
---Seperate "receiptItemList" to own table
CREATE OR REPLACE TABLE `fetch-coding-challenge.fetch_data_clean_stg.receipts_stg` AS 
SELECT
  TRIM(_id) AS receipt_id,
  bonusPointsEarned AS bonus_points_earned,
  TRIM(bonusPointsEarnedReason) AS bonus_points_earned_reason,
  createDate AS create_date,
  dateScanned AS date_scanned,
  finishedDate AS finished_date,
  modifyDate AS modify_date,
  pointsAwardedDate AS points_awarded_date,
  pointsEarned AS points_earned,
  purchaseDate AS purchase_date,
  purchasedItemCount AS purchased_item_count,
  TRIM(rewardsReceiptStatus) AS rewards_receipt_status,
  totalSpent AS total_spent,
  TRIM(userId) AS user_id
FROM `fetch-coding-challenge.fetch_data.receipts`