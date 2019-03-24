CREATE TABLE items (
item_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE statuses (
status_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
discount SMALLINT UNSIGNED DEFAULT 0
);

CREATE TABLE clients (
client_id SERIAL PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
second_name VARCHAR(30) NOT NULL,
vk_id VARCHAR(30) NOT NULL,
registration_dttm TIMESTAMP NOT NULL,
status_id INT UNSIGNED NOT NULL,

FOREIGN KEY (status_id) REFERENCES statuses(status_id) ON DELETE CASCADE
);

CREATE TABLE orders (
order_id SERIAL PRIMARY KEY,
client_id INT UNSIGNED NOT NULL,
total_price INT UNSIGNED NOT NULL DEFAULT 0,

FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

CREATE TABLE shifts (
shift_id SERIAL PRIMARY KEY,
start_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
end_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

CREATE TABLE roles (
role_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
money_per_hour INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE staff (
staff_id SERIAL PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
second_name VARCHAR(30) NOT NULL,
vk_id VARCHAR(30) NOT NULL,
first_day_dttm TIMESTAMP NOT NULL,
shift_id INT UNSIGNED NOT NULL,
role_id INT UNSIGNED NOT NULL,

FOREIGN KEY (shift_id) REFERENCES shifts(shift_id) ON DELETE CASCADE
FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
);

CREATE TABLE providers (
provider_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
email VARCHAR(40) NOT NULL,
phone_number VARCHAR(25) DEFAULT NULL
);

CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price INT UNSIGNED  NOT NULL DEFAULT 0,
provider_id INT UNSIGNED NOT NULL,

FOREIGN KEY (provider_id) REFERENCES providers(provider_id) ON DELETE CASCADE
);

CREATE TABLE order_item_link (
order_item_link_id SERIAL PRIMARY KEY,
item_id INT UNSIGNED NOT NULL,
order_id INT UNSIGNED NOT NULL,
quantity SMALLINT UNSIGNED NOT NULL,

FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE
);

CREATE TABLE product_item_link (
product_item_link_id SERIAL PRIMARY KEY,
product_id INT UNSIGNED NOT NULL,
item_id INT UNSIGNED NOT NULL,
quantity SMALLINT UNSIGNED NOT NULL,

FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
FOREIGN KEY (item_id) REFERENCES items(item_id) ON DELETE CASCADE
);