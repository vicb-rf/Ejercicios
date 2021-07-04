'use strict';

/**
 * Nivell 2
- Exercici 1
Creu una funció asíncrona que anomeni a una altra que retorni una Promise que efectuï la seva resolve
amb una demora de 2 segons.
 */


const retornaPomesa = (parametro) => {
    return new Promise((resolve, reject) => {
        if(!parametro){
            reject("Error");
        }else {
            setTimeout(() => {
            resolve('Se resolvio despues de 2 seg');
            }, 2000);
        }        
    });
} 

async function ejercicio2(){
    const respuesta = await retornaPomesa(2);
    console.log("Ejercicio 2 ", respuesta);
}

ejercicio2();


/**
 * Nivell 3
- Exercici 1
Capturi tots els errors possibles del Nivell 2.
 */


async function ejercicio3(){
    try{
        console.log('Ejercicio 3 Inicio');
        const respuesta = await retornaPomesa();
        console.log(respuesta);
        console.log('Ejercicio 3 Fin ..');
    }catch(error){
        console.error("error");
    }
    
}

ejercicio3();
