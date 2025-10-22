import rutinas.*
import clubs.*

class Persona {

    var property peso
    
    method kilosPorCalorias(){
        return
    }
    
    method tiempoEntreno(){
        return
    }

    method realizarRutina(rutina){
            self.validarEntrenar(rutina)
            self.entrenar(rutina)
    }

    method puedeRealizar(rutina){
        return
    }

    method entrenar(rutina){
        peso = peso - self.pesoQuePierdeEn(rutina)
    }

    method pesoQuePierdeEn(rutina){
        return rutina.caloriasQuemadasEn(self.tiempoEntreno()) / self.kilosPorCalorias()
    }

    method validarEntrenar(rutina){
        if( not self.puedeRealizar(rutina)){
            self.error ("No puede realizar rutina de" + rutina)
        }
    }
}

class PersonaSedentaria inherits Persona {
    
    const tiempoEntreno

    override method kilosPorCalorias(){
        return 7000
    }

    override method puedeRealizar(rutina){
        return peso > 50
    }

    override method tiempoEntreno(){
        return tiempoEntreno
    }

}

class PersonaAtleta inherits Persona {


    override method kilosPorCalorias(){
        return 8000
    }

    override method puedeRealizar(rutina){
        return rutina.caloriasQuemadasEn(self.tiempoEntreno()) > 10000
    }

    override method pesoQuePierdeEn(rutina){
        return super(rutina) - 1
    }

    override method tiempoEntreno(){
        return 90
    }
}
