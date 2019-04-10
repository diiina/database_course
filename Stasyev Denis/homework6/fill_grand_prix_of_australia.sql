USE technotrack_formula_1;

INSERT INTO addresses (country, postal_code, city, street_address) 
VALUES ('Australia', 3206, 'Melbourne', '12 Aughtie Dr');

INSERT INTO tracks (track_name, address_id) 
VALUES ('Albert Park', 1);

-- GS - Grandstand, GA - General Admission
INSERT INTO tribunes (tribune_name, track_id, tribune_capacity, ticket_price) 
VALUES ('Schumacher GS', 1, 8500, 150),
       ('Prost GS', 1, 8500, 150),
       ('Senna GS', 1, 6500, 120),
       ('Webber GS', 1, 6500, 120),
       ('Fangio GS', 1, 21500, 100),
       ('Moss GS', 1, 4700, 120),
       ('Jones GS', 1, 9500, 140),
       ('Brabham GS', 1, 12500, 150),
       ('Piquet GS', 1, 4200, 170),
       ('Ricciardo GS', 1, 4200, 110),
       ('Clark GS', 1, 9500, 125),
       ('Waite GS', 1, 4500, 85),
       ('Sports center GA', 1, 35500, 60),
       ('Hellas corner GA', 1, 19000, 70),
       ('Marina GA', 1, 21800, 50),
       ('Lauda GA', 1, 20600, 55),
       ('Turn 9 GA', 1, 3800, 75),
       ('Ascari GA', 1, 1800, 80),
       ('Stewart GA', 1, 8800, 70);

