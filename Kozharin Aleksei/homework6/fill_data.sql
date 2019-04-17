USE chat;

DROP TABLE Administrator, User, Message, Donation;
DROP PROCEDURE fill_users;
DROP PROCEDURE fill_messages;

DELIMITER \\;
CREATE PROCEDURE fill_users(IN total_rows INT)
BEGIN
  DECLARE i INT;
  SET i = 0;
  WHILE i < total_rows DO
    INSERT INTO User(first_name, last_name, is_banned)
    VALUES (CONCAT('name ', i),
            CONCAT('surname ', i),
            0);
    SET i = i + 1;
  end while;
end;
\\;
DELIMITER ;

DELIMITER \\;
CREATE PROCEDURE drop_all()
BEGIN
  DROP TABLE User, Message, Donation, Administrator;
end;
\\;
DELIMITER ;

DELIMITER \\;
CREATE PROCEDURE fill_messages(IN total_messages INT)
BEGIN
  DECLARE i INT;
  SET i = 0;
  WHILE i < total_messages DO
    INSERT INTO Message(text, user_id)
    VALUES ('Hello!', (SELECT MAX(id) FROM User));
    SET i = i + 1;
  end while;
end;
\\;
DELIMITER ;

DELIMITER \\;
CREATE PROCEDURE fill_donations(IN total_donations INT)
BEGIN
  DECLARE i INT;
  SET i = 0;
  WHILE i < total_donations DO
    INSERT INTO Donation(sum, dttm, donator_id)
    VALUES (1020, NOW(), (SELECT MIN(id) FROM User));
    SET i = i + 1;
  end while;
end;
\\;
DELIMITER ;

DELIMITER \\;
CREATE PROCEDURE fill_admins(IN start_id INT, IN stop_id INT)
BEGIN
  DECLARE i INT;
  SET i = start_id;
  WHILE i < stop_id DO
    INSERT INTO Administrator(user_id, access_level)
    VALUES(i, 1);
    SET i = i + 1;
  end while;
end;
\\;

CALL fill_users(200);
CALL fill_messages(200);
CALL fill_donations(200);
CALL fill_admins(10, 20);