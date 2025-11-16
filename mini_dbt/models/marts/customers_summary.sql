-- Example mart model for learning dbt layout

SELECT
    country,
    COUNT(*) AS total_customers
FROM {{ ref("stg_customers") }}
GROUP BY country
ORDER BY total_customers DESC;
