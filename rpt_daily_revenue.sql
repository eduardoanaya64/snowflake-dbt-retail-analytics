select
    revenue_date,
    revenue_channel,
    sum(revenue_amount) as revenue_amount,
    sum(quantity) as units
from {{ ref('fct_revenue') }}
group by 1,2
order by 1,2
