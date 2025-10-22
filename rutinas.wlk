import personas.*
import clubs.*

class Rutina {
    

    method descansoEn(tiempo){
            return
    }

    method intensidad(){
        return 
    }
    method caloriasQuemadasEn(tiempo){
        return 100 * (tiempo - self.descansoEn(tiempo)) * self.intensidad()
    }

}

class Running inherits Rutina{
    const  intensidad

    override method intensidad(){
        return intensidad
    }

    override method descansoEn(tiempo){
        if(tiempo > 20){
            return 5
        } else {
            return 2
        }
    }

}

class Maraton inherits Running {

    override method caloriasQuemadasEn(tiempo){
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina{

    override method descansoEn(tiempo){
        return (tiempo / 5)
    }

    override method intensidad(){
        return 1.3
    }
}

class RemoOlimpico inherits Remo{

    override method descansoEn(tiempo){
        return (super(tiempo)-3).max(2)
    }

    override method intensidad(){
        return 1.7
    }
}