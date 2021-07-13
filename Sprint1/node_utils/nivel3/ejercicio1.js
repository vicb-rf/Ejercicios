/*
 * Creu una funció que creï dos fitxers codificats en hexadecimal i en base64 respectivament, 
 * a partir del fitxer de l'exercici inicial.
 */

const fs = require('fs');
const stream = require('stream');
const crypto = require('crypto');

//funcion que codifica un archivo, tiene 2 parametros(el archivo base y el tipo de codificacion),
//resuelve una promesa con el nombre del archivo creado, para poder pasarlo como argumento a la siguiente funcion.

function codificarArchivo(archivo, codificacion) {

  return new Promise((resolve) => {
    const data = fs.readFileSync(archivo);
    fs.writeFile(`archivo${codificacion}`, data.toString(codificacion), (err) => {
      if (err) console.log('Error...');
      else {
        let archivoNombre = `archivo${codificacion}`;
        console.log(`${archivoNombre} creado...`);
        resolve(archivoNombre);
      }
    });
  })
}



/**
 *  Creu una funció que guardi en disc els fitxers del punt anterior encriptats amb algorisme aes-192-cbc,
 *  i esborri els fitxers inicials.
 */
//funcion encripta

function encriptarArchivo(archivo) {

  return new Promise((resolve) => {

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
      resolve('ok');
    });

  });

}

function borrarArchivos(archivo) {
  fs.unlink(archivo, err => {
    if (err) throw err;
    console.log(`${archivo} eliminado...`);
  })
}


async function ejercicio1() {
  try {
    console.log('Inicio...');
    let archivoCodificado = await codificarArchivo('../nivel1/archivo.txt', 'hex');
    let archivoCodificado1 = await codificarArchivo('../nivel1/archivo.txt', 'base64');
    await encriptarArchivo(archivoCodificado);
    await encriptarArchivo(archivoCodificado1);
    borrarArchivos(archivoCodificado);
    borrarArchivos(archivoCodificado1);
  }
  catch {
    console.error('Error....')
  }
}


ejercicio1();


