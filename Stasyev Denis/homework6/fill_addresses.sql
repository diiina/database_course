USE technotrack_formula_1;

DELIMITER //
CREATE PROCEDURE populate_addresses(IN number_of_rows INT, IN country_in VARCHAR(45), IN city_in VARCHAR(45))
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= number_of_rows DO
            INSERT INTO addresses (country, postal_code, city, street_address) 
            VALUES (country_in, 
                    CEIL(RAND() * 100000),
                    city_in,
                    CONCAT('Street', CEIL(RAND() * 100));
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL populate_addresses(10, 'Russia', 'Moscow');
CALL populate_addresses(40, 'Russia', 'Bryansk');
CALL populate_addresses(30, 'France', 'Paris');
CALL populate_addresses(40, 'Spain', 'Barcelona');


DELIMITER //
CREATE PROCEDURE populate_addresses_full(IN number_of_rows INT, IN country_in VARCHAR(45),IN state_province_in VARCHAR(45), IN city_in VARCHAR(45))
    BEGIN
        DECLARE i INT;
        SET i = 1;
        START TRANSACTION;
        WHILE i <= number_of_rows DO
            INSERT INTO addresses (country, postal_code, state_province, city, street_address) 
            VALUES (country_in, 
                    CEIL(RAND() * 100000),
                    state_province_in,
                    city_in,
                    CONCAT('st. Street', 
						   CEIL(RAND() * 100),
                           ', h. ',
                           CEIL(RAND() * 300),
                           ', fl. ',
                           CEIL(RAND() * 1000)
                           )
					);
            SET i = i + 1;
        END WHILE;
        COMMIT;
    END//
DELIMITER ;

CALL populate_addresses_full(20, 'Russia', 'Moscow region', 'Dolgoprudny');
CALL populate_addresses_full(20, 'Russia', 'Oryol region', 'Oryol');
CALL populate_addresses_full(60, 'Great Britain', 'London', 'London');
CALL populate_addresses_full(60, 'Great Britain', 'North East', 'Bamburgh');

