/**
 * Nivell 2
- Exercici 1 - Decorator
*/

const fs = require('fs');
const converter = require('./currency_conversions.json');

function decoradorProducto(producto){    
    let m = producto.moneda;
    let d = producto.describe();
    let conversor = converter[`${m}_EUR`]
    let precioEuros =  Math.round((producto.precio * conversor) * 100) / 100 ;
    producto.describe = function(){
        return d + ` - Precio en euros: ${precioEuros}`
    }

}

module.exports = decoradorProducto
