CREATE TABLE IF NOT EXISTS users (
  user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
  login   VARCHAR(50) NOT NULL,
  reg_dttm TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);