import os
import json
from google.cloud import bigquery

def upload_json_to_bigquery(dataset_id, table_id, file_path):
    client = bigquery.Client()
    table_ref = client.dataset(dataset_id).table(table_id)

    #Read JSON lines
    with open(file_path, "r") as f:
        data = [json.loads(line) for line in f if line.strip()]
    
    errors = client.insert_rows_json(table_ref, data)

    if errors:
        print(f"Encountered errors while inserting rows into {table_id}: {errors}")
    else: 
        print(f"Data loaded successfully into {table_id}.")

if __name__ == "__main__":
    dataset = os.environ.get("BIGQUERY_DATASET", "your_dataset")

    receipts_file = "data/receipts.json"
    users_file = "data/users.json"
    brands_file = "data/brands.json"

    upload_json_to_bigquery(dataset, "receipts", receipts_file)
    upload_json_to_bigquery(dataset, "userss", users_file)
    upload_json_to_bigquery(dataset, "brands", brands_file)