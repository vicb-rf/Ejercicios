/**
 * Nivell 2
- Exercici 1 - Decorator
*/
'use strict'

const Producto = require('./Producto');
const decorador = require('./Decorador');


const p1 = new Producto('producto1', 120, 'CNY');
const p2 = new Producto('producto2', 232, 'USD');
const p3 = new Producto('producto3', 333, 'JPY');
const p4 = new Producto('producto4', 444, 'GBP');


console.log('Producto inicial: ', p1.describe());
decorador(p1);
console.log('Producto con decorador', p1.describe());
console.log('Producto inicial: ', p2.describe());
decorador(p2)
decorador(p3)
decorador(p4)
console.log('Producto con decorador', p2.describe());
console.log('Producto con decorador', p3.describe());
console.log('Producto con decorador', p4.describe());

