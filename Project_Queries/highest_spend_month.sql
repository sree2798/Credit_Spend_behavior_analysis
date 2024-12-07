use transactions;
with cte as (
select card_type,datepart(year,date) yt
,datepart(month,date) mt,sum(amount) as total_spend
from credit_transactions
group by card_type,datepart(year,date),datepart(month,date)
--order by card_type,total_spend desc
)
select * from (select *, rank() over(partition by card_type order by total_spend desc) as rn
from cte) a where rn=1
