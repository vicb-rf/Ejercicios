/**
 * Exercici 1
Creu una funció que comprimeixi el file del nivell 1
*/

let zlib = require('zlib');
let fs = require('fs');

let gzip = zlib.createGzip();

let read = fs.createReadStream('../nivel1/archivo.txt');
let write = fs.createWriteStream('archivo.txt.gz');

read.pipe(gzip).pipe(write);
console.log('Archivo comprimido');


//Creu una funció que llisti per consola el contingut del directori d'usuari. Utilitzi node Child Processes.
//Muestro el contenido de la carpeta actual(uso windows).
const { exec } = require('child_process');

exec('dir c:\\Users', (err, stdout) => {
    if(err) throw err;
    console.log('Muesta el contenido del directorio actual');
    console.log(stdout);
});

