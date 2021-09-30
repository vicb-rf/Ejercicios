/**
 * Nivell 1
- Exercici 1 - Middleware
 */
'use strict'

const Middleware = require('./Middleware');
const numeros = require('./num.json');

class Maths{
    add({a, b}){
        return a + b;
    }

    substract({a, b}){
        return a - b;
    }

    multiply({a, b}){
        return a * b;
    }
}

const calculator = new Maths();
const app = new Middleware(calculator);


app.use((req, next) => {
    req.resp = req.resp ** 2;
    next();
})

app.use((req, next) => {
    req.resp = req.resp ** 3;
    next();
})

app.use((req, next) => {
    req.resp = req.resp / 2;
    next();
})

console.log(app.add(numeros));
console.log(app.substract(numeros));
console.log(app.multiply(numeros));


