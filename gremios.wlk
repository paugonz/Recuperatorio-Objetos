import magos.*
import objetos.*

class Gremio {
    const miembros = #{}

    method miembros() = miembros

    method poderTotal() {
        return miembros.sum({unMiembro => unMiembro.poderTotal()})
    }

    method puntosPerdidosTotal() {
        return miembros.sum({unMiembro => unMiembro.puntosAPerder()})
    }

    method reservaTotalGremio() {
        return miembros.sum({unMiembro => unMiembro.puntosEnergia()})
    }

    method resistencia() {
        return miembros.sum({unMiembro => unMiembro.resistencia()})
    }

    method liderDelGremio() {
        return miembros.max({unMiembro => unMiembro.poderTotal()})
    }

    // para el punto 3 de la parte B, al haber polimorfismo tanto para los gremios como para los magos con el metodo poderTotal()
    // utilizado en el metodo liderDelGremio(), no es necesario realizar ningun cambio para poder soportar el requerimiento al pedir
    // el lider del gremio, esté compuesto solo por magos, o tambien por otros gremios
    method desafiarA(unOponente) {
        if(self.puedeVencerA(unOponente)) {
            self.liderDelGremio().sumarPuntos(unOponente.puntosPerdidosTotal()) //solo suma los puntos perdidos por los miembros oponentes, los oponentes no pierden puntos
        }
    }

    method puedeVencerA(unOponente) {
        return self.poderTotal() > unOponente.resistenciaTotalGremioMasLider()
    }

    method resistenciaTotalGremioMasLider() {
        return self.resistencia() + self.liderDelGremio().resistencia()
    }

}

//inicializo el gremio con dos magos

const gremio = new Gremio(miembros = #{magoAprendiz, magoVeterano, otroGremio})

const otroGremio = new Gremio(miembros = #{magoInmortal, magoAprendiz})
