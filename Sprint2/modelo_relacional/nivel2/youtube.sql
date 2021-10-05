-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `youtube`;
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuario` (
  `id` INT NOT NULL,
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
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `tamaño` INT NOT NULL,
  `nombre_archivo` VARCHAR(45) NOT NULL,
  `duracion_video` TIME NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `reproducciones` INT NOT NULL,
  `estado` ENUM('publico', 'privado', 'oculto') NOT NULL,
  `numero_likes` INT NOT NULL,
  `numero_dislikes` INT NOT NULL,
  `fechaCreacon` DATETIME NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_usuario_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`etiquetas` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_etiquetas_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_etiquetas_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `usuario_id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_canal_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_canal_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `fechaCreacion` VARCHAR(45) NOT NULL,
  `estado` ENUM('publico', 'privado') NOT NULL,
  `usuario_id` INT NOT NULL,
  `publicacion_video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentarios` (
  `id` INT NOT NULL,
  `texto` VARCHAR(45) NOT NULL,
  `fecha_hora` DATE NOT NULL,
  `usuario_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comentarios_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_comentarios_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentarios_agrada_desagrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentariosAgrada` (
  `usuario_id` INT NOT NULL,
  `comentarios_id` INT NOT NULL,
  `fechaHora` DATE NOT NULL,
  PRIMARY KEY (`usuario_id`, `comentarios_id`),
  INDEX `fk_usuario_has_comentarios_comentarios1_idx` (`comentarios_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_comentarios_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_comentarios_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_comentarios_comentarios1`
    FOREIGN KEY (`comentarios_id`)
    REFERENCES `youtube`.`comentarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`suscribe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`suscribe` (
  `usuario_id` INT NOT NULL,
  `canal_usuario_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `canal_usuario_id`),
  INDEX `fk_usuario_has_canal_canal1_idx` (`canal_usuario_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_canal_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_canal_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_canal_canal1`
    FOREIGN KEY (`canal_usuario_id`)
    REFERENCES `youtube`.`canal` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`like`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`like` (
  `usuario_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  `likeDislike` TINYINT NULL,
  `fechaHora` DATE NULL,
  PRIMARY KEY (`usuario_id`, `video_id`),
  INDEX `fk_usuario_has_video_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_usuario_has_video_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_has_video_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlistVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlistVideo` (
  `playlist_id` INT NOT NULL,
  `video_id` INT NOT NULL,
  PRIMARY KEY (`playlist_id`, `video_id`),
  INDEX `fk_playlist_has_video_video1_idx` (`video_id` ASC) VISIBLE,
  INDEX `fk_playlist_has_video_playlist1_idx` (`playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_video_playlist1`
    FOREIGN KEY (`playlist_id`)
    REFERENCES `youtube`.`playlist` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_video_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
