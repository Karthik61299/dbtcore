{{ config(materialized="table") }}

    WITH product_cte AS (
        SELECT
            productname,
            category,
            price
        FROM
            POSTGRES_DATA.DEX_CARN.PRODUCTS
    )

    SELECT
        *
    FROM
        product_cte
    WHERE
        price > 400