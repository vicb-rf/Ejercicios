-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('m', 'f') NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  `tipo_usuario` ENUM('f', 'p') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`tarjeta_credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`tarjeta_credito` (
  `id` INT NOT NULL,
  `numero` INT NOT NULL,
  `mes` INT NOT NULL,
  `year` INT NOT NULL,
  `codigo_seguridad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`suscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`suscripciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NOT NULL,
  `fecha_renovacion` DATE NOT NULL,
  `paypal_id` INT NULL,
  `tarjeta_credito_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_suscripciones_paypal1_idx` (`paypal_id` ASC) VISIBLE,
  INDEX `fk_suscripciones_tarjeta_credito1_idx` (`tarjeta_credito_id` ASC) VISIBLE,
  CONSTRAINT `fk_suscripciones_paypal1`
    FOREIGN KEY (`paypal_id`)
    REFERENCES `spotify`.`paypal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscripciones_tarjeta_credito1`
    FOREIGN KEY (`tarjeta_credito_id`)
    REFERENCES `spotify`.`tarjeta_credito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_canciones` INT NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `usuario_ premiun_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_usuario_ premiun1_idx` (`usuario_ premiun_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario_ premiun1`
    FOREIGN KEY (`usuario_ premiun_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`pago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_ premiun_id` INT NOT NULL,
  `suscripciones_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pago_usuario_ premiun1_idx` (`usuario_ premiun_id` ASC) VISIBLE,
  INDEX `fk_pago_suscripciones1_idx` (`suscripciones_id` ASC) VISIBLE,
  CONSTRAINT `fk_pago_usuario_ premiun1`
    FOREIGN KEY (`usuario_ premiun_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pago_suscripciones1`
    FOREIGN KEY (`suscripciones_id`)
    REFERENCES `spotify`.`suscripciones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_eliminadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_eliminadas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_borrado` DATE NOT NULL,
  `playlist_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_eliminadas_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_eliminadas_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `usuario_ seguidor` INT NOT NULL,
  `artista_relacionada` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artista_usuario_ premiun1_idx` (`usuario_ seguidor` ASC) VISIBLE,
  INDEX `fk_artista_artista1_idx` (`artista_relacionada` ASC) VISIBLE,
  CONSTRAINT `fk_artista_usuario_ premiun1`
    FOREIGN KEY (`usuario_ seguidor`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artista_artista1`
    FOREIGN KEY (`artista_relacionada`)
    REFERENCES `spotify`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`albun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`albun` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `publication_year` YEAR NOT NULL,
  `imagen_portada` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albun_artista1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_albun_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `spotify`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`cancion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`cancion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `duracion` TIME NOT NULL,
  `albun_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cancion_albun1_idx` (`albun_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_albun1`
    FOREIGN KEY (`albun_id`)
    REFERENCES `spotify`.`albun` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist_compartida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist_compartida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_compartida` DATE NOT NULL,
  `playlist_id` INT NOT NULL,
  `usuario_ agrega_cancion` INT NULL,
  `cancion_agregada` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_compartida_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_compartida_usuario_ premiun1_idx` (`usuario_ agrega_cancion` ASC) VISIBLE,
  INDEX `fk_playlist_compartida_cancion1_idx` (`cancion_agregada` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_compartida_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_compartida_usuario_ premiun1`
    FOREIGN KEY (`usuario_ agrega_cancion`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_compartida_cancion1`
    FOREIGN KEY (`cancion_agregada`)
    REFERENCES `spotify`.`cancion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`numero_reproducciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`numero_reproducciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero_reproducciones` INT NOT NULL,
  `usuario_ premiun_id` INT NOT NULL,
  `cancion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_numero_reproducciones_usuario_ premiun1_idx` (`usuario_ premiun_id` ASC) VISIBLE,
  INDEX `fk_numero_reproducciones_cancion1_idx` (`cancion_id` ASC) VISIBLE,
  CONSTRAINT `fk_numero_reproducciones_usuario_ premiun1`
    FOREIGN KEY (`usuario_ premiun_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_numero_reproducciones_cancion1`
    FOREIGN KEY (`cancion_id`)
    REFERENCES `spotify`.`cancion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`favoritos_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`favoritos_usuario` (
  `usuario_id` INT NOT NULL,
  `cancion_id` INT NOT NULL,
  `albun_id` INT NOT NULL,
  INDEX `fk_favoritos_usuario_cancion1_idx` (`cancion_id` ASC) VISIBLE,
  INDEX `fk_favoritos_usuario_albun1_idx` (`albun_id` ASC) VISIBLE,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_favoritos_usuario_cancion1`
    FOREIGN KEY (`cancion_id`)
    REFERENCES `spotify`.`cancion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favoritos_usuario_albun1`
    FOREIGN KEY (`albun_id`)
    REFERENCES `spotify`.`albun` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favoritos_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use spotify;
show tables;

-- 1
insert into tarjeta_credito values(1, 12345678, 01, 2022, 123);
insert into tarjeta_credito values(2, 23456781, 12, 2024, 456);
select * from tarjeta_credito;

-- 2
insert into paypal values(1, 'juan1');
insert into paypal values(2, 'mano');
select * from paypal;

-- 3
insert into suscripciones values(1, '2020-10-21', '2021-10-21', null, 1);
insert into suscripciones values(2, '2021-01-13', '2022-01-13', 2, null);
select * from suscripciones;

-- 4
insert into usuario values(1, 'juam@gmail.com', 'clave', 'juan1s', '1977-04-12', 'm', 'españa', 0820, 'p');
insert into usuario values(2, 'manuela@hotmail.com', 'clave1', 'mano1', '1999-10-22', 'f', 'españa', 01012, 'p');
select * from usuario;

-- 5
insert into pago values(1, 1, 1);
insert into pago values(2, 2, 2);
select * from pago;

-- 6
insert into playlist values(1, 'variadas', 4, '2020-12-12', 1);
insert into playlist values(2, 'actuales', 4, '2021-02-21', 2);
select * from playlist;

-- 7
insert into playlist_eliminadas values(1, '2021-05-01', 1);
select * from playlist_eliminadas;

-- 8
insert into artista values(1, 'julio', 'img1', 1, null);
insert into artista values(2, 'mana', 'img2', 2, 1);
select * from artista;

-- 9
insert into albun values(1, 'tres', '2000', 'imagen1', 1);
insert into albun values(2, 'libre', '2010', 'imagen2', 2);
select * from albun;

-- 10
insert into cancion values(1, 'cancion1', '0:4:01', 1);
insert into cancion values(2, 'cancion2', '0:5:23', 2);
select * from cancion;

-- 11
insert into playlist_compartida values(1, '2020-12-31', 2, 2, 1);
insert into playlist_compartida values(2, '2021-2-17', 1,  null, null);
select * from playlist_compartida;

-- 12
insert into numero_reproducciones values(1, 4, 1, 1);
insert into numero_reproducciones values(2, 7, 2, 2);
select * from numero_reproducciones;

-- 13
insert into favoritos_usuario values(1, 1, 1);
insert into favoritos_usuario values(2, 2, 2);
select * from favoritos_usuario;
