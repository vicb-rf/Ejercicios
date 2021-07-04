'use strict'
//Nivel 1 - Ejercicio 1
//Crear una function que retorni una Promise que invoqui la funcion resolve() o bé reject() que rep.
// Invocar-la des de fora pasandole totes dues funcions que imprimeixin un missatge diferent en cada cas.

function retornaPromesa(parametro){

    return new Promise((resolve, reject) => {
    
        if(parametro){
            resolve(`Promesa resulta el parametro es: ${parametro}`);         
            
        }else {
            reject("Promesa rechazada, no hay parametro");    
    
        }
    }); 
} 


retornaPromesa(1)
.then((res) => {
    console.log(res);    
})
.catch((rej) => {
    console.error(rej);
})


//Nivel 1 - Ejercicio 2
//Crear una arrow function que, rebent un paràmetre i una function callback, li passi a la funció 
//un missatge o un altre (que s'imprimirà per consola) en funció del paràmetre.

const ejeCallback = (parametro, callback) => {
    if(parametro == 1){
        callback("Si parametro es 1, imprime Primer mensaje");
        return;
    }else{
        callback("Si parametro no es 1, imprime Segundo Mensaje");
    }   
}

ejeCallback(2, (mensaje) => {
    console.log(mensaje);
})


