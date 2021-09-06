-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
-- Table `youtube`.`etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`etiquetas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `tamaño` INT NOT NULL,
  `nombre_archivo` VARCHAR(45) NOT NULL,
  `duracion_video` TIME NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `estado` ENUM('publico', 'privado', 'oculto') NOT NULL,
  `usuario_id` INT NOT NULL,
  `etiquetas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_video_etiquetas1_idx` (`etiquetas_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_etiquetas1`
    FOREIGN KEY (`etiquetas_id`)
    REFERENCES `youtube`.`etiquetas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `usuario_id` INT NOT NULL,
  `usuario_suscrito` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_canal_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_canal_usuario2_idx` (`usuario_suscrito` ASC) VISIBLE,
  CONSTRAINT `fk_canal_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canal_usuario2`
    FOREIGN KEY (`usuario_suscrito`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video_publicado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video_publicado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora` DATETIME NOT NULL,
  `numero_likes` INT NOT NULL,
  `numero_dislikes` INT NOT NULL,
  `numero_reproducciones` INT NOT NULL,
  `video_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_publicado_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_video_publicado_video1_idx` (`video_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_publicado_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_publicado_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `youtube`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `fecha_creacion` VARCHAR(45) NOT NULL,
  `estado` ENUM('publico', 'privado') NOT NULL,
  `usuario_id` INT NOT NULL,
  `video_publicado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_playlist_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_playlist_video_publicado1_idx` (`video_publicado_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_video_publicado1`
    FOREIGN KEY (`video_publicado_id`)
    REFERENCES `youtube`.`video_publicado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`agrada_desagrada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`agrada_desagrada` (
  `agrada_desagrada` ENUM('a', 'd') NOT NULL,
  `fecha_hora` DATE NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`agrada_desagrada`),
  INDEX `fk_agrada_desagrada_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_agrada_desagrada_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(45) NOT NULL,
  `fecha_hora` DATE NOT NULL,
  `usuario_id` INT NOT NULL,
  `video_publicado_id` INT NOT NULL,
  `agrada_desagrada_agrada_desagrada` ENUM('a', 'd') NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comentarios_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_comentarios_agrada_desagrada1_idx` (`agrada_desagrada_agrada_desagrada` ASC) VISIBLE,
  INDEX `fk_comentarios_video_publicado1_idx` (`video_publicado_id` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_agrada_desagrada1`
    FOREIGN KEY (`agrada_desagrada_agrada_desagrada`)
    REFERENCES `youtube`.`agrada_desagrada` (`agrada_desagrada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_video_publicado1`
    FOREIGN KEY (`video_publicado_id`)
    REFERENCES `youtube`.`video_publicado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `like` ENUM('l', 'd') NOT NULL,
  `fecha_hora` DATE NOT NULL,
  `usuario_id` INT NOT NULL,
  `video_publicado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_likes_usuario1_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_likes_video_publicado1_idx` (`video_publicado_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `youtube`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_video_publicado1`
    FOREIGN KEY (`video_publicado_id`)
    REFERENCES `youtube`.`video_publicado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use youtube;
show tables;

-- 1
insert into usuario values(1, 'luis@gmail.com', 'calve1', 'luis1', '1980-02-19', 'm', 'españa', 08020);
insert into usuario values(2, 'nuria@hotmail.com', 'calve2', 'nurs1', '2000-12-03', 'f', 'españa', 08020);
select * from usuario;

-- 2
insert into canal values(1, 'peliculas', 'nacional', '2020-09-30', 1, null);
insert into canal values(2, 'musica', 'ingles', '2021-12-13', 2, 1);
select * from canal; 

-- 3
insert into etiquetas values(1, 'musica');
insert into etiquetas values(2, 'ingles');
select * from etiquetas;

-- 4
insert into video values(1, 'despacito', 'cancion español', 50, 'cancion1', '0:5:30', 'img1', 'publico', 1, 1);
insert into video values(2, 'la bamba', 'cancion español', 40, 'cancion2', '0:4:30', 'img2', 'privado', 2, 2);
select * from video;

-- 5
insert into video_publicado values(1, '2021-01-10', 0 , 0, 0, 1, 1);
insert into video_publicado values(2, '2021-02-21', 5 , 0, 10, 2, 2);
select * from video_publicado;

-- 6
insert into likes values(1, 'l', '2021-02-19', 2, 1);
insert into likes values(2, 'd', '2021-02-19', 1, 2);
select * from likes;

-- 7
insert into playlist values(1, 'lista1', '2021-03-18', 'publico', 1, 1);
insert into playlist values(2, 'lista2', '2021-05-21', 'publico', 2, 2);
select * from playlist;

-- 8
insert into agrada_desagrada values('a', '2021-03--01', 1);
insert into agrada_desagrada values('d', '2021-11-10', 2);
select * from agrada_desagrada;

-- 9
insert into comentarios values(1, 'bueno', '2021-09-12', 1, 1, 1);
insert into comentarios values(2, 'malo', '2021-06-09', 2, 2, 2);
select * from comentarios;

select * from video v inner join video_publicado vp on v.id=vp.video_id;

