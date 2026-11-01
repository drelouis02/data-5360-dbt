
{{ config(materialized='table') }}

SELECT
    ol.ORDER_LINE_ID,
    o.ORDER_ID,
    o.ORDER_DATE AS DATE_KEY,
    o.CUSTOMER_ID,
    o.EMPLOYEE_ID,
    o.STORE_ID,
    ol.PRODUCT_ID,
    ol.QUANTITY,
    ol.UNIT_PRICE,
    ol.QUANTITY * ol.UNIT_PRICE AS SALES_AMOUNT

FROM {{ source('oliver', 'orderline') }} AS ol

INNER JOIN {{ source('oliver', 'orders') }} AS o
    ON ol.ORDER_ID = o.ORDER_ID
