mysql> CREATE TABLE sessions(
    -> session_id INT NOT NULL,
    -> user_id INT NOT NULL REFERENCES users(user_id),
    -> begin_dttm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> end_dttm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> PRIMARY KEY (session_id),
    -> FOREIGN KEY (user_id) REFERENCES users(user_id)
    -> );

