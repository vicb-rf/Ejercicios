/**
 * Nivell 3
- Exercici 1 - Observer
 */

const Usuario = require('./usuario');
const Topic = require('./topic');

//const sub = new Subject();
const topic = new Topic('topic');
const topic1 = new Topic('topic1');

const user = new Usuario('juan');
const user1 = new Usuario('pepe');
const user2 = new Usuario('maria');


//console.log(user);


topic.subscribe(user);
//topic.subscribe(user1);
topic1.subscribe(user1);
topic1.subscribe(user2);

//console.log(topic)


topic.enviaMensaje('hola ', user1);
topic1.enviaMensaje('chao ', user1);


