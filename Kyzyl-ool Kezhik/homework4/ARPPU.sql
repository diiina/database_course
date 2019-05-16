select truncate(revenue/PU, 2) as ARPPU
from (select sum(payment_sum) as revenue
from payments) as t1, (select count(distinct user_id) as PU
from payments) as t2;