use transactions;
with t1 as 
(select city,
sum(amount) as spend, 
rank() over (order by sum(amount) desc) as x from credit_transactions group by city),
t2 as 
(select sum(amount)as y from credit_transactions)
select top 5 * , (t1.spend/t2.y)*100 as percent_contrib from t1,t2;