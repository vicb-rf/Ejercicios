-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localidad` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `provincia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_localidad_provincia_idx` (`provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincia`
    FOREIGN KEY (`provincia_id`)
    REFERENCES `pizzeria`.`provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '								';


-- -----------------------------------------------------
-- Table `pizzeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `cp` INT NOT NULL,
  `telefono` INT NOT NULL,
  `localidad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `pizzeria`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tienda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `cp` VARCHAR(45) NOT NULL,
  `localidad_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tienda_localidad1_idx` (`localidad_id` ASC) VISIBLE,
  CONSTRAINT `fk_tienda_localidad1`
    FOREIGN KEY (`localidad_id`)
    REFERENCES `pizzeria`.`localidad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `puesto` ENUM('cocinero', 'repartidor') NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_empleado_tienda1_idx` (`tienda_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `pizzeria`.`tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`categoria_pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizzas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` ENUM('pizza', 'hamburguesa', 'bebida') NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` DECIMAL(5,3) NOT NULL,
  `categoria_pizzas_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pizzas_categoria_pizzas1_idx` (`categoria_pizzas_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzas_categoria_pizzas1`
    FOREIGN KEY (`categoria_pizzas_id`)
    REFERENCES `pizzeria`.`categoria_pizzas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `delivery` TINYINT NOT NULL,
  `producto_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_total` DECIMAL(5,3) NOT NULL,
  `empleado_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `tienda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_pedido_tienda1_idx` (`tienda_id` ASC) VISIBLE,
  INDEX `fk_pedido_producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `pizzeria`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `pizzeria`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `pizzeria`.`tienda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `pizzeria`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use pizzeria;
show tables;

describe provincia;
insert into provincia values(1, 'barcelona');
insert into provincia values(2, 'madrid');
insert into provincia values(3, 'valencia');
select * from provincia;

describe localidad;
insert into localidad values(1, 'badalona', 1);
insert into localidad values(2, 'leganes', 2); 
insert into localidad values(3, 'vallada', 3);
select * from localidad;

describe tienda;
insert into tienda values(1, 'calle pelayo', 08015, 1);
insert into tienda values(2, 'av primera', 01099, 2);
insert into tienda values(3, 'calle menor', 04078, 3);
select * from tienda;

describe categoria_pizzas;
insert into categoria_pizzas values(1, 'italiana');
insert into categoria_pizzas values(2, 'americana');
insert into categoria_pizzas values(3, 'vegetal');
select * from categoria_pizzas;

describe producto;
insert into producto values(1, 'pizza', 'hawaiana', 'imagen1', 10, 1);
insert into producto values(2, 'hamburguesa', 'clasica', 'imagen2', 8, null);
insert into producto values(3, 'bebida', 'cocacola', 'imagen3', 2, null);
select * from producto;


describe cliente;
insert into cliente values(1, 'juan', 'izquierdo', 'gran via', 08020, 612345678, 1);
insert into cliente values(2, 'maria', 'castro', 'av del prado', 01021, 623456781, 2);
insert into cliente values(3, 'luis', 'palacios', 'av aribau', 08015, 634567812, 1);
insert into cliente values(4, 'carlos', 'fernandez', 'calle mayor', 05032, 678123456, 3);
select * from cliente;

describe empleado;
insert into empleado values(1, 'pedro', 'castillo', '12345678N', 612345678, 'cocinero', 1);
insert into empleado values(2, 'julio', 'mancilla', '23456781P', 623456781, 'cocinero', 2);
insert into empleado values(3, 'lili', 'lujan', '34567812A', 634567812, 'cocinero', 3);
insert into empleado values(4, 'martin', 'ponce', '45678123N', 656781234, 'repartidor', 1);
insert into empleado values(5, 'talia', 'mora', '56781234P', 667812345, 'repartidor', 2);
insert into empleado values(6, 'angel', 'sanches', '67812345A', 678123456, 'repartidor', 3);
select * from empleado;

describe pedido;
insert into pedido values(1, '2021-01-01', 1, 1, 1, 10, 1, 1, 1);
insert into pedido values(2, '2021-04-28', 0, 2, 1, 8, 2, 2, 2);
insert into pedido values(3, '2021-08-12', 1, 3, 1, 2, 1, 3, 1);
insert into pedido values(4, '2021-05-30', 0, 3, 2, 4, 4, 1, 3);
select * from pedido;


select * from pedido p inner join producto pr on p.producto_id=pr.id inner join localidad l on p.tienda_id=l.id;


-- Pizzeria:

#   Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat
select pr.tipo, l.nombre, count(p.cantidad) as totalProductosVendidos from pedido p inner join producto pr on p.producto_id=pr.id inner join tienda t on p.tienda_id=t.id inner join localidad l on t.localidad_id=l.id where pr.tipo='bebida' and l.nombre='badalona';


#   Llista quantes comandes ha efectuat un determinat emplea
select e.nombre, count(e.nombre) as 'pedidos atendidos' from pedido p inner join empleado e on p.empleado_id=e.id where e.nombre='pedro';

