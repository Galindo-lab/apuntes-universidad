-- MySQL Script generated by MySQL Workbench
-- jue 09 nov 2023 18:08:15
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Correo_Electronico` VARCHAR(45) NOT NULL,
  `Codigo_Licencia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Licencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Licencia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Licencia` (
  `Codigo_Licencia` VARCHAR(100) NOT NULL,
  `Software_Asociado` VARCHAR(45) NULL,
  `Fecha_Vencimiento` VARCHAR(45) NULL,
  `idUsuario` INT NULL,
  PRIMARY KEY (`Codigo_Licencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_has_Licencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Usuario_has_Licencia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_has_Licencia` (
  `Usuario_idUsuario` INT NOT NULL,
  `Licencia_Codigo_Licencia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Usuario_idUsuario`, `Licencia_Codigo_Licencia`),
  CONSTRAINT `fk_Usuario_has_Licencia_Usuario`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Licencia_Licencia1`
    FOREIGN KEY (`Licencia_Codigo_Licencia`)
    REFERENCES `mydb`.`Licencia` (`Codigo_Licencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Usuario_has_Licencia_Licencia1_idx` ON `mydb`.`Usuario_has_Licencia` (`Licencia_Codigo_Licencia` ASC) VISIBLE;

CREATE INDEX `fk_Usuario_has_Licencia_Usuario_idx` ON `mydb`.`Usuario_has_Licencia` (`Usuario_idUsuario` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;