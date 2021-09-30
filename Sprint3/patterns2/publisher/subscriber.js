'use strict'

const amqp = require('amqplib')
const queue = process.env.QUEUE || 'Conexion'

class Subscriber{

    async recibe(){
        const connection = await amqp.connect('amqp://localhost')
        const channel = await connection.createChannel()
    
        await channel.assertQueue(queue)   
            
        channel.consume(queue, message => {
            const content = JSON.parse(message.content.toString())
        
            console.log(`Recived message from "${queue}`)
            console.log(content)
    
            channel.ack(message)
        })
    }

}

const s1 = new Subscriber();

s1.recibe()
.catch(error => {
    console.error(error);
    process.exit(1);
})
