
{{ config(materialized='table') }}

SELECT DISTINCT
    STORE_ID,
    STORE_NAME,
    STREET,
    CITY,
    STATE

FROM {{ source('oliver', 'store') }}
