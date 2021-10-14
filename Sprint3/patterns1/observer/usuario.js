const EventEmitter = require('events');

class Usuario extends EventEmitter {
    constructor(name) {
        super();
        this.name = name;
        //console.log(`${this.name} creado`)
    }

    //recibe mensaje
    notify() {
        this.on('mensaje', (mensaje) => {
            console.log(`${this.name}, recibio el mensaje: ${mensaje}`);
        })
    }

    enviaMensaje(mensaje) {
        this.emit('mensaje', mensaje);
    }
}

module.exports = Usuario