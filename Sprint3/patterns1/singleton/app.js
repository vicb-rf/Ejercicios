'use strict'
/* - Exercici 1 - Singleton
*/

const Jugador = require('./jugador');
const Juego = require('./juego');


//Inicializar Juego
const juego1 = new Juego("Juego1");

//crear juagadores
const jugador1 = new Jugador("Juan");
const jugador2 = new Jugador('Maria');
const jugador3 = new Jugador('Luis');

//gana puntos
juego1.agregarJugador(jugador1);
juego1.agregarJugador(jugador2);
juego1.agregarJugador(jugador3);


//agregar puntos
jugador1.ganaPuntos(200);
jugador2.ganaPuntos(100);
jugador3.ganaPuntos(300);

jugador1.pierdePuntos(50);
jugador2.pierdePuntos(50);
jugador3.pierdePuntos(50);

juego1.mostrarMarcador();

juego1.ganador();



