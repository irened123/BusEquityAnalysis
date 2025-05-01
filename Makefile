# Makefile for Bus Equity Analysis
# Usage:
#   make setup         → installs dependencies from environment.yml
#   make download_data → downloads MBTA dataset
#   make run_all       → runs notebooks in order (merge then model)

.PHONY: setup download_data run_all

setup:
	conda env create -f environment.yml || conda env update -f environment.yml

download_data:
	gdown https://drive.google.com/uc?id=1CElKpxLwHTxCCDazYU3y1iWyf3swKXwL -O cleaned_data/mbta_cleaned.csv

run_all:
	jupyter nbconvert --execute notebooks/chris_merge_mbta.ipynb --to notebook --inplace
	jupyter nbconvert --execute notebooks/on_time_xgboost_irene_v2.ipynb --to notebook --inplace
