-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `spotify`;
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`usuario` (
  `id` INT NOT NULL,
  `tipo_usuario` ENUM('free', 'premium') NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` ENUM('m', 'f') NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`tarjetaCredito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`tarjetaCredito` (
  `id` INT NOT NULL,
  `numero` INT NOT NULL,
  `fecha_vencimiento` DATE NOT NULL,
  `codigo_seguridad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`pago` (
  `id` INT NOT NULL,
  `fechaPago` DATE NOT NULL,
  `tarjetaCredito_id` INT NULL,
  `paypalUsuario` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pago_tarjetaCredito1_idx` (`tarjetaCredito_id` ASC) VISIBLE,
  CONSTRAINT `fk_pago_tarjetaCredito1`
    FOREIGN KEY (`tarjetaCredito_id`)
    REFERENCES `spotify`.`tarjetaCredito` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`suscripciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`suscripciones` (
  `id` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_renovacion` DATE NOT NULL,
  `pago_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_suscripciones_pago1_idx` (`pago_id` ASC) VISIBLE,
  INDEX `fk_suscripciones_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_suscripciones_pago1`
    FOREIGN KEY (`pago_id`)
    REFERENCES `spotify`.`pago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscripciones_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `numeroCanciones` INT NOT NULL,
  `playlistEstado` ENUM('activa', 'eliminada') NOT NULL,
  `fechaCreacion` DATE NOT NULL,
  `fechaBorrado` DATE NULL,
  `usuarioId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_usuario_ premiun1_idx` (`usuarioId` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario_ premiun1`
    FOREIGN KEY (`usuarioId`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`albun`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`albun` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `publication_year` DATE NOT NULL,
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
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `duracion` TIME NOT NULL,
  `numero_reproducciones` INT NULL,
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
-- Table `spotify`.`playlistCompartida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlistCompartida` (
  `id` INT NOT NULL,
  `fecha_compartida` DATE NOT NULL,
  `playlist_id` INT NOT NULL,
  `usuario_ comparte` INT NOT NULL,
  `cancion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_compartida_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  INDEX `fk_playlist_compartida_usuario_ premiun1_idx` (`usuario_ comparte` ASC) VISIBLE,
  INDEX `fk_playlist_compartida_cancion1_idx` (`cancion_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_compartida_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `spotify`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_compartida_usuario_ premiun1`
    FOREIGN KEY (`usuario_ comparte`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_compartida_cancion1`
    FOREIGN KEY (`cancion_id`)
    REFERENCES `spotify`.`cancion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artistaRelacionados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artistaRelacionados` (
  `artista_id` INT NOT NULL,
  `artista_id1` INT NOT NULL,
  PRIMARY KEY (`artista_id`, `artista_id1`),
  INDEX `fk_artista_has_artista_artista2_idx` (`artista_id1` ASC) VISIBLE,
  INDEX `fk_artista_has_artista_artista1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_artista_has_artista_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `spotify`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artista_has_artista_artista2`
    FOREIGN KEY (`artista_id1`)
    REFERENCES `spotify`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artistaFavorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artistaFavorito` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  INDEX `fk_usuario_has_artista_artista1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_artista_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_artista_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_artista_artista1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `spotify`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`cancionFavorita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`cancionFavorita` (
  `cancion_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`cancion_id`, `usuario_id`),
  INDEX `fk_cancion_has_usuario_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_cancion_has_usuario_cancion1_idx` (`cancion_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancion_has_usuario_cancion1`
    FOREIGN KEY (`cancion_id`)
    REFERENCES `spotify`.`cancion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cancion_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`albunFavorito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`albunFavorito` (
  `albun_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`albun_id`, `usuario_id`),
  INDEX `fk_albun_has_usuario_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_albun_has_usuario_albun1_idx` (`albun_id` ASC) VISIBLE,
  CONSTRAINT `fk_albun_has_usuario_albun1`
    FOREIGN KEY (`albun_id`)
    REFERENCES `spotify`.`albun` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_albun_has_usuario_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `spotify`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
