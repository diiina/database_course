EXPLAIN EXTENDED WITH RECURSIVE cte AS
(
   SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM Session
        UNION ALL
   SELECT cte.dt + INTERVAL 1 DAY
        FROM cte
        WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM Session)
)
SELECT cte.dt as day, dau.c as DAU
FROM cte
LEFT JOIN (SELECT CAST(begin_dttm AS DATE) AS dt, COUNT(DISTINCT owner_id) AS c FROM Session GROUP BY dt) AS dau
ON cte.dt = dau.dt;

	+------------+------+
	| day        | DAU  |
	+------------+------+
	| 2019-03-25 |   41 |
	| 2019-03-26 |   29 |
	| 2019-03-27 |   33 |
	| 2019-03-28 |   40 |
	| 2019-03-29 |   38 |
	| 2019-03-30 |   32 |
	| 2019-03-31 |   32 |
	| 2019-04-01 |   44 |
	| 2019-04-02 |   39 |
	| 2019-04-03 |   25 |
	+------------+------+

