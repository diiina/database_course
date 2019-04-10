USE mydb;

DELIMITER //
CREATE PROCEDURE fill_owner(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Owner (login, email, password, city, first_name, middle_name, last_name)
            VALUES (CONCAT('login', i),
                    CONCAT('email', i),
                    CONCAT('password', i),
                    CONCAT('city', CONVERT(FLOOR(RAND() * 1000), CHAR)),
                    CONCAT('first_name', i),
                    CONCAT('middle_name', i),
                    CONCAT('last_name', i));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL fill_owner(150);