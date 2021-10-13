const Marcador = require('./marcador')

class Juego {
    constructor(){
        this.jugadores = [];
        this.marcador = new Marcador();  
        console.log('Juego Iniciado');     
    }

    agregarJugador(jug) {        
        this.jugadores.push(jug);
        console.log(`${jug.name} se unio al juego`);
    }

    mostrarMarcador(){
        console.log('Marcador:')
        this.jugadores.forEach(jug => {
            console.log(`${jug.name}: ${jug.puntos} puntos`);
        })
        
    }

    ganador(){
        const jugad = this.jugadores.sort((j1, j2) => j2.puntos - j1.puntos)
        console.log('Ganador: ', jugad[0].name);
    }
}

module.exports = Juego