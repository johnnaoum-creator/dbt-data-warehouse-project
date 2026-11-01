with country as (
    select distinct country
    from 
    {{ref("DEPI_data")}}
    where country is not null
)
select
    row_number() over (order by country) as country_id,
    country
from country