with t1 as (select sum(payment_sum) as REVENUE from payments),
     t2 as (select count(1) as AMOUNT_OF_PAYED_USERS
from payments join users on users.user_id = payments.user_id)
select t1.REVENUE / t2.AMOUNT_OF_PAYED_USERS as ARPPU from t1, t2;