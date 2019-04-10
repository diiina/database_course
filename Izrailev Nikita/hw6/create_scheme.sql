CREATE TABLE Owner (
  owner_id SERIAL,
  login CHAR(32) NOT NULL UNIQUE,
  email CHAR(32) NOT NULL UNIQUE,
  password CHAR(64) NOT NULL,
  city TEXT NOT NULL,
  first_name TEXT NOT NULL,
  middle_name TEXT,
  last_name TEXT,
  PRIMARY KEY (owner_id)
);

CREATE TABLE Rooster (
  rooster_id SERIAL,
  owner_id BIGINT UNSIGNED,
  name TEXT NOT NULL,
  breed TEXT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
  PRIMARY KEY (rooster_id)
);

CREATE TABLE Rating (
  rooster_id BIGINT UNSIGNED,
  wins INT,
  losses INT,
  competition_wins INT,
  total_score FLOAT(32),
  FOREIGN KEY (rooster_id) REFERENCES Rooster(rooster_id)
);

CREATE TABLE Payment (
  payment_id SERIAL,
  owner_id BIGINT UNSIGNED,
  payment_dttm TIMESTAMP NOT NULL,
  payment_sum BIGINT,
  FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
  PRIMARY KEY (payment_id)
);

CREATE TABLE Session (
  session_id SERIAL,
  owner_id BIGINT UNSIGNED,
  begin_dttm TIMESTAMP NOT NULL,
  end_dttm TIMESTAMP NULL,
  FOREIGN KEY (owner_id) REFERENCES Owner(owner_id),
  PRIMARY KEY (session_id)
);

CREATE TABLE Competition (
  competition_id SERIAL,
  date DATETIME NOT NULL,
  participant_limit INT NOT NULL,
  prize BIGINT,
  winner BIGINT UNSIGNED,
  PRIMARY KEY (competition_id)
);

CREATE TABLE Participant (
  participant_id SERIAL,
  rooster_id BIGINT UNSIGNED,
  competition_id BIGINT UNSIGNED,
  payment_id BIGINT UNSIGNED,
  PRIMARY KEY (participant_id),
  FOREIGN KEY (rooster_id) REFERENCES Rooster(rooster_id),
  FOREIGN KEY (competition_id) REFERENCES Competition(competition_id),
  FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);