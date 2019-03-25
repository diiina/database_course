USE technotrack_formula_1;

DELIMITER //
CREATE PROCEDURE populate_clients(IN number_of_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= number_of_rows DO
            INSERT INTO clients (first_name, last_name, email, birth_date, address_id) 
            VALUES (CONCAT('Name', CEIL(RAND() * 100)),
                    CONCAT('LastName', CEIL(RAND() * 100)),
                    CONCAT('username', CEIL(RAND() * 100), '@mail.ru'),
                    DATE(NOW() - INTERVAL FLOOR(RAND() * 12) MONTH - INTERVAL FLOOR(RAND() * 80) YEAR),
                    CEIL(RAND() * 200));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL populate_clients(2500);
