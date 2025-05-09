object knightRider {
    method cosecuencia() {
      
    }
    method bultos() = 1
    method peso()= 500
    method peligrosidad()= 10
}
object bumblebee {
    method consecuencia() {
        self.transformarEnRobot()
    }
    var estaTransformado = true
    method tranformado() = estaTransformado
    method transformarEnRobot() = estaTransformado = true
    method transformarEnAuto() = estaTransformado = false
    method peso()= 800
    method peligrosidad(){
        if (self.tranformado()){
            return 30
        }
        else{
            return 15
        }
    }
}
object paqueteDeLadrillos {
    method cosecuencia() {
      ladrillos += 12 
    }
    method bultos(){
        if(cantidadLadrillos <= 100){
            return 1 
        }
        else if(cantidadLadrillos.between(101, 300)){
            return 2
        }
        else{
            return 3
        }
    }
    var ladrillos = 0
    method cantidadLadrillos() {
      return ladrillos 
    }
    method ladrillos(cantidad) {ladrillos = cantidad}
    method peso()= ladrillos * 2
    method peligrosidad()= 2
}
object arenaAGranel {
    method cosecuencia() {
        self.peso() - 10
    }
    method bultos() = 1
    var property peso = 0
    method peligrosidad() = 1
}
object bateriaAntiAerea {
    method cosecuencia() {
        self.cargarMisiles()
    }
    method bultos(){
        if(estaConMisiles){
            return 2
        }
        else{
            return 1
        }
    }

    var estaConMisiles = true 
    method peso(){
        if(estaConMisiles){
            return 300 
        }
        else{
            return 200
        }
    }
    method peligrosidad()= 100
    method cargarMisiles(){
        estaConMisiles = true 
    }
    method descargarMisiles(){
        estaConMisiles = false 
    }
}
object contenedorPortuario {
    method cosecuencia() {
        cosas.all({e=>e.consecuencia()})
    }
    method bultos() {
      return 1 +  cosas.sum({e=>e.bultos()})
    }
    const cosas = []
    method peso() {
      return 100 + cosas.sum({e=>e.peso()}) 
    }
    method agregar(unaCosa) {
        cosas.add(unaCosa)
    }
    method peligrosidad()= cosas.max({e=>e.peligrosidad()})
}
object residuosRadioactivos {
    method cosecuencia() {
        peso + 15
    }
    method bultos() = 1
    var property peso = 0  

    method peligrosidad()= 200
}
object embalajeDeSeguridad {
    method cosecuencia() {
      
    }
    var cosaAdentro = bumblebee
    method peso() {
      return cosaAdentro.peso() 
    }
     method cambiarCosaAdentro(unaCosa) {
        cosaAdentro = unaCosa
    }
    method agregar(cosa) {
        cosaAdentro = cosa 
    }
    method peligrosidad()= cosaAdentro.peligrosidad() / 2
}

