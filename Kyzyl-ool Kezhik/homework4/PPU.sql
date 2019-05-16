select t1.dt as "Date", truncate(DPU/DAU, 2) as "PPU"
from (
       WITH RECURSIVE cte AS
         (
         SELECT MIN(CAST(begin_dttm AS DATE)) AS dt
         FROM sessions
         UNION ALL
         SELECT dt + INTERVAL 1 DAY
         FROM cte
         WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
         )
         SELECT cte.dt, COUNT(DISTINCT sessions.user_id) as "DAU"
         FROM sessions
                RIGHT JOIN cte ON CAST(sessions.begin_dttm AS DATE) = cte.dt
         GROUP BY cte.dt
         ORDER BY 1
     ) as t1 join (

WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
select cte.dt, count(distinct user_id) as "DPU"
from payments left join cte on cast(payments.payment_dttm as date) = cte.dt
group by cte.dt
order by 1
  ) as t2 on t1.dt = t2.dt


