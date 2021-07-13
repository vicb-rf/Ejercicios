/**
 * - Exercici 2
Creu una funció que, en executar-la, escrigui el seu nom en un fitxer.
*/
var fs = require('fs');

let archivo = 'archivo.txt';
fs.writeFile(`./${archivo}`, `${archivo} creado en el ejercicio1 - nivel 1`, function(err){
    if(err){
        console.log(err);
    }
    console.log('Archivo creado');
});






