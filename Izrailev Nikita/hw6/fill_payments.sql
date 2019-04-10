USE mydb;

DELIMITER //

CREATE PROCEDURE fill_payments(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Payment (owner_id, payment_dttm, payment_sum)
            VALUES ((1 + FLOOR(RAND() * 149)),
                    FROM_UNIXTIME(UNIX_TIMESTAMP('2019-03-25 15:11:11') + FLOOR(0 + (RAND() * 25200))),
                    FLOOR(RAND() * 10000));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL fill_payments(120);