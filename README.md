# Retail Revenue Analytics (Snowflake + dbt + Power BI)

## 📌 Overview

This project demonstrates an end-to-end analytics engineering workflow using Snowflake, dbt, and Power BI to model, validate, and report retail revenue data from multiple operational sources.

Raw transactional data is ingested into Snowflake, transformed using dbt into clean staging and fact models, and exposed through reporting tables optimized for BI consumption.

![dbt Project Overview](dbt_project_overview.png)

## 🏗️ Architecture

## Data Flow

CSV Sources
   ↓
Snowflake (RAW)
   ↓
dbt Staging Models
   ↓
dbt Fact Models
   ↓
Reporting Models
   ↓
Power BI

Source Systems

- POS Transactions
- Billing Invoices
- Products
- Customers

## 📁 Project Structure

```text
.
├── analyses/          # Ad-hoc dbt analyses
├── macros/            # Reusable dbt macros
├── models/
│   ├── staging/       # Cleaned & standardized staging models
│   └── marts/         # Fact tables & reporting models
├── seeds/             # Seed data (if applicable)
├── snapshots/         # Snapshot definitions
├── tests/             # Custom dbt tests
├── README.md          # Project documentation
├── dbt_project.yml    # dbt project configuration
├── sources.yml        # Source definitions
├── staging.yml        # Staging tests & documentation
├── marts.yml          # Mart-level tests & documentation
├── dbt_lineage.png    # dbt lineage diagram
└── dbt_project_overview.png  # dbt project overview screenshot
```

## 🗄️ Data Models
### **Staging Layer**

Purpose: **Clean, standardize, and type-cast raw data**

- stg_pos_transactions.sql
- stg_billings_invoices.sql

Actions performed:

- Column renaming
- Data type casting
- Business-friendly naming
- Source-level validation via dbt tests

### **Fact Layer**

Purpose: **Unified revenue logic across channels**

- fct_revenue.sql

Features:

- Combines POS and billing revenue
- Normalizes revenue structure
- Enables channel-level comparisons

### **Reporting Layer**

Purpose: BI-ready aggregates

- rpt_daily_revenue.sql

Output:

- Daily revenue by channel
- Total revenue and units
- Optimized for Power BI consumption

## ✅ Data Quality & Testing

dbt tests implemented:

- not_null
- unique
- Referential integrity checks
- Source freshness validation

Tests are defined in:
- staging.yml
- marts.yml

All models successfully pass dbt test.

## 📈 dbt Lineage

The following lineage graph shows the full transformation path from raw sources to reporting models:

![dbt Lineage Graph](./dbt_lineage.png)

Flow:

RAW → STAGING → FACT → REPORT

## 📚 dbt Documentation

dbt documentation was generated and deployed using:

**dbt docs generate**

The project includes:

- Model-level documentation
- Column descriptions
- Test visibility
- Full lineage exploration

## 📊 Power BI Integration

The final reporting table:

**RETAIL_DB.STAGING.RPT_DAILY_REVENUE** is designed to be consumed directly by Power BI.

**Power BI Design Considerations**

- Import mode recommended for performance
- Date hierarchy supported

Measures built for:
   - Total Revenue
   - Total Units
   - Revenue by Channel
   - Daily Trends
- KPI visuals enabled for executive dashboards

Power BI connects directly to Snowflake using native connectors.

## 🚀 How to Run This Project

```text
dbt run
dbt test
dbt docs generate
```

To build only specific layers:

```text
dbt run --select staging
dbt run --select fct_revenue
dbt run --select rpt_daily_revenue
```

## 🛠️ Tools Used

**Snowflake** – Cloud data warehouse

**dbt Cloud** – Transformations, testing, documentation

**Power BI** – Analytics & visualization

**GitHub** – Version control

## 🎯 Key Takeaways

- Demonstrates modern analytics engineering best practices
- End-to-end lineage from raw data to BI
- Production-ready dbt project with testing and documentation
- Designed for real-world reporting and stakeholder consumption





