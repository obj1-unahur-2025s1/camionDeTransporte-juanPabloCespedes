object camion {
    const cargaTotal = []
    method cargarUnaCosa(cosa) {
        cargaTotal.add(cosa)
    }
    method descargarUnaCosa(cosa) {
        cargaTotal.remove(cosa)
    }
    method peso() {
       return cargaTotal.sum({e=>e.peso()}) + 1000 
    }
    method esParLaCargaTotal() {
      return cargaTotal.sum({e=>e.peso()}).isEven()
    }
    method hayUnaCosaDePeso(peso) {
        return cargaTotal.any({e=>e.peso() === peso})
    }
    method laPrimerCosaPeligrosa() {
        return cargaTotal.find(e=>e.esPeligrosa())
    }
    method obtenerTodasLasCosasPeligrosasDeNivel(nivel) {
        return cargaTotal.filter({e=>e.peligrosidad()==nivel})
    }
    method listasQueSuperanPeligrosidadDelNivelDeUnaCosa(cosa) {
        return cargaTotal.filter({e=>e.peligrosidad() > cosa.peligrosidad()})
    }
    method estaConPesoExcedidoDelCamion() {
        return self.peso() > 2500
    }
    method puedeCircularEnRuta(nivel) {
        return !self.estaConPesoExcedidoDelCamion() and cargaTotal.filter({e=>e.peligrosidad() > nivel}).isEmpty() 
    }
    method tieneAlgoEntre(min,max) {
        return cargaTotal.any({e=>e.peso()}).between(min, max) 
    }
    method laCosaMasPesada(cosa) {
        return cargaTotal.max({e=>e.peso()})
    }

}