---TRIM columns to clean and format standardization
CREATE OR REPLACE TABLE `fetch-coding-challenge.fetch_data_clean_stg.users_stg` AS 
SELECT
  TRIM(_id) AS user_id,
  active AS active,
  createdDate AS created_date,
  lastLogin AS last_login,
  TRIM(role) AS role,
  TRIM(signUpSource) AS sign_up_source,
  TRIM(state) AS state
FROM `fetch-coding-challenge.fetch_data.users`