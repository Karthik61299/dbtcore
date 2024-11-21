{{ config(materialized='table') }}

WITH film_cte AS (
SELECT *
FROM film
),

film_category_cte AS (
SELECT *
FROM film_category
),

category_cte AS (
SELECT *
FROM category
),

joined_data AS (
SELECT c.name AS category,
AVG(f.length) AS average_running_time
FROM film_cte AS f
JOIN film_category_cte AS fc ON f.film_id = fc.film_id
JOIN category_cte AS c ON fc.category_id = c.category_id
GROUP BY c.name
)

SELECT *
FROM joined_data
ORDER BY category
