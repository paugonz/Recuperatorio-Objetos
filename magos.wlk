import objetos.*
class Mago {
    const objetosMagicos = #{}

    const poderInnato

    const nombreMago

    const resistencia

    var property puntosEnergia //lo tomo como la reserva de energia misma

    method resistencia() = resistencia

    method nombreMago() = nombreMago

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

    override method puntosAPerder() = 0
}

//instanciacion magos

const magoAprendiz = new MagoAprendiz(poderInnato = 100, nombreMago = "Aprendiz", resistencia = 50, puntosEnergia = 200, objetosMagicos = #{ojota})

const magoVeterano = new MagoVeterano(poderInnato = 150, nombreMago = "Mago veterano", resistencia = 100, puntosEnergia = 100, objetosMagicos = #{tunicaEpica})

const magoInmortal = new MagoInmortal(poderInnato = 200, nombreMago = "Inmortal", resistencia = 80, puntosEnergia = 250)
