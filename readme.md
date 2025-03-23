# Fetch Rewards Coding Challenge

This repository contains the solution for the Fetch Rewards Coding Challenge. It includes a data model, SQL queries to answer business questions, and a comprehensive suite of data quality checks—all executed in BigQuery. Additionally, a Python ingestion script is provided to load raw JSON data into BigQuery.

This project leverages Docker to create a consistent development environment.

---

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## Project Structure

- **Dockerfile**: Defines the Docker image for the application.
- **docker-compose.yml**: Configures the Docker Compose service.
- **fetch_coding_challenge/**: Directory containing DBT profiles and related configuration.
- **credentials/**: Directory for your Google Cloud service account JSON file.
- **SQL Files**: Includes various `.sql` files for completeness, consistency, referential integrity, temporal quality, user ID validation, and validity checks.
- **Python Scripts**: Contains the ingestion script to load raw JSON into BigQuery.
- **Other Files**: Additional documentation, scripts, and configuration files related to the exercise.

---

## Environment Variables

The following environment variables are set in the `docker-compose.yml` file:

- `DBT_PROFILES_DIR`: `/app/fetch_coding_challenge`  
  (Specifies where the DBT profiles are located.) --- \*\*\*Note: dbt was not used for this project but is established for future use
- `GOOGLE_APPLICATION_CREDENTIALS`: `/app/credentials/service_account.json`  
  (Points to the service account file for accessing Google Cloud services.)
- `BIGQUERY_DATASET`: `fetch_data`  
  (Designates the BigQuery dataset used in this project.)

_Note:_ For security best practices, the `service_account.json` file is included in your `.gitignore` to ensure sensitive credentials are not exposed in this public repository. Make sure to add your own service account file in the `credentials` directory when setting up your local environment.

---

## Building and Running the Container

1. **Build the Docker image:**

   ```bash
   docker-compose build

   ```

2. **\*Run the container:**

   ```bash
   docker-compose up -d

   ```

3. **_Access container shell_**
   ```bash
   docker-compose exec app /bin/bash
   ```
