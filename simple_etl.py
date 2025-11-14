"""
Simple ETL example for data engineering practice.

Extract:
    Read raw_data.csv (if present)

Transform:
    - Drop rows with missing ID
    - Filter positive values
    - Select useful columns if they exist

Load:
    Save cleaned dataset to clean_data.csv
"""

import pandas as pd

input_path = "raw_data.csv"
output_path = "clean_data.csv"

def run_etl():
    try:
        df = pd.read_csv(input_path)
    except FileNotFoundError:
        print(f"Missing file: {input_path}. Add a CSV file to test this script.")
        return

    # Drop rows with missing ID
    if "id" in df.columns:
        df = df.dropna(subset=["id"])

    # Keep only positive values if 'value' column exists
    if "value" in df.columns:
        df = df[df["value"] > 0]

    # Keep useful columns if present
    keep_cols = [col for col in ["id", "name", "value", "country"] if col in df.columns]
    if keep_cols:
        df = df[keep_cols]

    df.to_csv(output_path, index=False)
    print(f"ETL complete. Cleaned data saved to {output_path}")

if __name__ == "__main__":
    run_etl()
