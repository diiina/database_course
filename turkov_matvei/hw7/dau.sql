with recursive cte as (
  select min(cast(view_time as date )) as day_t from Views
  union all
  select day_t + interval 1 week from cte
  where day_t + interval 1 week <= (select max(cast(view_time as date)) from Views)
)
select cte.day_t,count(distinct Views.user_id)
from cte,Views
where cte.day_t <= cast(views.view_time as date)
and cte.day_t + interval 1 day > cast(Views.view_time as date)
group by  cte.day_t
order by cte.day_t
