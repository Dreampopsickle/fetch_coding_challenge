import os
import json
from datetime import datetime, timezone
from google.cloud import bigquery

client = bigquery.Client()
def transform_json_obj(obj):
    """
    Recursively transform the JSON object:
    - If a dict has exactly one key and that key is "$date", convert the epoch millisecond value to an ISO 8601 timestamp string.
    - If a dict has exactly one key and that key is "$oid", return its value directly.
    - Otherwise, for each key in the dict, if the key starts with "$", remove the "$" prefix.
      Recursively process all values.
    """
    if isinstance(obj, dict):
        # Special handling if the dict is exactly {"$date": value}
        if len(obj) == 1 and "$date" in obj:
            epoch_ms = obj["$date"]
            return datetime.fromtimestamp(epoch_ms / 1000, tz=timezone.utc).isoformat()
        # Special handling if the dict is exactly {"$oid": value}
        if len(obj) == 1 and "$oid" in obj:
            return obj["$oid"]
        # Otherwise, process all keys: remove leading '$' if present
        new_dict = {}
        for k, v in obj.items():
            new_key = k[1:] if k.startswith("$") else k
            new_dict[new_key] = transform_json_obj(v)
        return new_dict
    elif isinstance(obj, list):
        return [transform_json_obj(item) for item in obj]
    else:
        return obj
    
def upload_json_to_bigquery(client, dataset_id, table_id, file_path):
    
    table_ref = client.dataset(dataset_id).table(table_id)

    #Read JSON lines
    with open(file_path, "r") as f:
        json_data = []
        for line in f:
            if line.strip():
                data_obj = json.loads(line)
                transformed_obj = transform_json_obj(data_obj)
                json_data.append(transformed_obj)
    # configure load job
    job_config = bigquery.LoadJobConfig(
        autodetect=True,
        source_format=bigquery.SourceFormat.NEWLINE_DELIMITED_JSON,
        write_disposition=bigquery.WriteDisposition.WRITE_APPEND
    )
    
    load_job = client.load_table_from_json(json_data, table_ref, job_config=job_config)
    print(f"Starting load job {load_job.job_id} for table {table_id}...")

    #wait for load jobto complete
    load_job.result()

    print(f"Loaded {load_job.output_rows} rows into {table_id}.")

if __name__ == "__main__":
    dataset = os.environ.get("BIGQUERY_DATASET", "fetch_data")

    receipts_file = "data/receipts.json"
    users_file = "data/users.json"
    brands_file = "data/brands.json"

    upload_json_to_bigquery(client, dataset, "receipts", receipts_file)
    upload_json_to_bigquery(client, dataset, "users", users_file)
    upload_json_to_bigquery(client, dataset, "brands", brands_file)