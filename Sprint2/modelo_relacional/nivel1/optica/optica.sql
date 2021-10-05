-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `optica`;
CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;
USE `Optica` ;

-- -----------------------------------------------------
-- Table `Optica`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`Proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(10) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigoPostal` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `codigoPostal` INT NOT NULL,
  `telefono` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fechaRegistro` DATE NOT NULL,
  `Clientes_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Clientes_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Clientes_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `Optica`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`Empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`Gafas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `graduacionDer` DECIMAL(5,2) NOT NULL,
  `graduacionIzq` DECIMAL(5,2) NOT NULL,
  `tipoMontura` VARCHAR(45) NOT NULL,
  `colorMontura` VARCHAR(45) NOT NULL,
  `colorVidrio` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(8,3) NOT NULL,
  `fechaVenta` DATE NOT NULL,
  `Proveedores_id` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  `Empleados_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Gafas_Proveedores1_idx` (`Proveedores_id` ASC) VISIBLE,
  INDEX `fk_Gafas_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  INDEX `fk_Gafas_Empleados1_idx` (`Empleados_id` ASC) VISIBLE,
  CONSTRAINT `fk_Gafas_Proveedores1`
    FOREIGN KEY (`Proveedores_id`)
    REFERENCES `Optica`.`Proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gafas_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `Optica`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gafas_Empleados1`
    FOREIGN KEY (`Empleados_id`)
    REFERENCES `Optica`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use optica;
show tables;

describe proveedores;
insert into proveedores values(1, 'opticalia', 612345678, 912345678, '12345678N', 'gran via', 'barcelona', 08020, 'españa');
insert into proveedores values(2, 'sunglass', 623456781, 923456781, '23456781X', 'av prado', 'madrid', 01002, 'españa');
insert into proveedores values(3, 'lentes', 634567812, 934567812, '34567812D', 'calle mayor', 'valencia', 04004, 'españa');
insert into proveedores values(4, 'universal', 645678123, 945678123, '45678123A', 'av aribau', 'barcelona', 08015, 'españa');
select * from proveedores;

describe clientes;
insert into clientes values( 1,'Juan', 08019, '698765432', 'juan@gmail.com', '2019-08-01', null);
insert into clientes values( 2,'Alberto', 01009, '687654329', 'alberto@hotmail.com', '2019-08-02', 1);
insert into clientes values( 3,'Ainoha', 08040, '676543298', 'ainoha@icloud.com', '2019-08-03', null);
insert into clientes values( 4, 'pedro', 04102, '676543297', 'pedro@hotmail.com', '2019-08-04', 3);
SELECT * FROM clientes;

describe empleados;
insert into empleados values(1, 'luis');
insert into empleados values(2, 'maria');
SELECT * FROM empleados;

describe gafas;
INSERT INTO gafas VALUES(1, 'rayban', 1, 0.75, 'flotante', 'negro', 'negro', 120, '2021-08-10', 1, 4, 2);
INSERT INTO gafas VALUES(2, 'rayban', 0.5, 0.75, 'pasta', 'plata', 'negro', 150, '2021-04-03', 2, 3, 1);
INSERT INTO gafas VALUES(3, 'polaorid', 1.25, 1.7, 'metalico', 'plata', 'dorado', 98, '2021-01-12', 3, 2, 2);
INSERT INTO gafas VALUES(4, 'ralph', 2, 2.2, 'flotante', 'negro', 'blanco', 110, '2020-11-23', 4, 1, 1);
SELECT * FROM gafas;

#    Llista el total de factures d'un client en un període determinat
select * from clientes c, gafas g where c.id=g.clientes_id and c.nombre='pedro' and year(g.fechaVenta)=2021;

#    Llista els diferents models d'ulleres que ha venut un empleat durant un any
select e.nombre, g.marca, g.fechaVenta from empleados e inner join gafas g on e.id=g.empleados_id where e.nombre='maria' and year(g.fechaVenta)=2021;

#    Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
select p.nombre as proveedor, g.marca from proveedores p inner join gafas g on p.id=g.proveedores_id;
