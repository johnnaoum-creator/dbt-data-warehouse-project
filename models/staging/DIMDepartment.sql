with department as (
    select distinct department
    from 
    {{ref("DEPI_data")}}
    where department is not null
)
select
    row_number() over (order by department) as department_id,
    department
from department