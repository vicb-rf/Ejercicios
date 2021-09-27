/**
 * Nivell 3
- Exercici 1 - Observer
 */

'use strict'

const EventEmitter = require('events');

class MyEmitter extends EventEmitter { }
const myEmitter = new MyEmitter();

class Observable {
    constructor() {
        this.observers = [];
    }

    subscribe(o) {
        this.observers.push(o);
    }

    unsubscribe(o) {
        this.observers = this.observers.filter(ob => ob !== o);
    }

    notify(model) {
        myEmitter.emit('envia', this.observers.forEach(ob => {
            ob.notify(model);
        }));
        myEmitter.emit('envia');
    }
}

class Topic extends Observable {
    constructor(name) {
        super();
        this.name = name;
        this.text = "";

    }

    notify(text) {        
        this.text = text;   //agremamos text al objeto this
        super.notify(this);
    }
}

class Usuario {
    constructor(name) {
        this.name = name;
    }

    notify(model) {
        console.log(`${this.name}, recibio el mensaje: ${model.text}, enviado por ${model.name} `);

    }
}

//const sub = new Subject();
const topic = new Topic('topic');
const topic1 = new Topic('topic1');

const user = new Usuario('juan');
const user1 = new Usuario('pepe');
const user2 = new Usuario('maria');

topic.subscribe(user);
topic1.subscribe(user1);
topic1.subscribe(user2);

topic.notify('hola');
topic1.notify('hola ');


console.log('+++++ unsubscribe +++++')
topic1.unsubscribe(user1);

topic.notify('chaooooo');
topic1.notify('chaooooo');
