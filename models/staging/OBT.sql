{{ config(
    materialized='incremental',
    unique_key='employee_id'
) }}

select
    ID as employee_id,
    first_name,
    last_name,
    {{ capitalize_name('first_name', 'last_name') }} as full_name,
    email,
    gender,
    DOB as [date],
    cast(replace(salary, '$', '') as decimal(10,2)) as salary,
    department,
    country
from {{ ref("DEPI_data") }}
where ID is not null

{% if is_incremental() %}
    and not exists (
        select 1
        from {{ this }} as target
        where target.employee_id = DEPI_data.ID
    )
{% endif %}