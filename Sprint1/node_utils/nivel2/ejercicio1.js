/**
 * Exercici 1
Creu una funció que comprimeixi el file del nivell 1
*/

var AdmZip = require('adm-zip');    //usando el paquete adm-zip

var zip = new AdmZip();

zip.addLocalFile('../nivel1/archivo.txt');  
zip.writeZip('./archivo.zip');      
console.log("Archivo comprimido")


//Creu una funció que llisti per consola el contingut del directori d'usuari. Utilitzi node Child Processes.
//Muestro el contenido de la carpeta actual(uso windows).

exec('dir', (err, stdout) => {
    if(err) throw err;
    console.log('Muesta el contenido del directorio actual');
    console.log(stdout);
})

