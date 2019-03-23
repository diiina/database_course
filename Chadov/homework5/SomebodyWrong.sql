-- Пока так.

CREATE TABLE Users (
 Id SERIAL PRIMARY KEY,
 Name VARCHAR(50) UNIQUE,
 Email VARCHAR(50) UNIQUE,
 WalletScore BIGINT,
 Score BIGINT,
 Sex enum('man', 'woman'), 
 DateBirth TIMESTAMP,
 RegDttm TIMESTAMP
);
CREATE INDEX indexName ON Users(Name);
CREATE INDEX indexEmail ON Users(email);

CREATE TABLE IF NOT EXISTS sessions (
	Id INT,
	UserId INT REFERENCES users(Id),
	BeginDttm TIMESTAMP,
	EndDttm TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payments (
	Id INT,
	UserId INT REFERENCES users(Id),
	PaymentSum DOUBLE,
	PaymentDttm TIMESTAMP
);

CREATE TABLE Topic (
 Id SERIAL PRIMARY KEY,
 Name VARCHAR(50) UNIQUE,
 Description VARCHAR(1000),
 DialogsCount BIGINT
);
CREATE INDEX indexName ON Topic(Name);