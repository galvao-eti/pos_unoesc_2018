-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema pos_unoesc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pos_unoesc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pos_unoesc` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `pos_unoesc` ;

-- -----------------------------------------------------
-- Table `pos_unoesc`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_unoesc`.`usuario` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `senha` CHAR(95) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pos_unoesc`.`ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pos_unoesc`.`ocorrencia` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` INT UNSIGNED NOT NULL,
  `dt_ocorrencia` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ocorrencia_usuario_idx` (`usuario_id` ASC),
  CONSTRAINT `fk_ocorrencia_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `pos_unoesc`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
