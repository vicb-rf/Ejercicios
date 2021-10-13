const fs = require('fs');
const { join } = require("path");
const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = str =>
  str
    .split("")
    .reverse()
    .join("");

// Read and reverse contents of text files in a directory

function directorio(error, files) {
  if (error) return console.log("Error: Folder inaccessible");
  files.forEach(file => leeArchivo(file));
}

function leeArchivo(file) {
  fs.readFile(join(inbox, file), "utf8", invierteArchivo);


  function invierteArchivo(error, data) {
    if (error) return console.log("Error: File error");
    fs.writeFile(join(outbox, file), reverseText(data), errorEscritura);
  }

  function errorEscritura(error) {
    if (error) return console.log("Error: File could not be saved!");
    console.log(`${file} was successfully saved in the outbox!`)
  }
}
fs.readdir(inbox, directorio);