# ─────────────────────────────────────────────────────────────
#  Makefile – Final Project: MBTA On-Time Prediction
#
#  Targets:
#  ▸ make setup          : install Python dependencies
#  ▸ make download_data  : download the cleaned dataset from Google Drive
#  ▸ make run_model      : execute the final model notebook
#  ▸ make test           : (optional) run test suite
# ─────────────────────────────────────────────────────────────

.PHONY: setup download_data run_model test

DATA_URL  := https://drive.google.com/uc?id=1CElKpxLwHTxCCDazYU3y1iWyf3swKXwL
DATA_PATH := cleaned_data/MBTA_Bus_2024_Preprocessed.csv

# Install dependencies from requirements.txt
setup:
	pip install -r requirements.txt
	@echo "✅ Dependencies installed"

# Download cleaned dataset to expected location
download_data:
	pip install gdown
	mkdir -p cleaned_data
	gdown $(DATA_URL) -O $(DATA_PATH)
	@echo "✅ Dataset downloaded to $(DATA_PATH)"

# Run the final XGBoost model notebook
run_model:
	jupyter nbconvert --execute notebooks/modeling/on_time_xgboost_final.ipynb \
	                  --to notebook --output executed_model_output.ipynb \
	                  --log-level WARN
	@echo "✅ Final model notebook executed"

# Optional: run test suite
test:
	pytest -q
