"""
Basic data transformation using pure Python lists and dictionaries.
No external libraries required.

This script demonstrates:
- Filtering data
- Cleaning missing values
- Grouping by a field
"""

data = [
    {"id": 1, "country": "UK", "value": 120},
    {"id": 2, "country": "UK", "value": 30},
    {"id": 3, "country": "FR", "value": 200},
    {"id": 4, "country": "ES", "value": None},
]

def filter_positive(records):
    """Keep records where 'value' exists and is greater than zero."""
    return [r for r in records if r["value"] is not None and r["value"] > 0]

def summarise_by_country(records):
    """Count how many records exist for each country."""
    summary = {}
    for r in records:
        country = r["country"]
        summary[country] = summary.get(country, 0) + 1
    return summary

if __name__ == "__main__":
    cleaned = filter_positive(data)
    print("Filtered records (value > 0):")
    print(cleaned)

    grouped = summarise_by_country(cleaned)
    print("\nCount by country:")
    print(grouped)
