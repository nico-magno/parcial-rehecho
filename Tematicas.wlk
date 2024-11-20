import Panelistas.*

class Tematica {
    const titulo

    method titulo() = titulo
    method cantidadPalabrasTitulo() = self.titulo().words().length()
    method serOpinadaPor(panelista) { panelista.ganarPuntos(1) }
    method esInteresante() = false
    method incluyePalabra(palabra) = self.titulo().words().contains(palabra)
}

class Deportiva inherits Tematica {
    override method serOpinadaPor(panelista) {
        if (panelista.esDeportivo() ) {
            panelista.ganarPuntos(5)
        } else { super(panelista) }
    }
    override method esInteresante() = self.incluyePalabra("Messi")
}

class Farandula inherits Tematica {
    const involucrados

    override method serOpinadaPor(panelista) {
        if (panelista.esCelebridad() && self.involucra(panelista)) {
            panelista.ganarPuntos(self.cantidadDeInvolucrados())
        } else { super(panelista) }
    }
    method involucra(panelista) = involucrados.contains(panelista)
    method cantidadDeInvolucrados() = involucrados.size()
    override method esInteresante() = self.cantidadDeInvolucrados() >= 3
}

class Filosofica inherits Tematica {
    override method esInteresante() = self.cantidadPalabrasTitulo() > 20
}

class Economica inherits Tematica {}

class Moral inherits Tematica {}

class Mixta inherits Tematica {
    const tematicas

    method titulos() = tematicas.map{ tematica => tematica.titulo() }
    override method titulo() = self.titulos().join(", ")
    override method serOpinadaPor(panelista) {
        tematicas.forEach{ tematica => tematica.serOpinadaPor(panelista) }
    }
    override method esInteresante() = tematicas.any{ tematica => tematica.esInteresante() }
}