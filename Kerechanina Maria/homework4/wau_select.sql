# WAU

WITH RECURSIVE cte AS
(
SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
UNION ALL
SELECT dt + INTERVAL 7 DAY
FROM cte
WHERE dt + INTERVAL 7 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt, COUNT(DISTINCT sessions.user_id) AS WAU
FROM sessions RIGHT JOIN cte 
ON CAST(sessions.begin_dttm AS DATE) >= cte.dt AND CAST(sessions.begin_dttm AS DATE) < cte.dt + INTERVAL 7 DAY 
GROUP BY cte.dt
ORDER BY cte.dt;

+------------+-----+
| dt         | WAU |
+------------+-----+
| 2018-08-02 |   6 |
| 2018-08-09 |  11 |
| 2018-08-16 |  17 |
| 2018-08-23 |  22 |
| 2018-08-30 |  30 |
| 2018-09-06 |  35 |
| 2018-09-13 |  41 |
| 2018-09-20 |  49 |
| 2018-09-27 |  51 |
+------------+-----+

