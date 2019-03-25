CREATE SCHEMA `technotrack_formula_1` ;


CREATE TABLE `technotrack_formula_1`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `postal_code` INT UNSIGNED NULL,
  `state_province` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `street_address` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`address_id`));


CREATE TABLE `technotrack_formula_1`.`tracks` (
  `track_id` INT NOT NULL AUTO_INCREMENT,
  `track_name` VARCHAR(100) NOT NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`track_id`),
  UNIQUE INDEX `track_name_UNIQUE` (`track_name` ASC) VISIBLE,
  UNIQUE INDEX `address_id_UNIQUE` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_tracks_1`
    FOREIGN KEY (`address_id`)
    REFERENCES `technotrack_formula_1`.`addresses` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `technotrack_formula_1`.`tribunes` (
  `tribune_id` INT NOT NULL AUTO_INCREMENT,
  `tribune_name` VARCHAR(150) NOT NULL,
  `track_id` INT NOT NULL,
  `tribune_capacity` INT UNSIGNED NOT NULL,
  `ticket_price` DECIMAL(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`tribune_id`),
  INDEX `fk_tribunes_1_idx` (`track_id` ASC) VISIBLE,
  CONSTRAINT `fk_tribunes_1`
    FOREIGN KEY (`track_id`)
    REFERENCES `technotrack_formula_1`.`tracks` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `technotrack_formula_1`.`clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(120) NULL,
  `birth_date` DATE NOT NULL,
  `parent_id` INT NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_clients_1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_clients_1`
    FOREIGN KEY (`address_id`)
    REFERENCES `technotrack_formula_1`.`addresses` (`address_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `technotrack_formula_1`.`clients` 
ADD INDEX `fk_clients_2_idx` (`parent_id` ASC) VISIBLE;
;
ALTER TABLE `technotrack_formula_1`.`clients` 
ADD CONSTRAINT `fk_clients_2`
  FOREIGN KEY (`parent_id`)
  REFERENCES `technotrack_formula_1`.`clients` (`client_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `technotrack_formula_1`.`clients` 
DROP INDEX `email_UNIQUE` ;
;


CREATE TABLE `technotrack_formula_1`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(65) NOT NULL,
  `ticket_price_coefficient` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`category_id`));


CREATE TABLE `technotrack_formula_1`.`tickets` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `on_date` DATE NOT NULL,
  `tribune_id` INT NOT NULL,
  `place` VARCHAR(10) NOT NULL,
  `category_id` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`ticket_id`),
  INDEX `fk_tickets_1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_tickets_2_idx` (`tribune_id` ASC) VISIBLE,
  INDEX `fk_tickets_3_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_tickets_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `technotrack_formula_1`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_2`
    FOREIGN KEY (`tribune_id`)
    REFERENCES `technotrack_formula_1`.`tribunes` (`tribune_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_3`
    FOREIGN KEY (`category_id`)
    REFERENCES `technotrack_formula_1`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `technotrack_formula_1`.`payments_in` (
  `payment_in_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `ticket_id` INT NOT NULL,
  `payment_in_size` DECIMAL(10,2) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`payment_in_id`),
  INDEX `fk_payments_in_1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_payments_in_2_idx` (`ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_in_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `technotrack_formula_1`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_in_2`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `technotrack_formula_1`.`tickets` (`ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `technotrack_formula_1`.`payments_out` (
  `payment_out_id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NOT NULL,
  `ticket_id` INT NOT NULL,
  `payment_out_size` DECIMAL(10,2) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `reason` VARCHAR(45) NULL,
  PRIMARY KEY (`payment_out_id`),
  INDEX `fk_payments_out_1_idx` (`client_id` ASC) VISIBLE,
  INDEX `fk_payments_out_2_idx` (`ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_payments_out_1`
    FOREIGN KEY (`client_id`)
    REFERENCES `technotrack_formula_1`.`clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_out_2`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `technotrack_formula_1`.`tickets` (`ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



