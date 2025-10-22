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

    method rutinasMasExigentePara(persona){
        
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

    method predioConRutinaDe500CaloriasPara(persona){
        rutinas.any({rutina => (rutina.caloriasQuemadasEn(persona.tiempoEntreno())==500)})
    }

}