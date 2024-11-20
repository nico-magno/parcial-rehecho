import Panelistas.*
import Tematicas.*

class Programa {
    const tematicas
    const panelistas

    method sePuedeEmitir() {
        return self.alMenosDosPanelistas() && self.masDeLaMitadInteresantes()
    }
    method alMenosDosPanelistas() = self.cantidadPanelistas() >= 2
    method cantidadPanelistas() = panelistas.size()
    method masDeLaMitadInteresantes() {
        return self.cantidadInteresantes() > self.cantidadTematicas() / 2
    }
    method cantidadTematicas() = tematicas.size()
    method cantidadInteresantes() = tematicas.count{ tematica => tematica.esInteresante() }
    method emitirse() {
        self.verificarPosibilidadDeEmision()
        tematicas.forEach{ tematica => self.opinarYRematar(tematica) }
    }
    method verificarPosibilidadDeEmision() {
        if (!self.sePuedeEmitir()) {
            throw new Exception(message = "El programa no se puede emitir")
        }
    }
    method opinarYRematar(tematica) {
        panelistas.forEach{ panelista => panelista.opinarYRematar(tematica) }
    }
    method panelistaEstrella() {
        self.verificarFinalizacionDeEmision()
        return panelistas.max{ panelista => panelista.puntos() }
    }
    method verificarFinalizacionDeEmision() {
        if (!self.terminado()) {
            throw new Exception(message = "La emision no ha terminado")
        }
    }
    method terminado() = tematicas.isEmpty()
}