USE technotrack_formula_1;

INSERT INTO categories (category_name, ticket_price_coefficient) 
VALUES ('standart: race', 1),
       ('standart: qualification', 1),
       ('standart: free practice', 0.7),
       ('child: race', 0.5),
       ('child: qualification', 0.5),
       ('child: free practice', 0.35);
