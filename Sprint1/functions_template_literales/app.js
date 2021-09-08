//N1-exercici1
//invocar la funcion desde consola
function nombreUsuario(nombre){    
    console.log('Nombre de usuario: ', nombre);
}

//N2-exercici1
/**
 * Imprimir el nom i cognoms de l'usuari en variables mitjançant template literals, 
 * creant les variables i referenciant en la impressió de l'missatge
 */
 let nombre = 'Victor';
 let apellido = ' Cabos';


console.log(`Nombre: ${nombre} Apellido: ${apellido}`);



//N2-exercici2
/**
 * Invocar la funció mitjançant template literals
 */ 
 function nombreApellido(strings, nombre, apellido) {
     
     return `${strings[0]}${nombre}${strings[1]}${apellido}`;
   }      
   
   console.log(nombreApellido`Nombre ${ nombre } Apellido ${ apellido }`);



//N3-exercici1
/**
 * Crea una matriu de deu funcions i empleni-la mitjançant un bucle. Cada funció comptarà del 0-9 imprimint-ho
 *  per pantalla. Invoqui cada funció de l'array iterativament.Haurà d'imprimir-se per pantalla el compte de 0-9
 *  deu vegades
 */

 var arrayfunciones = new Array(10);

 function llenarArray(){    
     for(let i = 0; i < 10; i++){
         arrayfunciones[i] = `funcion${i}`;
     }    
 }
 
 function imprimir(){
     llenarArray();
     console.log(arrayfunciones);
     for(i = 0; i < arrayfunciones.length; i++){        
         console.log(arrayfunciones[i]);
         for (j = 0; j < 10; j++){
             console.log(j);
         }         
     }
 }
 
 imprimir();


//N3-exercici2
/*
Crear una funció anònima autoinvocable (igualada a una variable) que imprimeixi 
per pantalla el nom d'usuari rebut com a paràmetre
*/
const nombreUser = (function(nombreUsuario){ 
    console.log(`El nombre de usuario es: ${nombreUsuario}`);
    return nombreUsuario;
})('Nombre de Usuario');




