import magos.*
import objetos.*

class Gremio {
    const miembros = #{}

    method miembros() = miembros

    method poderTotalGremio() {
        return miembros.sum({unMiembro => unMiembro.poderTotal()})
    }

    method puntosPerdidosTotal() {
        return miembros.sum({unMiembro => unMiembro.puntosAPerder()})
    }

    method reservaTotalGremio() {
        return miembros.sum({unMiembro => unMiembro.puntosEnergia()})
    }

    method resistenciaTotalGremio() {
        return miembros.sum({unMiembro => unMiembro.resistencia()})
    }

    method liderDelGremio() {
        return miembros.max({unMiembro => unMiembro.poderTotal()})
    }

    method desafiarA(unOponente) {
        if(self.puedeVencerA(unOponente)) {
            self.liderDelGremio().sumarPuntos(unOponente.puntosPerdidosTotal()) //solo suma los puntos perdidos por los miembros oponentes, los oponentes no pierden puntos
        }
    }

    method puedeVencerA(unOponente) {
        return self.poderTotalGremio() > unOponente.resistenciaTotalGremioMasLider()
    }

    method resistenciaTotalGremioMasLider() {
        return self.resistenciaTotalGremio() + self.liderDelGremio().resistencia()
    }

}

//inicializo el gremio con dos magos

const gremio = new Gremio(miembros = #{magoAprendiz, magoVeterano, otroGremio})

const otroGremio = new Gremio(miembros = #{magoInmortal, magoAprendiz})