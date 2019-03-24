-- WAU — Weekly Active Users — количество уникальных пользователей, которые зашли в приложение в течение недели

WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 7 DAY
      FROM cte
     WHERE dt + INTERVAL 7 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt, COUNT(DISTINCT sessions.user_id)
  FROM sessions RIGHT JOIN cte ON CAST(sessions.begin_dttm AS DATE) = cte.dt
 GROUP BY cte.dt
 ORDER BY cte.dt

+------------+----------------------------------+
| dt         | COUNT(DISTINCT sessions.user_id) |
+------------+----------------------------------+
| 2018-08-02 |                                1 |
| 2018-08-09 |                                6 |
| 2018-08-16 |                               11 |
| 2018-08-23 |                               15 |
| 2018-08-30 |                               19 |
| 2018-09-06 |                               23 |
| 2018-09-13 |                               26 |
| 2018-09-20 |                               34 |
| 2018-09-27 |                               36 |
+------------+----------------------------------+