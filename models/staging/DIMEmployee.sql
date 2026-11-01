{{config(
    materialized='incremental',
    unique_key='employee_id'
    )
}}
with employees as (
    select distinct ID as employee_id, first_name, last_name, email
    from {{ref("DEPI_data")}}
    where ID is not null
)
select
    employee_id,
    {{capitalize_name('first_name', 'last_name')}} as full_name,
    first_name,
    last_name,
    email
from employees
{% if is_incremental() %}
    where employee_id not in (select employee_id from {{this}})
{% endif %}