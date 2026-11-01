
{{ config(materialized='table') }}

SELECT *
FROM {{ source('oliver', 'customer') }}
