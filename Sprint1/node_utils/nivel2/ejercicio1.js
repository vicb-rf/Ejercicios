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
//Muestro el contenido de la carpeta actual, aplicando child processes para windows.
const {spawn} = require('child_process');

const bat = spawn('cmd.exe', ['./c', 'my.bat']);

bat.stdout.on('data', (data) => {
    console.log(data.toString());
})

bat.stderr.on('data', (data) => {
    console.error(data.toString());
});

bat.on('exit', (code) => {
    console.log(`Child exited with code ${code}`);
});

