class Marcador {
    constructor() {
        if (Marcador.instance) {
            throw new Error('Marcador ya instaciado');
        }
       
        Marcador.instance = this;
    }
}

const marcador = new Marcador()
module.exports = marcador