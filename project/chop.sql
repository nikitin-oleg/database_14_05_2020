CREATE DATABASE IF NOT EXISTS `chop` DEFAULT CHARACTER SET utf8 ;
USE `chop` ;

-- -----------------------------------------------------
-- Table `chop`.`staff_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`staff_list` (
  `guard` VARCHAR(50) UNICODE NULL,
  `supervisor` VARCHAR(50) UNICODE NULL,
  `id` INT NOT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `chop`.`licenses_of_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`licenses_of_employees` (
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  `licenses_id` INT NOT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`licenses_id`));


-- -----------------------------------------------------
-- Table `chop`.`promotion_or_ punishment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`promotion_or_ punishment` (
  `promotion` VARCHAR(250) UNICODE NULL,
  `punishment` VARCHAR(250) UNICODE NULL,
  `id` INT NOT NULL,
  `staff_id` INT NULL,
  `date_of_promotion` DATE NULL,
  `date_of_ punishmentcol` DATE NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `chop`.`category_of_guard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`category_of_guard` (
  `category_id` INT NOT NULL,
  `category_of_guard` INT NOT NULL,
  `staff_id` INT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `chop`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`customers` (
  `name` VARCHAR(50) UNICODE NULL,
  `head` VARCHAR(50) UNICODE NULL,
  `phone` BIGINT NULL,
  `e-mail` VARCHAR(50) NULL,
  `customers_id` INT NOT NULL,
  `protected_object_id` INT(5) NULL,
  PRIMARY KEY (`customers_id`),
  UNIQUE INDEX `customers_id_UNIQUE` (`customers_id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `chop`.`protected_objects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`protected_objects` (
  `name` VARCHAR(50) UNICODE NOT NULL,
  `address` VARCHAR(50) UNICODE NULL,
  `contact_person` VARCHAR(50) UNICODE NULL,
  ` start_contract` DATE NULL,
  ` end_contract` DATE NULL,
  `objects_id` INT NOT NULL,
  `customers_customers_id` INT NOT NULL,
  `staff_id` INT NULL,
  `videocontrol` VARCHAR(45) NULL,
  `alarm_system` VARCHAR(45) NULL,
  PRIMARY KEY (`objects_id`, `customers_customers_id`),
  UNIQUE INDEX `objects_id_UNIQUE` (`objects_id` ASC) VISIBLE,
  INDEX `fk_protected_objects_customers1_idx` (`customers_customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_protected_objects_customers1`
    FOREIGN KEY (`customers_customers_id`)
    REFERENCES `chop`.`customers` (`customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `chop`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`staff` (
  `name` VARCHAR(50) UNICODE NOT NULL,
  `address` VARCHAR(50) UNICODE NOT NULL,
  `phone` BIGINT NOT NULL,
  `birthdata` DATE NOT NULL,
  `Id` INT NOT NULL AUTO_INCREMENT,
  `staff_list_id` INT NOT NULL,
  `licenses_of_employees_licenses_id` INT NOT NULL,
  `promotion_or_ punishment_id` INT NOT NULL,
  `category_of_guard_category_id` INT NOT NULL,
  `protected_objects_objects_id` INT NOT NULL,
  `protected_objects_customers_customers_id` INT NOT NULL,
  `employment_date` DATE NULL,
  PRIMARY KEY (`Id`, `staff_list_id`, `licenses_of_employees_licenses_id`, `promotion_or_ punishment_id`, `category_of_guard_category_id`, `protected_objects_objects_id`, `protected_objects_customers_customers_id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_staff_staff_list_idx` (`staff_list_id` ASC) VISIBLE,
  INDEX `fk_staff_licenses_of_employees1_idx` (`licenses_of_employees_licenses_id` ASC) VISIBLE,
  INDEX `fk_staff_promotion_or_ punishment1_idx` (`promotion_or_ punishment_id` ASC) VISIBLE,
  INDEX `fk_staff_category_of_guard1_idx` (`category_of_guard_category_id` ASC) VISIBLE,
  INDEX `fk_staff_protected_objects1_idx` (`protected_objects_objects_id` ASC, `protected_objects_customers_customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_staff_list`
    FOREIGN KEY (`staff_list_id`)
    REFERENCES `chop`.`staff_list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_licenses_of_employees1`
    FOREIGN KEY (`licenses_of_employees_licenses_id`)
    REFERENCES `chop`.`licenses_of_employees` (`licenses_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_promotion_or_ punishment1`
    FOREIGN KEY (`promotion_or_ punishment_id`)
    REFERENCES `chop`.`promotion_or_ punishment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_category_of_guard1`
    FOREIGN KEY (`category_of_guard_category_id`)
    REFERENCES `chop`.`category_of_guard` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_protected_objects1`
    FOREIGN KEY (`protected_objects_objects_id` , `protected_objects_customers_customers_id`)
    REFERENCES `chop`.`protected_objects` (`objects_id` , `customers_customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `chop`.`curator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`curator` (
  `name` VARCHAR(50) UNICODE NULL,
  `military_grade` VARCHAR(50) UNICODE NULL,
  `phone` BIGINT NULL,
  `address` VARCHAR(50) UNICODE NULL,
  `curator_id` INT NOT NULL,
  PRIMARY KEY (`curator_id`));


-- -----------------------------------------------------
-- Table `chop`.`information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`information` (
  `start_licenses_date` DATE NULL,
  `end_licenses_date` DATE NULL,
  `curator_curator_id` INT NOT NULL,
  PRIMARY KEY (`curator_curator_id`),
  CONSTRAINT `fk_information_curator1`
    FOREIGN KEY (`curator_curator_id`)
    REFERENCES `chop`.`curator` (`curator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `chop`.`equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`equipment` (
  `equipment_id` INT NOT NULL AUTO_INCREMENT,
  `equipment` VARCHAR(100) NULL,
  PRIMARY KEY (`equipment_id`));


-- -----------------------------------------------------
-- Table `chop`.`equipment_has_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `chop`.`staff_has_equipment` (
  `staff_Id` INT NOT NULL,
  `staff_staff_list_id` INT NOT NULL,
  `staff_licenses_of_employees_licenses_id` INT NOT NULL,
  `staff_promotion_or_ punishment_id` INT NOT NULL,
  `staff_category_of_guard_category_id` INT NOT NULL,
  `staff_protected_objects_objects_id` INT NOT NULL,
  `staff_protected_objects_customers_customers_id` INT NOT NULL,
  `equipment_equipment_id` INT NOT NULL,
  PRIMARY KEY (`staff_Id`, `staff_staff_list_id`, `staff_licenses_of_employees_licenses_id`, `staff_promotion_or_ punishment_id`, `staff_category_of_guard_category_id`, `staff_protected_objects_objects_id`, `staff_protected_objects_customers_customers_id`, `equipment_equipment_id`),
  INDEX `fk_staff_has_equipment_equipment1_idx` (`equipment_equipment_id` ASC) VISIBLE,
  INDEX `fk_staff_has_equipment_staff1_idx` (`staff_Id` ASC, `staff_staff_list_id` ASC, `staff_licenses_of_employees_licenses_id` ASC, `staff_promotion_or_ punishment_id` ASC, `staff_category_of_guard_category_id` ASC, `staff_protected_objects_objects_id` ASC, `staff_protected_objects_customers_customers_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_has_equipment_staff1`
    FOREIGN KEY (`staff_Id` , `staff_staff_list_id` , `staff_licenses_of_employees_licenses_id` , `staff_promotion_or_ punishment_id` , `staff_category_of_guard_category_id` , `staff_protected_objects_objects_id` , `staff_protected_objects_customers_customers_id`)
    REFERENCES `chop`.`staff` (`Id` , `staff_list_id` , `licenses_of_employees_licenses_id` , `promotion_or_ punishment_id` , `category_of_guard_category_id` , `protected_objects_objects_id` , `protected_objects_customers_customers_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_has_equipment_equipment1`
    FOREIGN KEY (`equipment_equipment_id`)
    REFERENCES `chop`.`equipment` (`equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

