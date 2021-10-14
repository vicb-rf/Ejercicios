const EventEmitter = require('events');

class Topic extends EventEmitter {
    constructor(name) {
        super();
        this.name = name;
        this.observers = [];
        //console.log(`${this.name} creado`)
    }

    subscribe(o) {
        this.observers.push(o);
    }

    unsubscribe(o) {
        this.observers = this.observers.filter(ob => ob !== o);
    }

    //notifica a todos los usuarios
    notify() {
        this.on('mensaje', (usuario, mensaje) => {
            console.log(`${this.name}: ${usuario.name} envio un mensaje`);
            this.observers.forEach(usuario => {                
                    usuario.notify();
                    usuario.enviaMensaje(mensaje);
               
            })
        })
    }

    enviaMensaje(usuario, mensaje) {
        this.notify();
        this.emit('mensaje', usuario, mensaje)

      
        
    }
}

module.exports = Topic