/**
 * Nivell 3
 */
'use strict'

const amqp = require('amqplib')
const queue = process.env.QUEUE || 'Conexion'


class Publisher {

    delay(ms) {
        return new Promise((resolve) => {
            setTimeout(resolve, ms)
        })
    }

    async exit() {
        await this.delay(500)   //retardo para dar tiempo a enviar el mensaje y salir 
        process.exit()
    }


    async publica() {
        const connection = await amqp.connect('amqp://localhost')
        const channel = await connection.createChannel()
        await channel.assertQueue(queue)

        const message = {
            id: Math.floor(Math.random() * 100),
            text: 'Hola....'
        }
        const sent = channel.sendToQueue(queue, Buffer.from(JSON.stringify(message)))
        console.log(`Sent to ${queue} queue`, message)

        this.exit();


    }
}



const p1 = new Publisher();

p1.publica()
 .catch(error => {
     console.error(error);
     process.exit(1);
 })
 
