with recursive cte as (
  select min(cast(payment_dttm as date )) as day_of_payment from payments
  union all
  select day_of_payment + interval 1 day from cte
  where day_of_payment + interval 1 day <= (select max(cast(payment_dttm as date)) from payments)
),
number_of_payments_per_day as (
  select cast(payment_dttm as date) as day_payment,
         count(distinct user_id) as number_of_payments
         from payments
         group by day_payment
  ),

daily_payments_amount as (
  select cast(payment_dttm as date) as day_payment,
         sum(payment_sum) as sum_per_day
         from payments
          group by day_payment
)

select cte.day_of_payment as date,
       format((coalesce(daily_payments_amount.sum_per_day,0) / coalesce(number_of_payments_per_day.number_of_payments,1)),2) as arppu
       from cte,number_of_payments_per_day,daily_payments_amount
        where cte.day_of_payment = daily_payments_amount.day_payment
        and  cte.day_of_payment = number_of_payments_per_day.day_payment

