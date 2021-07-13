var fs = require('fs');
/*
- Exercici 3
Creu una altra que imprimeixi per pantalla el que llegeixi d'un fitxer.
 */

fs.readFile('archivo.txt', (err, data) => {
    if(err){
        console.log('error:', err);
    }else{
        console.log(`leyendo archivo:
        ${data.toString()}`);
    }
})
