USE technotrack_formula_1;

DELIMITER //
CREATE PROCEDURE populate_tickets(IN number_of_rows INT, IN status_in VARCHAR(45))
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= number_of_rows DO
            INSERT INTO tickets (client_id, on_date, tribune_id, place, category_id, status) 
            VALUES (CEIL(RAND() * 2000),
                    DATE(NOW() - INTERVAL FLOOR(RAND() * 2) MONTH - INTERVAL FLOOR(RAND() * 2) YEAR),
					(CEIL(RAND() * 18) + 1),
                    CEIL(RAND() * 2000),
                    CEIL(RAND() * 5 + 1),
                    status_in);
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL populate_tickets(2500, 'active');
CALL populate_tickets(2500, 'expired');
