1. Data Processing
Data Loading and Concatenation

A list of CSV files named MBTA-Bus-Arrival-Departure-Times_2024-XX.csv (where XX indicates the month) is gathered using glob.

Each file is loaded into a pandas DataFrame (read_csv).

In each file, date and time columns are parsed and converted to appropriate data types:

service_date is converted to datetime.

scheduled and actual columns are converted to time objects, then stored in new columns such as scheduled_time and actual_time.

These DataFrames are concatenated into a single df_merged DataFrame.

Initial Inspection

The merged DataFrame is inspected with .info() and .head() to check the data types and general structure.

Basic cleaning/checking steps:

Ensuring service_date is a proper datetime column.

Ensuring numeric columns (e.g., delay_minutes) are correctly typed.

Creating Key Columns

on_time_flag: A boolean column indicating whether a bus departure was on time (delay_minutes <= 5) or not.

year_month: Derived from service_date as a period (e.g., "2024-01", "2024-02") for time-based splitting.

day_of_week: Extracted from service_date (0=Monday, 6=Sunday).

Splitting Data by Time Periods

A time-based split is used for training vs. testing:

Training: January–August 2024

Testing: September 2024

Masks (train_mask, test_mask) are created using the year_month column.

df_train and df_test DataFrames are created by filtering with these masks.

Aggregation to Daily Route-Level

Data is grouped by ['route_id_str', 'service_date'].

Aggregations:

Mean on-time percentage (on_time_flag → on_time_pct)

Mean delay_minutes

First/unique day_of_week

Encodes route_id_str into a numeric route_cat (via astype('category').cat.codes) so that it can be used as a model feature.

Result is a “daily” DataFrame where each row corresponds to a single date for a particular route.

Saving Preprocessed Data

Optional code to save the combined data to a CSV (e.g., MBTA_Bus_2024_Preprocessed.csv).

