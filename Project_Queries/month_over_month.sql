with cte as (
select card_type,exp_type,datepart(year,"date") yt
,datepart(month,"date") mt,sum(amount) as total_spend
from credit_transactions
group by card_type,exp_type,datepart(year,"date"),datepart(month,"date")
)
select  top 1 *, (total_spend-prev_mont_spend) as mom_growth
from (
select *
,lag(total_spend,1) over(partition by card_type,exp_type order by yt,mt) as prev_mont_spend
from cte) A
where prev_mont_spend is not null and yt=2014 and mt=1
order by mom_growth desc;