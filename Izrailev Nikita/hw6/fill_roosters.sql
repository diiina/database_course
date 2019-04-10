USE mydb;

DELIMITER //
CREATE PROCEDURE fill_rooster(IN num_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= num_rows DO
            INSERT INTO Rooster (owner_id, name, breed)
            VALUES (1 + FLOOR(RAND() * 149),
                    CONCAT('name', i),
                    CONCAT('breed', CONVERT(FLOOR(RAND() * 10), CHAR)));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL fill_rooster(200);