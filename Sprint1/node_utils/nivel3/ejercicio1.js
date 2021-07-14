/*
 * Creu una funció que creï dos fitxers codificats en hexadecimal i en base64 respectivament, 
 * a partir del fitxer de l'exercici inicial.
 */
const fs = require('fs');
const crypto = require('crypto');

function codificarArchivo(archivo, codificacion) {

  const data = fs.readFileSync(archivo);
  fs.writeFileSync(`archivo${codificacion}`, data.toString(codificacion));
  let archivoNombre = `archivo${codificacion}`;
  console.log(`${archivoNombre} creado...`);
  return archivoNombre;
}


/**
 *  Creu una funció que guardi en disc els fitxers del punt anterior encriptats amb algorisme aes-192-cbc,
 *  i esborri els fitxers inicials.
 */
//funcion encripta

function encriptarArchivo(archivo) {

  let archvioEncriptado = `${archivo}.enc`;
  const algorithm = 'aes-192-cbc';
  const password = 'Password used to generate key';
  const key = crypto.scryptSync(password, 'salt', 24);
  const iv = Buffer.alloc(16, 0); // Initialization vector.

  const cipher = crypto.createCipheriv(algorithm, key, iv);

  const input = fs.createReadStream(archivo);
  const output = fs.createWriteStream(archvioEncriptado);

  input.pipe(cipher).pipe(output);
  input.on('end', function () { //input.on('end') sabremos cuando termino de grabar el archivo
    console.log(`${archivo} encriptado....`);
  });
}

function borrarArchivos(archivo) {
  fs.unlink(archivo, err => {
    if (err) throw err;
    console.log(`${archivo} eliminado...`);
  })
}

function ejercicio1() {

  console.log('Inicio...');
  let archivoCodificado = codificarArchivo('../nivel1/archivo.txt', 'hex');
  let archivoCodificado1 = codificarArchivo('../nivel1/archivo.txt', 'base64');
  encriptarArchivo(archivoCodificado);
  encriptarArchivo(archivoCodificado1);
  borrarArchivos(archivoCodificado);
  borrarArchivos(archivoCodificado1);

}


ejercicio1();


