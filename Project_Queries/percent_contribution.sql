select exp_type,
sum(case when gender='F' then amount else 0 end)*1.0/sum(amount) as percentage_female_contribution
from credit_transactions
group by exp_type
order by percentage_female_contribution desc;