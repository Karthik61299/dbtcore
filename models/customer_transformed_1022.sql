{{ config(materialized="table") }}

WITH customer_cte AS (
    SELECT 
        customerid, 
        firstname, 
        country 
    FROM 
        POSTGRES_DATA.DEX_CARN.CUSTOMERS
)

SELECT * FROM customer_cte
WHERE firstname LIKE 'J%'