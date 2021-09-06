'use strict';
//Nivel1 - Ejercicio 1
/**
 * Imprimir per pantalla el resultat d'una arrow function autoinvocable que sumi dos nombres.
 */

let n1 = 23;
let n2 = 45;

((num1, num2) => {
    console.log(num1 + num2);
})(n1, n2);



//Nivel2 - Ejercicio 1
/**
 * Crear una arrow function que, rebent un paràmetre, retorni un objecte amb un atribut que tingui com a valor 
 * el paràmetre rebut.
 */
const objNombre = (nombre) => ({ nombre: nombre });
console.log(objNombre("Victor"));



//Nivel2 - Ejercicio 2
/**
 * Crear una classe Persona que rebi un paràmetre 'nom' a l'ésser creat. La classe inclourà un mètode 
 * decirNombre que imprimeixi per consola el paràmetre 'Nom'. Invocar el mètode decirNombre des de fora de la classe.
 */
class Persona {
  constructor(nombre) {
    this.nombre = nombre;
  }

  decirNombre() {
    console.log(this.nombre);
  }
}

const persona = new Persona("Maria");
persona.decirNombre();
console.log(persona);



//Nivel3 - Ejercicio 1
/**
 * Crear una function creadora d'objectes, abstraient la definició de les classes. Invocar-amb diferents definicions.
 */

function creaObjeto(nombre, tipo, modelo){
  this.nombre = nombre;
  this.tipo = tipo;
  this.modelo = modelo;
}

let obj1 = new creaObjeto('tasa', 'cosa', 'unico');
let obj2 = new creaObjeto('coche', 'turismo', 'gasolina');
let obj3 = new creaObjeto('plato', 'redondo', 'grande');

console.log(obj1);
console.log(obj2);
console.log(obj3);


