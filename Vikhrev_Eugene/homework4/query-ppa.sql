WITH RECURSIVE cte AS (
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
    UNION ALL
    SELECT dt + INTERVAL 1 DAY FROM cte
    WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
) SELECT C.dt, count(DISTINCT SP.payments) / count(DISTINCT SP.user_id)  AS ppa
    FROM cte C JOIN (
        SELECT S.user_id, min(P.payment_sum) AS payments, S.begin_dttm
        FROM sessions S LEFT JOIN payments P
        ON S.user_id = P.user_id
        GROUP BY S.user_id, S.begin_dttm
    ) AS SP
    ON CAST(SP.begin_dttm AS DATE) BETWEEN C.dt AND (C.dt + INTERVAL 6 DAY)
    GROUP BY C.dt
    ORDER BY C.dt;

# Min returns NULL only when every value in group is null
# It is convenient to use payment_sum, as it is NOT NULL,
# and compatible with min operation, hence, no casting required.