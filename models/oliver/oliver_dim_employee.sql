
{{ config(materialized='table') }}

SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS EMPLOYEE_NAME,
    POSITION,
    HIRE_DATE,
    EMAIL,
    PHONE_NUMBER
FROM {{ source('oliver', 'employee') }}
