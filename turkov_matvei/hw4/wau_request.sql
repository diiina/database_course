with recursive cte as (
  select min(cast(begin_dttm as date )) as day_of_week from sessions
  union all
  select day_of_week + interval 1 week from cte
  where day_of_week + interval 1 week <= (select max(cast(begin_dttm as date)) from sessions)
)
select cte.day_of_week,count(distinct sessions.user_id)
from cte,sessions
where cte.day_of_week <= cast(sessions.begin_dttm as date)
and cte.day_of_week + interval 1 week > cast(sessions.begin_dttm as date)
group by  cte.day_of_week
order by cte.day_of_weeks