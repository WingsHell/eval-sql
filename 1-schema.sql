-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestion_etudiant
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestion_etudiant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestion_etudiant` DEFAULT CHARACTER SET utf8 ;
USE `gestion_etudiant` ;

-- -----------------------------------------------------
-- Table `gestion_etudiant`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_etudiant`.`student` ;

CREATE TABLE IF NOT EXISTS `gestion_etudiant`.`student` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_etudiant`.`year`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_etudiant`.`year` ;

CREATE TABLE IF NOT EXISTS `gestion_etudiant`.`year` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_etudiant`.`module`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_etudiant`.`module` ;

CREATE TABLE IF NOT EXISTS `gestion_etudiant`.`module` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `year` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_module_year1_idx` (`year` ASC) ,
  CONSTRAINT `fk_module_year1`
    FOREIGN KEY (`year`)
    REFERENCES `gestion_etudiant`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_etudiant`.`assessment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_etudiant`.`assessment` ;

CREATE TABLE IF NOT EXISTS `gestion_etudiant`.`assessment` (
  `id_student` INT UNSIGNED NOT NULL,
  `id_module` INT UNSIGNED NOT NULL,
  `attempted` DATETIME NOT NULL,
  `passed` DATETIME NULL,
  `grade` INT NULL,
  PRIMARY KEY (`id_student`, `id_module`, `attempted`),
  INDEX `fk_assessment_student1_idx` (`id_student` ASC) ,
  INDEX `fk_assessment_module1_idx` (`id_module` ASC) ,
  CONSTRAINT `fk_assessment_student1`
    FOREIGN KEY (`id_student`)
    REFERENCES `gestion_etudiant`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assessment_module1`
    FOREIGN KEY (`id_module`)
    REFERENCES `gestion_etudiant`.`module` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_etudiant`.`enrolment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_etudiant`.`enrolment` ;

CREATE TABLE IF NOT EXISTS `gestion_etudiant`.`enrolment` (
  `id_student` INT UNSIGNED NOT NULL,
  `id_year` INT UNSIGNED NOT NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NULL,
  PRIMARY KEY (`id_student`, `id_year`),
  INDEX `fk_student_has_year_year1_idx` (`id_year` ASC),
  INDEX `fk_student_has_year_student_idx` (`id_student` ASC),
  CONSTRAINT `fk_student_has_year_student`
    FOREIGN KEY (`id_student`)
    REFERENCES `gestion_etudiant`.`student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_year_year1`
    FOREIGN KEY (`id_year`)
    REFERENCES `gestion_etudiant`.`year` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;