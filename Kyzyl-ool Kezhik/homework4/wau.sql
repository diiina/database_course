# WAU

WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 week
      FROM cte
     WHERE dt + INTERVAL 1 week <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt as "Week start", COUNT(DISTINCT sessions.user_id) as 'WAU'
  FROM sessions RIGHT JOIN cte ON CAST(sessions.begin_dttm AS DATE) = cte.dt
 GROUP BY cte.dt
order by 1;