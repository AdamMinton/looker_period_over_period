# Looker Period-over-Period (PoP) Analysis Templates

This repository contains LookML models, views, and dashboards implementing a variety of Period-over-Period (PoP) comparison methods in Looker. It is designed to support both standard Gregorian calendars and custom retail (e.g., NRF 4-5-4) calendars.

---

## 1. Repository Dashboards & Comparison Methods

This project provides templates and example dashboards for two distinct date tracking frameworks:

### A. Standard Gregorian Calendar PoP
*   **Dashboard**: `Period over Period (PoP) Comparison Methods` ([pop_comparison_methods.dashboard.lookml](dashboards/pop_comparison_methods.dashboard.lookml))
*   **Overview**: Demonstrates 9 different methods of implementing PoP comparisons using standard Gregorian dates and native database date-math.
*   **Database Setup**: **None**. It queries the public BigQuery dataset `bigquery-public-data.thelook_ecommerce.order_items` directly.
*   **Included Methods**:
    *   **Method 1: Any Two Native Timeframes**: Uses Looker's native date dimension groups and pivots in the Explore.
    *   **Method 2: Any Two Native Timeframes (with Liquid)**: Adds parameters to let users dynamically select row breakdown granularity and pivot comparison period directly via dropdowns.
    *   **Method 3: Current Period and Previous Period**: Dynamically calculates the previous period of the exact same length using a Date filter and Liquid.
    *   **Method 4: Current Period and Many Previous Periods**: Extends Method 3 to compare against multiple prior periods side-by-side.
    *   **Method 5: Current Period and Any Arbitrary Period**: Allows users to compare the current period against a completely custom, arbitrary date range.
    *   **Method 6: Any Two Arbitrary Periods**: Compares two manually-defined arbitrary periods (Google Analytics style).
    *   **Method 7: Arbitrary Period and Directly Previous Period**: Dynamically calculates the preceding period of the exact same length as the selected range (ideal for single value comparison tiles).
    *   **Method 8: Arbitrary Period and Many Previous Periods**: Extends Method 7 to compare against multiple prior periods.
    *   **Method 9: Looker Built-in PoP Measures**: Employs Looker's built-in `type: period_over_period` measures.

### B. Retail (Custom Fiscal) Calendar PoP
*   **Dashboard**: `Period over Period (PoP) Comparison Methods - Retail Calendar` ([pop_comparison_methods_retail.dashboard.lookml](dashboards/pop_comparison_methods_retail.dashboard.lookml))
*   **Overview**: Shows how to handle PoP comparison when week alignment and 53-week years are introduced by custom retail (e.g. NRF 4-5-4) calendars. Standard Gregorian date-math (e.g. `DATE_ADD`) breaks under these conditions.
*   **Database Setup**: **Required**. Needs custom lookup tables mapping Gregorian dates to their fiscal/retail calendar equivalents.
*   **Included Implementations**:
    *   **Liquid-Based Custom Calendar (Highly Efficient / Recommended)**: Uses a pre-computed bridge table (`cal_day_pryr_day`) to map days this year vs. last year and dynamically filters the fact table scan. Excellent for partition pruning in BigQuery.
    *   **Native Custom Calendar**: Uses Looker's native `calendar_definition` and `period_over_period` measures. Requires less complex LookML but forces contiguous partition scans, leading to higher query costs.

---

## 2. Database Installation (Required for Retail Calendar PoP)

To support the retail calendar PoP methods, you must load three custom lookup tables into your database (BigQuery).

### Custom Calendar Tables Required
1.  **`fiscal_calendar`**: A comprehensive custom calendar reference table mapping every Gregorian date to its corresponding fiscal year, quarter, period, week, and day characteristics.
2.  **`fiscal_calendar_looker`**: A lightweight custom calendar mapping table specifically formatted for Looker's native `calendar_definition` block.
3.  **`cal_day_pryr_day`**: A comparison mapping table that pre-aligns every Gregorian date with its corresponding comparison date (This Year vs. Last Year), enabling highly efficient join-based comparison queries.

CSV seeds for these tables are provided in the `/data` directory of this repository:
*   [cal_day_pryr_day.csv](data/cal_day_pryr_day.csv)
*   [fiscal_calendar.csv](data/fiscal_calendar.csv)
*   [fiscal_calendar_looker.csv](data/fiscal_calendar_looker.csv)

### Loading Data to BigQuery
Follow these commands to set up the dataset and load the seeds:

#### Step 1: Create a Dataset
Create a dataset in BigQuery to host the custom calendar tables (e.g., `custom_calendars`):
```bash
bq mk --location=US custom_calendars
```

#### Step 2: Load the CSV Seed Files
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

Once the tables are loaded in BigQuery, update the constants in the LookML project configuration to point to your GCP project and dataset:

1.  Open the [manifest.lkml](manifest.lkml) file.
2.  Update the values of the `GCP_PROJECT` and `CALENDAR_DATASET` constants:
    ```lookml
    constant: GCP_PROJECT {
      value: "your-gcp-project-id"  # Replace with your GCP project ID
    }

    constant: CALENDAR_DATASET {
      value: "custom_calendars"     # Replace with your dataset name
    }
    ```
3.  Deploy the changes to development mode and run LookML validation to ensure a successful connection.
