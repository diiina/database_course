# DAU
use hw1;
# Helped for optimization
CREATE INDEX index_dttm ON sessions(begin_dttm);
EXPLAIN WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt AS 'date', COUNT(DISTINCT sessions.user_id) AS 'DAU'
  FROM sessions RIGHT JOIN cte ON CAST(sessions.begin_dttm AS DATE) = cte.dt
 GROUP BY cte.dt
 ORDER BY cte.dt