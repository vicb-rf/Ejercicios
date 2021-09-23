'use strict';
//Nivel1 - Ejercicio 1
/**
 * Imprimir per pantalla el resultat d'una arrow function autoinvocable que sumi dos nombres.
 */

 let a = 10;
 let b = 19;
 
 var sumar =  (() => {
     return a + b;
   })();
 
   console.log(sumar);



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

//Clase abstracta
class Coche{
  constructor(){
      if(new.target === Coche){
          throw new Error('this is an abstract class');
      }
  }

  modeloCoche(){
      console.log(`Modelo: ${this.modelo}`)
  }

  colorCoche(){
      throw new Error("Metodo 'colorCoche()', debe ser implementado")
  }
}

const Toyota = function (modelo, color){
  this.modelo = modelo;
  this.color = color;

}

Toyota.prototype = Object.create(Coche.prototype);

Toyota.prototype.colorCoche = function(){
  console.log(`Color: ${this.color}`)
}

let t1 = new Toyota('auris', 'negro');
let t2 = new Toyota('corolla', 'blanco' )

t1.modeloCoche();
t1.colorCoche();
t2.modeloCoche();
t2.colorCoche();
