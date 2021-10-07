-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `pizzeria`;
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`categoriaPizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoriaPizzas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `pizzeria`.`provincia` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3
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
    REFERENCES `pizzeria`.`localidad` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `pizzeria`.`localidad` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `pizzeria`.`tienda` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedidoAtendido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedidoAtendido` (
  `id` INT NOT NULL,
  `fechaHora` DATETIME NOT NULL,
  `empleado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_repartoPedido_empleado1_idx` (`empleado_id` ASC) VISIBLE,
  CONSTRAINT `fk_repartoPedido_empleado1`
    FOREIGN KEY (`empleado_id`)
    REFERENCES `pizzeria`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `delivery` ENUM('si', 'no') NOT NULL,
  `precio_total` DECIMAL(5,3) NOT NULL,
  `cliente_id` INT NOT NULL,
  `tienda_id` INT NOT NULL,
  `pedidoAtendido_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedido_cliente1_idx` (`cliente_id` ASC) VISIBLE,
  INDEX `fk_pedido_tienda1_idx` (`tienda_id` ASC) VISIBLE,
  INDEX `fk_pedido_repartoPedido1_idx` (`pedidoAtendido_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `pizzeria`.`cliente` (`id`),
  CONSTRAINT `fk_pedido_tienda1`
    FOREIGN KEY (`tienda_id`)
    REFERENCES `pizzeria`.`tienda` (`id`),
  CONSTRAINT `fk_pedido_repartoPedido1`
    FOREIGN KEY (`pedidoAtendido_id`)
    REFERENCES `pizzeria`.`pedidoAtendido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


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
    REFERENCES `pizzeria`.`categoriaPizzas` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedidoDetalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedidoDetalle` (
  `id` INT NOT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `pedido_id` INT NOT NULL,
  `producto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedidoDetalle_pedido_idx` (`pedido_id` ASC) VISIBLE,
  INDEX `fk_pedidoDetalle_producto1_idx` (`producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_pedidoDetalle_pedido`
    FOREIGN KEY (`pedido_id`)
    REFERENCES `pizzeria`.`pedido` (`id`),
  CONSTRAINT `fk_pedidoDetalle_producto1`
    FOREIGN KEY (`producto_id`)
    REFERENCES `pizzeria`.`producto` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


use pizzeria;

insert into provincia values(1, 'barcelona');
insert into provincia values(2, 'madrid');
insert into provincia values(3, 'valencia');

insert into localidad values(1, 'badalona', 1);
insert into localidad values(2, 'leganes', 2); 
insert into localidad values(3, 'vallada', 3);

insert into tienda values(1, 'calle pelayo', 08015, 1);
insert into tienda values(2, 'av primera', 01099, 2);
insert into tienda values(3, 'calle menor', 04078, 3);

insert into categoriaPizzas values(1, 'italiana');
insert into categoriaPizzas values(2, 'americana');
insert into categoriaPizzas values(3, 'vegetal');

insert into producto values(1, 'pizza', 'hawaiana', 'imagen1', 10, 1);
insert into producto values(2, 'hamburguesa', 'clasica', 'imagen2', 8, null);
insert into producto values(3, 'bebida', 'cocacola', 'imagen3', 2, null);

insert into cliente values(1, 'juan', 'izquierdo', 'gran via', 08020, 612345678, 1);
insert into cliente values(2, 'maria', 'castro', 'av del prado', 01021, 623456781, 2);
insert into cliente values(3, 'luis', 'palacios', 'av aribau', 08015, 634567812, 1);
insert into cliente values(4, 'carlos', 'fernandez', 'calle mayor', 05032, 678123456, 3);

insert into empleado values(1, 'pedro', 'castillo', '12345678N', 612345678, 'cocinero', 1);
insert into empleado values(2, 'julio', 'mancilla', '23456781P', 623456781, 'cocinero', 2);
insert into empleado values(3, 'lili', 'lujan', '34567812A', 634567812, 'cocinero', 3);
insert into empleado values(4, 'martin', 'ponce', '45678123N', 656781234, 'repartidor', 1);
insert into empleado values(5, 'talia', 'mora', '56781234P', 667812345, 'repartidor', 2);
insert into empleado values(6, 'angel', 'sanches', '67812345A', 678123456, 'repartidor', 3);

insert into pedidoAtendido values(1, '2021-01-01 16:04:00', 2);
insert into pedidoAtendido values(2, '2021-04-28 17:44:12', 1);
insert into pedidoAtendido values(3, '2021-08-12 18:20:09', 6);
insert into pedidoAtendido values(4, '2021-06-21 20:00:00', 1);

insert into pedido values(1, '2021-01-01', 'si', 18, 1, 3, 4);
insert into pedido values(2, '2021-04-28', 'no', 22, 2, 2, 1);
insert into pedido values(3, '2021-08-12', 'si', 34, 3, 1, 2);
insert into pedido values(4, '2021-05-30', 'no', 31, 4, 3, 3);

insert into pedidoDetalle values(1, 2, 4, 1);
insert into pedidoDetalle values(2, 3, 3, 2);
insert into pedidoDetalle values(3, 4, 2, 3);
insert into pedidoDetalle values(4, 1, 1, 3);

#   Llista quants productes de categoria 'Begudas' s'han venut en una determinada localitat
select p.tipo, pd.cantidad, l.nombre from pedidoDetalle pd inner join producto p on pd.producto_id=p.id inner join pedido pe on pd.pedido_id=pe.id inner join tienda t on pe.tienda_id=t.id inner join localidad l on t.localidad_id=l.id where l.nombre='leganes';


#   Llista quantes comandes ha efectuat un determinat emplea
# select e.nombre, count(e.nombre) as 'pedidos atentidos' from pedido p inner join repartoPedido r on r.empleado_id=e.id where e.nombre='pedro';

select e.nombre, count(e.nombre) as 'pedidos atentidos' from pedido p inner join pedidoAtendido pa on p.pedidoAtendido_id=pa.id inner join empleado e on pa.empleado_id=e.id where e.nombre='pedro';

