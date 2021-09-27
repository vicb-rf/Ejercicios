'use strict'
/* - Exercici 1 - Singleton
*/

class Jugador {
    constructor(name) {
        this.name = name;
    }
}

class Marcador {
    constructor() {
        if (Marcador.instance) {
            throw new Error('Marcador ya instaciado');
        }
        this.jugadores = [];
        Marcador.instance = this;
    }

    agregarJugador(jug) {
        jug.puntos = 0;
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
            console.log(`Jugador: ${jug.name} *** Puntuacion: ${jug.puntos}`);
        })
        
    }

    ganador(){
        const jugad = this.jugadores.sort((j1, j2) => j2.puntos - j1.puntos)
        console.log('Ganador: ', jugad[0].name);
    }
}

//Inicializar marcador
const m1 = new Marcador();

//Crear jugador
const j1 = new Jugador('juan');
const j2 = new Jugador('pepe');
const j3 = new Jugador('maria');

//Agregar jugadores al juego
m1.agregarJugador(j1);
m1.agregarJugador(j2);
m1.agregarJugador(j3);

//agregar puntos
m1.agregarPuntos(j1, 200);
m1.agregarPuntos(j2, 250);
m1.agregarPuntos(j3, 350);

//restar puntos
m1.restarPuntos(j1, 100);
m1.restarPuntos(j2, 150);
m1.restarPuntos(j3, 250);

//agregar puntos
m1.agregarPuntos(j1, 100);
m1.agregarPuntos(j2, 70);
m1.agregarPuntos(j3, 90);

//Visualizar marcador
m1.mostrarMarcador();
m1.ganador();




