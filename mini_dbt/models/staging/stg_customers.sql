-- Example staging model for learning dbt folder structures

SELECT
    id,
    TRIM(first_name) AS first_name,
    TRIM(last_name) AS last_name,
    country,
    email
FROM {{ source("raw", "customers") }};
