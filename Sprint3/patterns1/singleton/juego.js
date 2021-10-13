const Marcador = require('./marcador')

class Juego {
    constructor(nombre){
        this.nombre = nombre;
        this.marcador = Marcador;
        this.jugadores = [];
    }
    agregarJugador(jug) {        
        this.jugadores.push(jug);
    }

    agregarPuntos(j, puntos) {
        const name = j.name;
        this.jugadores = this.jugadores.map(jug => jug.name !== name ? jug : { name, puntos: jug.puntos + puntos })
    }

    restarPuntos(j, puntos) {
        const name = j.name;
        this.jugadores = this.jugadores.map(jug => jug.name !== name ? jug : { name, puntos: jug.puntos - puntos })
    }

    mostrarMarcador(){
        this.jugadores.forEach(jug => {
            console.log(`${this.nombre}: Jugador: ${jug.name} *** Puntuacion: ${jug.puntos}`);
        })
        
    }

    ganador(){
        const jugad = this.jugadores.sort((j1, j2) => j2.puntos - j1.puntos)
        console.log('Ganador: ', jugad[0].name);
    }
}

module.exports = Juego