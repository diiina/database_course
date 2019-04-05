CREATE TEMPORARY TABLE sessions AS (SELECT v.DateVisit as dttm, o.idClient FROM visits as v LEFT JOIN orders as o ON v.IdOrder = o.IdOrder );

EXPLAIN WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(DateVisit AS DATE)) AS dt FROM visits
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(DateVisit AS DATE)) FROM visits)
)
SELECT cte.dt, COUNT(DISTINCT o.IdClient)
  FROM visits AS v LEFT JOIN orders as o ON v.IdOrder = o.IdOrder  RIGHT JOIN cte ON CAST(v.DateVisit AS DATE) = cte.dt
 GROUP BY cte.dt
 ORDER BY cte.dt