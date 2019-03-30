USE technotrack_formula_1;

DELIMITER //
CREATE PROCEDURE populate_payments_in(IN number_of_rows INT)
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= number_of_rows DO
            INSERT INTO payments_in (client_id, ticket_id, payment_in_size, created_at) 
            VALUES (CEIL(RAND() * 2500),
					CEIL(RAND() * 5000),
                    CEIL(50 + RAND() * 150),
                    DATE(NOW() - INTERVAL FLOOR(RAND() * 2) MONTH - INTERVAL FLOOR(RAND() * 2) YEAR));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL populate_payments_in(3000);
