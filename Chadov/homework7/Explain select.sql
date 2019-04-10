+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+----------------------------------------------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra                                              |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+----------------------------------------------------+
|  1 | PRIMARY     | <derived2> | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    3 |   100.00 | Using temporary; Using filesort                    |
|  1 | PRIMARY     | sessions   | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7472 |   100.00 | Using where; Using join buffer (Block Nested Loop) |
|  2 | DERIVED     | sessions   | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7472 |   100.00 | NULL                                               |
|  3 | UNION       | cte        | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    2 |   100.00 | Recursive; Using where                             |
|  5 | SUBQUERY    | sessions   | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 7472 |   100.00 | NULL                                               |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+----------------------------------------------------+

+----+-------------+------------+------------+-------+---------------+------------+---------+------+------+----------+----------------------------------------------------+
| id | select_type | table      | partitions | type  | possible_keys | key        | key_len | ref  | rows | filtered | Extra                                              |
+----+-------------+------------+------------+-------+---------------+------------+---------+------+------+----------+----------------------------------------------------+
|  1 | PRIMARY     | <derived2> | NULL       | ALL   | NULL          | NULL       | NULL    | NULL |    3 |   100.00 | Using temporary; Using filesort                    |
|  1 | PRIMARY     | sessions   | NULL       | ALL   | NULL          | NULL       | NULL    | NULL | 3591 |   100.00 | Using where; Using join buffer (Block Nested Loop) |
|  2 | DERIVED     | sessions   | NULL       | index | NULL          | iBeginTime | 5       | NULL | 3591 |   100.00 | Using index                                        |
|  3 | UNION       | cte        | NULL       | ALL   | NULL          | NULL       | NULL    | NULL |    2 |   100.00 | Recursive; Using where                             |
|  5 | SUBQUERY    | sessions   | NULL       | index | NULL          | iBeginTime | 5       | NULL | 3591 |   100.00 | Using index                                        |
+----+-------------+------------+------------+-------+---------------+------------+---------+------+------+----------+----------------------------------------------------+

--Добавил индексы на degin_ddtm, запрос оптимизировался.