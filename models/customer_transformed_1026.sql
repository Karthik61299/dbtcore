{{ config(materialized="table") }}

WITH base AS (
    SELECT 
        city, 
        state 
    FROM 
        POSTGRES_DATA.DEX_CARN.CUSTOMERS
),

segment_count AS (
    SELECT 
		state,
        COUNT(city) AS segment_count
         
    FROM 
        base 
    GROUP BY 
        state
)

SELECT * FROM segment_count
ORDER BY segment_count DESC