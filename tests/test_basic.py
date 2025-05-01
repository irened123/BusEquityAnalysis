import os
import pandas as pd

DATA_PATH = "cleaned_data/mbta_cleaned.csv"
REQUIRED_COLS = ["service_date", "route_id", "actual_minutes"]

def test_dataset_exists():
    assert os.path.exists(DATA_PATH), "Dataset missing—did you run make download_data?"

def test_can_read_and_has_columns():
    df = pd.read_csv(DATA_PATH, nrows=1000)  # read a tiny sample
    for col in REQUIRED_COLS:
        assert col in df.columns, f"Column {col} not found in CSV"
