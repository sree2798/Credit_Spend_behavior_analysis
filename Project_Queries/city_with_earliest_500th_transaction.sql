with cte as (
select *
,row_number() over(partition by city order by "date","index") as rn
from credit_transactions)
select top 1 city,datediff(day,min("date"),max("date")) as datediff1
from cte
where rn=1 or rn=500
group by city
having count(1)=2
order by datediff1
