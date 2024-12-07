select top 1 city , sum(amount)*1.0/count(1) as ratio
from credit_transactions
where datepart(weekday,"date") in (1,7)
group by city
order by ratio desc;