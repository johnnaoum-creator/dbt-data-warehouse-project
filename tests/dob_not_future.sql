select *
from {{ ref('OBT') }}
where [date] > cast(getdate() as date)