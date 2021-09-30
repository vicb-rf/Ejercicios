/**
 * Nivell 2
- Exercici 1 - Decorator
*/

const fs = require('fs');

function decoradorProducto(producto){    
    var currency = fs.readFileSync('./currency_conversions.json');   

    let m = producto.moneda;
    let d = producto.describe();
    let converter = JSON.parse(currency);
    let conversor = converter[`${m}_EUR`]
    let precioEuros =  Math.round((producto.precio * conversor) * 100) / 100 ;
    producto.describe = function(){
        return d + ` - Precio en euros: ${precioEuros}`
    }

}

module.exports = decoradorProducto
