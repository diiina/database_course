-- Пока так.

CREATE TABLE Users (
 Id SERIAL PRIMARY KEY,
 Name VARCHAR(50) UNIQUE NOT NULL,
 Email VARCHAR(50) UNIQUE NOT NULL,
 WalletScore BIGINT,
 Score BIGINT,
 sex enum('man', 'woman') NULL, 
 date_birth TIMESTAMP NOT NULL,
 reg_dttm TIMESTAMP NOT NULL
);
CREATE INDEX indexName ON Users(Name);
CREATE INDEX indexEmail ON Users(email);

CREATE TABLE Topic (
 Id SERIAL PRIMARY KEY,
 Name VARCHAR(50) UNIQUE NOT NULL,
 Description VARCHAR(1000) NOT NULL,
 DialogsCount BIGINT
);
CREATE INDEX indexName ON Topic(Name);