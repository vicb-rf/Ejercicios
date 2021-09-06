/*
 * Creu una altra funció que desencripti i descodifiqui els fitxers finals
 *  tornant a generar els inicials.
 */
const fs = require('fs');
const crypto = require('crypto');

function desencriptarArchivo(archivo) {
    return new Promise((resolve) => {

        let archivoDesencriptado = archivo.replace('.enc', '');

        const algorithm = 'aes-192-cbc';
        const password = 'Password used to generate key';        
        const key = crypto.scryptSync(password, 'salt', 24);       
        const iv = Buffer.alloc(16, 0); 

        const decipher = crypto.createDecipheriv(algorithm, key, iv);

        const input = fs.createReadStream(archivo);
        const output = fs.createWriteStream(archivoDesencriptado);

        input.pipe(decipher).pipe(output);
        input.on('end', function () { 
            console.log(`${archivo} desencriptado....`);
            resolve(archivoDesencriptado);
        });

    })

}


function decodifica(archivo, code) {

    var data = fs.readFileSync(archivo).toString();
    let bufe = Buffer.from(data, code);
    fs.writeFileSync(`${archivo}Inicial.txt`, bufe.toString());
    console.log(`${archivo} decodificado...`);
}

async function ejercicio1_2() {
    console.log('Continua....')
    let archivoDesencriptado = await desencriptarArchivo('archivobase64.enc');
    let archivoDesencriptado1 = await desencriptarArchivo('archivohex.enc');
    decodifica(archivoDesencriptado, 'base64');
    decodifica(archivoDesencriptado1, 'hex');
    console.log('Fin........')

}

ejercicio1_2();