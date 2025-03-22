-- Validate user ids 
-- Counts and missing or null ids 
-- confirms usability for joins 

SELECT  
  COUNT(user_id) AS total_user_ids,
  COUNTIF(user_id IS NULL) AS missing_user_ids
FROM `fetch-coding-challenge.fetch_data_clean_stg.users_stg` 