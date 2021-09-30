const util = require('util');
const fs = require('fs');
const { join } = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");
const leerDirectorio = util.promisify(fs.readdir);
const leerArchivo = util.promisify(fs.readFile);
const escribirArchivo = util.promisify(fs.writeFile);

const reverseText = str =>
  str
  .split("")
  .reverse()
  .join("");

// Read and reverse contents of text files in a directory


leerDirectorio(inbox)
.then(files => {
  files.forEach(file =>{
    leerArchivo(join(inbox, file), 'utf-8')
  })  
})
.then(data => {
  escribirArchivo(join(outbox, file), reverseText(data));
  console.log(`${file} was successfully saved in the outbox!`);
})
.catch(err => {
  console.log(err, "Error: Archivo inaccessible");
})
.catch(err => {
  console.log(err, "Error: Folder inaccessible");
});




