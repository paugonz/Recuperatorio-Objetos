import objetos.*
class Mago {
    const objetosMagicos = #{}

    const poderInnato

    const nombreMago

    const resistencia

    var property puntosEnergia

    method resistencia() = resistencia

    method poderTotal() {
        return  self.sumaDePoderDeObjetosMagicos() * poderInnato
    }

    method sumaDePoderDeObjetosMagicos() {
        return objetosMagicos.sum({unObjeto => unObjeto.poderObjeto(self)})
    }

    method tieneNombrePar() {
        return nombreMago.size().even()
    }

    method perderPuntos(unaCantidad) {
        puntosEnergia -= unaCantidad
    }

    method sumarPuntos(unaCantidad) {
        puntosEnergia += unaCantidad
    }

    method desafiarA(otroMago) {
        if(otroMago.esVencidoPor(self)) {
            otroMago.perderPuntos(otroMago.puntosAPerder())
            self.sumarPuntos(otroMago.puntosAPerder())
        }
    }

    method esVencidoPor(otroMago)

    method puntosAPerder()
}

class MagoAprendiz inherits Mago {
    override method esVencidoPor(otroMago) {
        return self.resistencia() < otroMago.poderTotal()
    }

    override method puntosAPerder() {
        return puntosEnergia / 2
    }
}

class MagoVeterano inherits Mago {
    override method esVencidoPor(otroMago) {
        return otroMago.poderTotal() >= 1.5 * self.resistencia()
    }

    override method puntosAPerder() {
        return puntosEnergia / 4
    }
}

class MagoInmortal inherits Mago {
    override method esVencidoPor(otroMago) {
        return false
    }
}

