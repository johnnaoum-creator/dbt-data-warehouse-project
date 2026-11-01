with date_ as (
    select distinct
cast(DOB as date) as[date]
    from 
    {{ref("DEPI_data")}}
    where DOB is not null
)
select
    convert(INT, convert(char(8), [date], 112)) as date_key,
    [date],
    year([date]) as [year],
    month([date]) as [month],
    day([date]) as [day],
    datename(month, [date]) as month_name,
    datename(weekday, [date]) as day_name
from date_;