SELECT AVG(c) FROM (SELECT  count(s.session_id) AS c FROM sessions AS s RIGHT JOIN users as u ON u.user_id = s.user_id GROUP BY u.user_id) AS t;

>35.9100
