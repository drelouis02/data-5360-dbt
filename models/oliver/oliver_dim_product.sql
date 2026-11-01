
{{ config(materialized='table') }}

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    DESCRIPTION,
    UNIT_PRICE

FROM {{ source('oliver', 'product') }}
