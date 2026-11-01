# Data Warehouse Project | dbt & SQL Server

A Data Engineering project that transforms raw employee data into a structured data warehouse using **dbt and Microsoft SQL Server**.

## Project Overview

This project demonstrates the development of a data transformation workflow, starting with raw employee data and transforming it into organized staging models and dimensional data warehouse tables.

The goal is to improve data organization, consistency, and readiness for analytical queries.

## Tech Stack

- **dbt Core** – Data transformation and modeling.
- **Microsoft SQL Server** – Database and data warehouse.
- **SQL** – Data cleaning and transformation.
- **Python** – Project environment and dbt execution.
- **YAML** – Model documentation and data quality tests.
- **Git & GitHub** – Version control.

## Project Architecture

The project follows a layered transformation approach:

1. **Source Data:** Raw employee data loaded using dbt seeds.
2. **Staging Layer:** Initial transformations and preparation of the source data.
3. **Data Warehouse Layer:** Dimensional models designed for analytical use.

## Data Warehouse Models

The DWH layer contains:

### Dimension Tables
- `dim_employee`
- `dim_country`
- `dim_department`
- `dim_gender`
- `dim_date`

### Fact Table
- `factTable`

The project also includes an **OBT (One Big Table)** model for analytical use cases.

## Project Structure

```text
depi_dbt/
│
├── analyses/
├── macros/
│   ├── capitalize_name.sql
│   ├── generate_schema_name.sql
│   └── salary_category.sql
│
├── models/
│   ├── staging/
│   └── DWH/
│
├── seeds/
├── snapshots/
├── tests/
│   ├── dob_not_future.sql
│   └── negative_salary.sql
│
├── dbt_project.yml
└── README.md
```

## Data Quality

Custom SQL tests are implemented to validate important business rules, including:

- Employee date of birth must not be in the future.
- Employee salary must not be negative.

The project also uses YAML files for model documentation and testing.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/johnnaoum-creator/dbt-data-warehouse-project.git
cd dbt-data-warehouse-project
```

### 2. Install dbt

Install dbt with the SQL Server adapter:

```bash
pip install dbt-core dbt-sqlserver
```

### 3. Configure the database connection

Configure your SQL Server connection in the local dbt `profiles.yml` file.

Make sure the profile name matches the one configured in `dbt_project.yml`.

### 4. Run the project

Load the seed data:

```bash
dbt seed
```

Run the models:

```bash
dbt run
```

Run data quality tests:

```bash
dbt test
```

Or execute the full build:

```bash
dbt build
```

## Author

**John Naoum**

Aspiring Data Engineer

GitHub: [johnnaoum-creator](https://github.com/johnnaoum-creator)
