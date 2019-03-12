with recursive cte as (
  select min(cast(payment_dttm as date )) as day_of_payment from payments
  union all
  select day_of_payment + interval 1 day from cte
  where day_of_payment + interval 1 day <= (select max(cast(payment_dttm as date)) from payments)
),
payment_per_day as (
  select cast(payment_dttm as date) as day_payment,
         count(distinct user_id) as number_of_payments
         from payments
         group by day_payment
  ),
dau as (
  select cast(begin_dttm as date) as day_payment,
         count(distinct user_id) as users_pay
         from sessions
         group by day_payment
)
select cte.day_of_payment as day_date,
       coalesce(payment_per_day.number_of_payments,1) / coalesce(dau.users_pay,0) as ppu
       from cte,payment_per_day,dau
        where cte.day_of_payment = payment_per_day.day_payment
        and cte.day_of_payment = dau.day_payment
