with gender as(
    select distinct gender
    from 
    {{ref("DEPI_data")}}
    where gender is not null
)
select
    row_number() over (order by gender) as gender_id,
    gender
from gender