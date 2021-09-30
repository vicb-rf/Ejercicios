/**
 * Nivell 2
- Exercici 1 - Decorator
*/
class Producto{
    constructor(nombre, precio, moneda){
        this.nombre = nombre;
        this.precio = precio;
        this.moneda = moneda;    
    }

    describe(){
        return `Producto: ${this.nombre}, Precio: ${this.precio}, Moneda: ${this.moneda}`;
    }
}

module.exports = Producto