# ────────────────────────────────────────────────────────────────
#  Makefile  – BusEquityAnalysis
#
#  Targets
#  ▸ make setup          : create / update conda env from environment.yml
#  ▸ make download_data  : fetch 6 GB cleaned MBTA CSV from Google Drive
#  ▸ make run_merge      : execute chris_merge_mbta.ipynb in-place
#  ▸ make run_model      : execute on_time_xgboost_irene_v2.ipynb in-place
#  ▸ make run_all        : run_merge  ➜  run_model   (end-to-end)
# ────────────────────────────────────────────────────────────────

ENV_NAME  := bus-equity-env
DATA_URL  := https://drive.google.com/uc?id=1CElKpxLwHTxCCDazYU3y1iWyf3swKXwL
DATA_PATH := cleaned_data/mbta_cleaned.csv

.PHONY: setup download_data run_merge run_model run_all

# 1️⃣  create (or update) the conda environment
setup:
	conda env create -n $(ENV_NAME) -f environment.yml || \
	conda env update  -n $(ENV_NAME) -f environment.yml
	@echo "✅  Conda env '$(ENV_NAME)' ready"

# 2️⃣  download the 6 GB dataset (requires gdown, already in environment.yml)
download_data:
	mkdir -p cleaned_data
	gdown $(DATA_URL) -O $(DATA_PATH)
	@echo "✅  Dataset saved to $(DATA_PATH)"

# 3️⃣ run the merge / feature-engineering notebook
run_merge:
	jupyter nbconvert --execute chris_merge_mbta.ipynb          \
	                  --to notebook --inplace --log-level WARN
	@echo "✅  chris_merge_mbta.ipynb executed"

# 4️⃣ run the final XGBoost model notebook
run_model:
	jupyter nbconvert --execute on_time_xgboost_irene_v2.ipynb   \
	                  --to notebook --inplace --log-level WARN
	@echo "✅  on_time_xgboost_irene_v2.ipynb executed"

# 5️⃣ run everything end-to-end
run_all: run_merge run_model
	@echo "🏁  All notebooks completed"

test: download_data        # ensure data present, then…
	pytest -q              

