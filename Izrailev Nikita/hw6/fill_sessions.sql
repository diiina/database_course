USE mydb;

DELIMITER //
CREATE PROCEDURE fill_session(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Session (owner_id, begin_dttm, end_dttm)
            VALUES (1 + FLOOR(RAND() * 149),
                    NOW() - INTERVAL 4 DAY - INTERVAL FLOOR(RAND() * 10) DAY,
                    NOW() - INTERVAL FLOOR(RAND() * 4) DAY);
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

# CALL fill_session(400);
# SELECT FROM_UNIXTIME(1554762832);
# DELETE FROM Payment;