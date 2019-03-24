mysql> CREATE TABLE payments (
    -> payment_id INT NOT NULL,
    -> user_id INT NOT NULL,
    -> payment_sum DOUBLE,
    -> payment_dttm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -> PRIMARY KEY (payment_id),
    -> FOREIGN KEY (user_id) REFERENCES users(user_id));

