mysql> CREATE TABLE users(
    -> user_id INT NOT NULL,
    -> login VARCHAR(30),
    -> reg_dttm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> PRIMARY KEY (user_id)
    -> );

