
{{ config(materialized='table') }}

SELECT
    f.ORDER_LINE_ID,
    f.ORDER_ID,
    d.FULL_DATE AS ORDER_DATE,
    d.YEAR,
    d.MONTH,
    c.CUSTOMER_ID,
    e.EMPLOYEE_NAME,
    p.PRODUCT_NAME,
    p.DESCRIPTION AS PRODUCT_DESCRIPTION,
    s.STORE_NAME,
    s.CITY,
    s.STATE,
    f.QUANTITY,
    f.UNIT_PRICE,
    f.SALES_AMOUNT

FROM {{ ref('fact_sales') }} AS f

LEFT JOIN {{ ref('oliver_dim_date') }} AS d
    ON f.DATE_KEY = d.DATE_KEY

LEFT JOIN {{ ref('oliver_dim_customer') }} AS c
    ON f.CUSTOMER_ID = c.CUSTOMER_ID

LEFT JOIN {{ ref('oliver_dim_employee') }} AS e
    ON f.EMPLOYEE_ID = e.EMPLOYEE_ID

LEFT JOIN {{ ref('oliver_dim_product') }} AS p
    ON f.PRODUCT_ID = p.PRODUCT_ID

LEFT JOIN {{ ref('oliver_dim_store') }} AS s
    ON f.STORE_ID = s.STORE_ID
