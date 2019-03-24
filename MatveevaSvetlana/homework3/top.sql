SELECT u.login, sum(p.payment_sum) as sum FROM payments AS p LEFT JOIN users AS u ON u.user_id = p.user_id GROUP BY u.login ORDER BY sum DESC LIMIT 3;

>login_82
>login_38
>login_85