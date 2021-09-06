/**
 * Creu una funció que imprimeixi recursivamente un missatge per consola amb demores d'un segon.
 */
function ejercici(numero){
    if(numero > 0){
        setTimeout(()=>{
            console.log(`Mensaje ${numero} despues de 2 segundos`);
            return(ejercici(numero - 1));
        }, 2000);            
    }    
}

ejercici(5);
