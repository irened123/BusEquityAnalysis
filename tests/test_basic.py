import os
import pandas as pd

DATA_PATH = "cleaned_data/combined_bus_silverline_2017_2024.csv"

REQUIRED_COLS = [
    "year",
    "month_of_service",
    "route_or_line",
    "ridership_total",
    "ridership_average"
]

def test_dataset_exists():
    assert os.path.exists(DATA_PATH), f"Dataset missing at {DATA_PATH}"

def test_can_read_and_has_columns():
    df = pd.read_csv(DATA_PATH, nrows=100)
    for col in REQUIRED_COLS:
        assert col in df.columns, f"Column {col} not found in CSV"
