/**
 * Nivell 1
- Exercici 1 - Middleware
 */
'use strict'

const Middleware = require('./Middleware');
const numeros = require('./num.json');

class Maths{
    add({a, b}){
        console.log(`La suma de ${a} + ${b}`);
        return a + b;
    }

    substract({a, b}){
        console.log(`La resta de ${a} - ${b}`);
        return a - b;
    }

    multiply({a, b}){
        console.log(`La multiplicacion de ${a} * ${b}`);
        return a * b;
    }    
}

const calculator = new Maths();
const app = new Middleware(calculator);

app.use((req, next) => {
    req.resp = req.resp ** 2;
    console.log(`Se aplica el cuadrado `);
    next();
})

app.use((req, next) => {
    req.resp = req.resp ** 3;
    console.log(`Se aplica el cubo `);
    next();
})

app.use((req, next) => {
    req.resp = req.resp / 2;
    console.log(`Se divide / 2`);
    next();
})

console.log('El resultado: ', app.add(numeros));
console.log('El resultado: ', app.substract(numeros));
console.log('El resultado: ', app.multiply(numeros));


