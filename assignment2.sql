-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Coustomer_jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coustomer_jl1181` (
  `Coustomer_ID` INT NOT NULL,
  `Coustomer_Email` VARCHAR(45) NOT NULL,
  `Coustomer_phone` INT NOT NULL,
  `Coustomer_address` VARCHAR(45) NOT NULL,
  `Coustomer_name` VARCHAR(45) NOT NULL,
  `Coustomer_photo` VARCHAR(45) NOT NULL,
  `Coustomer_driver_license` VARCHAR(45) NOT NULL,
  `Coustomer_pay_method` VARCHAR(45) NOT NULL,
  `Coustomer_gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Coustomer_ID`),
  UNIQUE INDEX `Coustomer_driver_license_UNIQUE` (`Coustomer_driver_license` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Car_jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Car_jl1181` (
  `Car_ID` INT NOT NULL,
  `Car_Vin` INT NOT NULL,
  `Car_owner_information` VARCHAR(45) NOT NULL,
  `Car_location` VARCHAR(45) NOT NULL,
  `Car_details` VARCHAR(45) NULL,
  `Car_availability` VARCHAR(45) NOT NULL,
  `Car_photo` VARCHAR(45) NOT NULL,
  `Car_Category` INT NOT NULL,
  PRIMARY KEY (`Car_ID`),
  UNIQUE INDEX `Car_ID_UNIQUE` (`Car_ID` ASC) VISIBLE,
  UNIQUE INDEX `Car_Vin_UNIQUE` (`Car_Vin` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Coustomer_table_has_Car_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Coustomer_table_has_Car_table` (
  `Coustomer_table_Coustomer_ID` INT NOT NULL,
  `Car_table_Car_ID` INT NOT NULL,
  PRIMARY KEY (`Coustomer_table_Coustomer_ID`, `Car_table_Car_ID`),
  INDEX `fk_Coustomer_table_has_Car_table_Car_table1_idx` (`Car_table_Car_ID` ASC) VISIBLE,
  INDEX `fk_Coustomer_table_has_Car_table_Coustomer_table_idx` (`Coustomer_table_Coustomer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Coustomer_table_has_Car_table_Coustomer_table`
    FOREIGN KEY (`Coustomer_table_Coustomer_ID`)
    REFERENCES `mydb`.`Coustomer_jl1181` (`Coustomer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coustomer_table_has_Car_table_Car_table1`
    FOREIGN KEY (`Car_table_Car_ID`)
    REFERENCES `mydb`.`Car_jl1181` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order-jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order-jl1181` (
  `Order_ID` INT NOT NULL,
  `Order_Creatdate` DATE NOT NULL,
  `Order_bookstartdate` DATE NOT NULL,
  `Order_bookenddate` DATE NOT NULL,
  `Order_pickuplocation` VARCHAR(45) NOT NULL,
  `Order_returnlocation` VARCHAR(45) NOT NULL,
  `Order_ price` INT NOT NULL,
  `Order_discountprice` INT NOT NULL,
  `Order_status` VARCHAR(45) NOT NULL,
  `Order_rateand review` VARCHAR(45) NULL,
  `Car_jl1181_Car_ID` INT NOT NULL,
  `Coustomer_jl1181_Coustomer_ID` INT NOT NULL,
  PRIMARY KEY (`Order_ID`, `Car_jl1181_Car_ID`, `Coustomer_jl1181_Coustomer_ID`),
  UNIQUE INDEX `Order_ID_UNIQUE` (`Order_ID` ASC) VISIBLE,
  UNIQUE INDEX `Order_Creatdate_UNIQUE` (`Order_Creatdate` ASC) VISIBLE,
  UNIQUE INDEX `Order_startdate_UNIQUE` (`Order_bookstartdate` ASC) VISIBLE,
  UNIQUE INDEX `Order_bookenddate_UNIQUE` (`Order_bookenddate` ASC) VISIBLE,
  INDEX `fk_Order-jl1181_Car_jl11811_idx` (`Car_jl1181_Car_ID` ASC) VISIBLE,
  INDEX `fk_Order-jl1181_Coustomer_jl11811_idx` (`Coustomer_jl1181_Coustomer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order-jl1181_Car_jl11811`
    FOREIGN KEY (`Car_jl1181_Car_ID`)
    REFERENCES `mydb`.`Car_jl1181` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order-jl1181_Coustomer_jl11811`
    FOREIGN KEY (`Coustomer_jl1181_Coustomer_ID`)
    REFERENCES `mydb`.`Coustomer_jl1181` (`Coustomer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CarOwner_jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CarOwner_jl1181` (
  `CarOwnerId` INT NOT NULL,
  `CarOwner_name` VARCHAR(45) NULL,
  `CarOwner_gender` VARCHAR(45) NOT NULL,
  `CarOwner_Email` VARCHAR(45) NOT NULL,
  `CarOwner_address` VARCHAR(45) NOT NULL,
  `CarOwner_phonenumber` INT NOT NULL,
  `CarOwner_rateandreview` VARCHAR(45) NULL,
  `CarOwner_photo` VARCHAR(45) NOT NULL,
  `CarOwner_car information` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CarOwnerId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CarCategory_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CarCategory_table` (
  `CarCategory_ID` INT NOT NULL,
  `CarCategory_type(name)` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CarCategory_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`COSTUMER_TABLE-jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`COSTUMER_TABLE-jl1181` (
  `COSTUMER_ID` INT NOT NULL,
  `Coustomer_Email` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL,
  `photo` VARCHAR(45) NULL,
  `driver_license` VARCHAR(45) NOT NULL,
  `pay_methods` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COSTUMER_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LOCATION_TABLE_JL1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LOCATION_TABLE_JL1181` (
  `ORDER_ID` INT NOT NULL,
  `LOCATION_pickup` VARCHAR(45) NOT NULL,
  `LOCATION_return` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ORDER_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIME-TABLE-JL1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIME-TABLE-JL1181` (
  `TIME-ID` INT NOT NULL,
  `order_creatdate` DATE NOT NULL,
  `order_startdate` DATE NOT NULL,
  `order_enddate` DATE NOT NULL,
  PRIMARY KEY (`TIME-ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carowner_TABLE-jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carowner_TABLE-jl1181` (
  `CAROWNER_ID` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `phone` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL,
  `photo` VARCHAR(45) NULL,
  `driver_license` VARCHAR(45) NOT NULL,
  `pay_methods` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CAROWNER_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ORDER_FACT_TABLE_JL1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ORDER_FACT_TABLE_JL1181` (
  `COSTUMER_TABLE-jl1181_COSTUMER_ID` INT NOT NULL,
  `LOCATION_TABLE_JL1181_ORDER_ID` INT NOT NULL,
  `ORDER_price` INT NOT NULL,
  `TIME-TABLE-JL1181_TIME-ID` INT NOT NULL,
  `Carowner_TABLE-jl1181_CAROWNER_ID` INT NOT NULL,
  `Car_jl1181_Car_ID` INT NOT NULL,
  PRIMARY KEY (`COSTUMER_TABLE-jl1181_COSTUMER_ID`, `LOCATION_TABLE_JL1181_ORDER_ID`, `TIME-TABLE-JL1181_TIME-ID`, `Carowner_TABLE-jl1181_CAROWNER_ID`, `Car_jl1181_Car_ID`),
  INDEX `fk_FACT_TABLE_JL1181_COSTUMER_TABLE-jl11811_idx` (`COSTUMER_TABLE-jl1181_COSTUMER_ID` ASC) VISIBLE,
  INDEX `fk_ORDER_FACT_TABLE_JL1181_LOCATION_TABLE_JL11811_idx` (`LOCATION_TABLE_JL1181_ORDER_ID` ASC) VISIBLE,
  INDEX `fk_ORDER_FACT_TABLE_JL1181_TIME-TABLE-JL11811_idx` (`TIME-TABLE-JL1181_TIME-ID` ASC) VISIBLE,
  INDEX `fk_ORDER_FACT_TABLE_JL1181_Carowner_TABLE-jl11811_idx` (`Carowner_TABLE-jl1181_CAROWNER_ID` ASC) VISIBLE,
  INDEX `fk_ORDER_FACT_TABLE_JL1181_Car_jl11811_idx` (`Car_jl1181_Car_ID` ASC) VISIBLE,
  CONSTRAINT `fk_FACT_TABLE_JL1181_COSTUMER_TABLE-jl11811`
    FOREIGN KEY (`COSTUMER_TABLE-jl1181_COSTUMER_ID`)
    REFERENCES `mydb`.`COSTUMER_TABLE-jl1181` (`COSTUMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_FACT_TABLE_JL1181_LOCATION_TABLE_JL11811`
    FOREIGN KEY (`LOCATION_TABLE_JL1181_ORDER_ID`)
    REFERENCES `mydb`.`LOCATION_TABLE_JL1181` (`ORDER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_FACT_TABLE_JL1181_TIME-TABLE-JL11811`
    FOREIGN KEY (`TIME-TABLE-JL1181_TIME-ID`)
    REFERENCES `mydb`.`TIME-TABLE-JL1181` (`TIME-ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_FACT_TABLE_JL1181_Carowner_TABLE-jl11811`
    FOREIGN KEY (`Carowner_TABLE-jl1181_CAROWNER_ID`)
    REFERENCES `mydb`.`Carowner_TABLE-jl1181` (`CAROWNER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORDER_FACT_TABLE_JL1181_Car_jl11811`
    FOREIGN KEY (`Car_jl1181_Car_ID`)
    REFERENCES `mydb`.`Car_jl1181` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TIME-table-jl11181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TIME-table-jl11181` (
  `review_time_id` INT NOT NULL,
  `reivew_time` DATE NULL,
  PRIMARY KEY (`review_time_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`review_table_jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`review_table_jl1181` (
  `review_id` INT NOT NULL,
  `review_costumer` VARCHAR(45) NULL,
  `review` VARCHAR(45) NULL,
  PRIMARY KEY (`review_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`REVIEW_FACT_TABLE_jl1181`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`REVIEW_FACT_TABLE_jl1181` (
  `COSTUMER_TABLE-jl1181_COSTUMER_ID` INT NOT NULL,
  `TIME-table-jl11181_review_time_id` INT NOT NULL,
  `review_table_jl1181_review_id` INT NOT NULL,
  `Car_jl1181_Car_ID` INT NOT NULL,
  PRIMARY KEY (`COSTUMER_TABLE-jl1181_COSTUMER_ID`, `TIME-table-jl11181_review_time_id`, `review_table_jl1181_review_id`, `Car_jl1181_Car_ID`),
  INDEX `fk_review _FACT_TABLE_jl1181_COSTUMER_TABLE-jl11811_idx` (`COSTUMER_TABLE-jl1181_COSTUMER_ID` ASC) VISIBLE,
  INDEX `fk_review _FACT_TABLE_jl1181_TIME-table-jl111811_idx` (`TIME-table-jl11181_review_time_id` ASC) VISIBLE,
  INDEX `fk_review _FACT_TABLE_jl1181_review_table_jl11811_idx` (`review_table_jl1181_review_id` ASC) VISIBLE,
  INDEX `fk_review _FACT_TABLE_jl1181_Car_jl11811_idx` (`Car_jl1181_Car_ID` ASC) VISIBLE,
  CONSTRAINT `fk_review _FACT_TABLE_jl1181_COSTUMER_TABLE-jl11811`
    FOREIGN KEY (`COSTUMER_TABLE-jl1181_COSTUMER_ID`)
    REFERENCES `mydb`.`COSTUMER_TABLE-jl1181` (`COSTUMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review _FACT_TABLE_jl1181_TIME-table-jl111811`
    FOREIGN KEY (`TIME-table-jl11181_review_time_id`)
    REFERENCES `mydb`.`TIME-table-jl11181` (`review_time_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review _FACT_TABLE_jl1181_review_table_jl11811`
    FOREIGN KEY (`review_table_jl1181_review_id`)
    REFERENCES `mydb`.`review_table_jl1181` (`review_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review _FACT_TABLE_jl1181_Car_jl11811`
    FOREIGN KEY (`Car_jl1181_Car_ID`)
    REFERENCES `mydb`.`Car_jl1181` (`Car_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
