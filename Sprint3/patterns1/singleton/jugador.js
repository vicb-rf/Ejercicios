class Jugador {
    constructor(name) {
        this.name = name;
        this.puntos = 0;
        //console.log(`Jugador ${this.name} creado`);
    }
    
    ganaPuntos(puntos){
        this.puntos += puntos;
        console.log(`${puntos} puntos gano ${this.name}`);
    }

    pierdePuntos(puntos){
        this.puntos -= puntos;
        console.log(`${puntos} puntos perdio ${this.name}`);
    }

}

module.exports = Jugador