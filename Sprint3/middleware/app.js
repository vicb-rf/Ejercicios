/**
 * Nivell 1
- Exercici 1 - Middleware

    Creu en un fitxer inicial una petita aplicació que sumi, resti i multipliqui
    rebent els paràmetres en un JSON.
    Creu, en un fitxer extern, una classe que emmagatzemi middlewares (funcions).
    Invoqui les execucions de la suma, la resta i la multiplicació de manera natural.
    Inserida la invocació a middlewares que variïn el resultat natural oferint com a resultat final el quadrat,
    el cub i la divisió entre 2 del resultat inicial en cadascuna de les operacions.
 */
'use strict'

const Middleware = require('./Middleware');
const numeros = require('./num.json');
console.log(numeros);

class Maths{
    add({a, b}){
        console.log('a,b', a, b)
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


