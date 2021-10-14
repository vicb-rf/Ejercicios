const EventEmitter  = require('events');

class Topic extends EventEmitter {
    constructor(name) {        
        super();
        this.name = name;
        this.observers = [];
    }

    subscribe(o) {
        this.observers.push(o);
    }

    unsubscribe(o) {
        this.observers = this.observers.filter(ob => ob !== o);
    }

    //notifica a todos los usuarios
    notify() {
        this.on('mensaje', (mensaje, usuario) => {
            console.log(`${this.name} a recibido mensaje enviado por ${usuario.name}`);
            this.observers.forEach(usuario => {
                usuario.notify();
                usuario.enviaMensaje(mensaje);
            })
        })
    }

    //envia mensaje a topic
    enviaMensaje(mensaje, usuario){
        this.notify();
        this.emit('mensaje', mensaje,  usuario)
    }
}

module.exports = Topic