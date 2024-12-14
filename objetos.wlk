import magos.*

class ObjetoMagico {
  const poderBase

  method poderObjeto(mago) {
    return poderBase + self.poderExtra(mago)
  }

  method poderExtra(mago)
}

class Varita inherits ObjetoMagico {
  override method poderExtra(mago) {
    if (mago.tieneNombrePar()) {
      return poderBase * 0.5
    } else {
      return 0
    }
  }
}

class TunicaComun inherits ObjetoMagico {
  override method poderExtra(mago) {
    return 2 * mago.resistencia()
  }
}

class TunicaEpica inherits ObjetoMagico {
    override method poderExtra(mago) {
        return 10 + 2 * mago.resistencia()
    }
}

class Amuleto {
    method poderObjeto(mago) = 200
}

object ojota {
    method poderObjeto(mago) {
        return mago.nombreMago().size() * 10
    }
}