{{ config(materialized='table') }}

with all_dates as (
    select order_date::date as full_date
    from {{ source('oliver', 'orders') }}

    union

    select certification_awarded_date::date as full_date
    from {{ ref('stg_employee_certifications') }}
)

select
    full_date as date_key,
    full_date,
    year(full_date) as year,
    quarter(full_date) as quarter,
    month(full_date) as month,
    monthname(full_date) as month_name,
    day(full_date) as day,
    dayname(full_date) as day_name,
    dayofweekiso(full_date) as day_of_week
from all_dates
where full_date is not null