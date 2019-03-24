CREATE DATABASE IF NOT EXISTS chat;
USE chat;

CREATE TABLE IF NOT EXISTS User (
  id BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  is_banned BOOLEAN NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Admin (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL UNIQUE REFERENCES User(id),
  access_level INT(2) UNSIGNED NOT NULL
);

CREATE TABLE IF NOT EXISTS Donation (
  id SERIAL PRIMARY KEY,
  sum BIGINT UNSIGNED NOT NULL,
  dttm DATETIME NOT NULL,
  donator_id BIGINT UNSIGNED NOT NULL REFERENCES User(id)
);

CREATE TABLE IF NOT EXISTS Message (
  id SERIAL PRIMARY KEY,
  text TEXT NOT NULL,
  user_id BIGINT UNSIGNED NOT NULL REFERENCES User(id)
);