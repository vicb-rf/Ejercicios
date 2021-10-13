'use strict'
/* - Exercici 1 - Singleton
*/

const Jugador = require('./jugador');
const Juego = require('./juego');

//Inicializar Juego
const juego1 = new Juego("Juego1");
//const juego2 = new Juego("Juego2");

//crear juagadores
const jugador1 = new Jugador("Juan");
const jugador2 = new Jugador('Maria');
const jugador3 = new Jugador('Luis');

//Agregar jugadores
juego1.agregarJugador(jugador1);
juego1.agregarJugador(jugador2);
juego1.agregarJugador(jugador3);


//agregar puntos
juego1.agregarPuntos(jugador2, 300);
juego1.agregarPuntos(jugador3, 200);
juego1.agregarPuntos(jugador1, 100);

//restar puntos
juego1.restarPuntos(jugador2, 50);

juego1.mostrarMarcador();

//Ganador
juego1.ganador();





