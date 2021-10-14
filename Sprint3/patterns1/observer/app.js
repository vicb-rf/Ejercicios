/**
 * Nivell 3
- Exercici 1 - Observer
 */

const Usuario = require('./usuario');
const Topic = require('./topic');

//crear topic
const topic = new Topic('topic');
const topic1 = new Topic('topic1');

//crear usuarios
const user = new Usuario('juan');
const user1 = new Usuario('pepe');
const user2 = new Usuario('maria');

//subscribir usuarios
topic.subscribe(user);

topic1.subscribe(user1);
topic1.subscribe(user2);

topic.enviaMensaje(user, '+++Gol+++');
topic1.enviaMensaje(user1, '+++Fault+++');

