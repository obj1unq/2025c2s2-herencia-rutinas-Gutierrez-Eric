import personas.*
import rutinas.*

class Club {
    const property predios = #{}

    method mejorPredioPara(persona){
        return predios.max({predio => predio.caloriasAlRealizarTodasLasActividades (persona)})
    }


    method prediosTranquisPara(persona){
        return predios.filter({predio => predio.conRutinaDe500CaloriasPara(persona)})   
    }

    method rutinasMasExigenteEnCadaPredioPara(persona){
        return predios.map({predio => predio.rutinaMasExigentePara(persona)})
    }

}

class Predio {
    const property rutinas = #{}

    method caloriasAlRealizarTodasLasActividades (persona){
        return self.caloriasDeActividadesPara(persona).sum()
    }

    method caloriasDeActividadesPara(persona){
        return rutinas.map({rutina => rutina.caloriasQuemadasEn(persona.tiempoEntreno()) })
    }

    method conRutinaDe500CaloriasPara(persona){
        return rutinas.any({rutina => (rutina.caloriasQuemadasEn(persona.tiempoEntreno()) < 500)})
    }

    method rutinaMasExigentePara(persona){
        return rutinas.max({rutina => rutina.caloriasQuemadasEn(persona.tiempoEntreno())})
    }

}