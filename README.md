# Looker Period-over-Period (PoP) on Custom Fiscal Calendars

This repository contains LookML models, views, and dashboards implementing Period-over-Period (PoP) comparison methods designed to support custom retail (e.g., NRF 4-5-4) calendars. 

Standard Looker Gregorian date-math (e.g., `DATE_ADD`, `DATETIME_ADD`) breaks when week alignment and 53-week years are introduced. This project demonstrates the implementation of timezone-safe and partition-pruning friendly methods for custom calendars.

---

## 1. Custom Calendar Tables Required

To support these PoP methods, the following custom lookup tables must be loaded into your database (BigQuery):

1.  **`fiscal_calendar`**: A comprehensive custom calendar reference table mapping every Gregorian date to its corresponding fiscal year, quarter, period, week, and day characteristics.
2.  **`fiscal_calendar_looker`**: A lightweight custom calendar mapping table specifically formatted for Looker's native `calendar_definition` block.
3.  **`cal_day_pryr_day`**: A comparison mapping table that pre-aligns every Gregorian date with its corresponding comparison date (This Year vs. Last Year), enabling highly efficient join-based comparison queries.

CSV seeds for these tables are provided in the `/data` directory of this repository:
*   [cal_day_pryr_day.csv](file:///usr/local/google/home/adamminton/projects/looker_period_over_period/data/cal_day_pryr_day.csv)
*   [fiscal_calendar.csv](file:///usr/local/google/home/adamminton/projects/looker_period_over_period/data/fiscal_calendar.csv)
*   [fiscal_calendar_looker.csv](file:///usr/local/google/home/adamminton/projects/looker_period_over_period/data/fiscal_calendar_looker.csv)

---

## 2. Database Installation Instructions (BigQuery)

Follow these steps to load the custom calendar seeds into your Google Cloud project:

### Step 1: Create a Dataset
Create a dataset in BigQuery to host the custom calendar tables (e.g., `custom_calendars`):
```bash
bq mk --location=US custom_calendars
```

### Step 2: Load the CSV Seed Files
Load the CSV files from the `/data` directory into the dataset with auto-schema detection enabled:

```bash
# Load cal_day_pryr_day
bq load --autodetect --source_format=CSV custom_calendars.cal_day_pryr_day ./data/cal_day_pryr_day.csv

# Load fiscal_calendar
bq load --autodetect --source_format=CSV custom_calendars.fiscal_calendar ./data/fiscal_calendar.csv

# Load fiscal_calendar_looker
bq load --autodetect --source_format=CSV custom_calendars.fiscal_calendar_looker ./data/fiscal_calendar_looker.csv
```

---

## 3. LookML Setup & Configuration

Once the tables are loaded in BigQuery, update the LookML project configuration to point to your GCP project and dataset:

1.  Open the [manifest.lkml](file:///usr/local/google/home/adamminton/projects/looker_period_over_period/manifest.lkml) file.
2.  Update the values of the `GCP_PROJECT` and `CALENDAR_DATASET` constants:
    ```lookml
    constant: GCP_PROJECT {
      value: "your-gcp-project-id"  # Replace with your GCP project ID
    }

    constant: CALENDAR_DATASET {
      value: "custom_calendars"     # Replace with your dataset name
    }
    ```
3.  Deploy the changes to development mode and run LookML validation to ensure connection.

---

## 4. Key Comparison Methods Implemented

### Method A: Liquid-Based Custom Calendar (Highly Efficient)
*   **Location**: `views/order_items_liquid.view.lkml` / `explores/order_items_liquid.explore.lkml`
*   **Mechanics**: Pre-computes the date array boundaries in a Looker SQL preamble using Liquid and joins them to the `cal_day_pryr_day` table.
*   **Partition Pruning**: **Excellent**. Slices the fact table's partitions dynamically using only the specific dates required (e.g., scanning exactly 2 months of data for a 1-month filter).
*   **Timezone Safety**: **Excellent**. Binds dates cleanly using standard Looker date conversion.

### Method B: Native Custom Calendar (Standard/Platform)
*   **Location**: `views/order_items_native.view.lkml` / `explores/order_items_native.explore.lkml`
*   **Mechanics**: Implemented using Looker's native `calendar_definition` parameters.
*   **Partition Pruning**: **Moderate**. Looker is forced to scan a contiguous range spanning all compared periods (e.g., scanning 14 months of data for a 1-month filter).
*   **Timezone Safety**: **Unsafe**. Subject to 1-day/5-hour shift leakage at the calendar boundaries if the connection Query Timezone is not UTC.
