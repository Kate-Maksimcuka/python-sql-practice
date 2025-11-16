-- Example staging model for orders table

SELECT
    id AS order_id,
    customer_id,
    amount,
    order_date
FROM {{ source("raw", "orders") }};
