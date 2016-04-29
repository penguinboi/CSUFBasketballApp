SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Season` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Season` (
  `idSeason` INT NOT NULL AUTO_INCREMENT,
  `season_name` VARCHAR(45) NULL,
  `season_year` INT NULL,
  PRIMARY KEY (`idSeason`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Game` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Game` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `opponent` VARCHAR(45) NULL,
  `result` VARCHAR(45) NULL,
  `score` VARCHAR(45) NULL,
  `season_id` INT NOT NULL,
  PRIMARY KEY (`game_id`, `season_id`),
  INDEX `season_fk_idx` (`season_id` ASC),
  CONSTRAINT `season_fk`
    FOREIGN KEY (`season_id`)
    REFERENCES `mydb`.`Season` (`idSeason`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Player` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `player_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `jersey_number` VARCHAR(45) NULL,
  `class` VARCHAR(45) NULL,
  PRIMARY KEY (`player_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Game_Roster`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Game_Roster` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Game_Roster` (
  `gameID` INT NOT NULL,
  `playerID` INT NOT NULL,
  PRIMARY KEY (`gameID`, `playerID`),
  INDEX `player_fk_idx` (`playerID` ASC),
  CONSTRAINT `game_fk`
    FOREIGN KEY (`gameID`)
    REFERENCES `mydb`.`Game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `player_fk`
    FOREIGN KEY (`playerID`)
    REFERENCES `mydb`.`Player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Stats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Stats` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Stats` (
  `StatsID` INT NOT NULL AUTO_INCREMENT,
  `PlayerID` INT NOT NULL,
  `GameID` INT NOT NULL,
  `points` INT NULL,
  `rebounds` INT NULL,
  `assists` INT NULL,
  `steals` INT NULL,
  `blocks` VARCHAR(45) NULL,
  `SeasonID` INT NOT NULL,
  `Statscol` VARCHAR(45) NULL,
  PRIMARY KEY (`StatsID`, `PlayerID`, `GameID`, `SeasonID`),
  INDEX `player_fk_idx` (`PlayerID` ASC),
  CONSTRAINT `player_fk`
    FOREIGN KEY (`PlayerID`)
    REFERENCES `mydb`.`Player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `game_fk`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Game` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `season_fk`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Season` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Administrators` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Administrators` (
  `user_id` INT NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
