import Tematicas.*

class Panelista {
    var puntosEstrella = 0

    method rematar(tematica) {}
    method ganarPuntos(cantidad) { puntosEstrella += cantidad }
    method opinarSobre(tematica) { tematica.serOpinadaPor(self) }
    method esDeportivo() = false
    method esCelebridad() = false
    method opinarYRematar(tematica) {
        self.opinarSobre(tematica)
        self.rematar(tematica)
    }
    method puntos() = puntosEstrella
}

class Celebridad inherits Panelista {
    override method rematar(tematica) { self.ganarPuntos(3) }
    override method esCelebridad() = true
}

class Colorado inherits Panelista {
    var gracia = 0

    override method rematar(tematica) {
        self.ganarPuntos(gracia / 5)
        self.aumentarGracia()
    }
    method aumentarGracia() { gracia += 1}
}

class ColoradoConPeluca inherits Colorado {
    override method rematar(tematica) {
        self.ganarPuntos(1)
        super(tematica)
    }
}

class Viejo inherits Panelista {
    override method rematar(tematica) {
        self.ganarPuntos(tematica.cantidadPalabrasTitulo())
    }
}

class Deportivo inherits Panelista {
    override method esDeportivo() = true
}