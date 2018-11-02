import Artefacto.*
import Excepciones.*
import Comerciante.*

class Comerciante {

	var property tipo = 0

	method impuestoSobre(unArtefacto) = self.tipo().impuesto(unArtefacto)

	method recategorizarse() = self.tipo().recategorizarse()

}


class ImpuestoPorComision {

	var property comision = 0.21

	method aplicarImpuesto(unArtefacto, unaComision) = unArtefacto.precio() * self.comision()

}

class ImpuestoPorIVA {

	method iva() = 0.21

	method aplicarImpuesto(unArtefacto) = unArtefacto.precio() * self.iva()

}

class ImpuestoALasGanancias {

	var property minimoNoImponible = 1

	method aplicarImpuesto(unArtefacto) {
		if (unArtefacto.precio() > self.minimoNoImponible()) {
			return (unArtefacto.precio() - self.minimoNoImponible()) * 0.35
		} else {
			return 0
		}
	}

}

class ComercianteIndependiente {

	var property tipoDeImpuesto = 0

	method impuesto(unArtefacto) = self.tipoDeImpuesto().aplicarImpuesto(unArtefacto)

	method recategorizarse()

}

class ComercianteRegistrado {

	var property tipoDeImpuesto = 0

	method impuesto(unArtefacto) = self.tipoDeImpuesto().aplicarImpuesto(unArtefacto)

	method recategorizarse()

}

class ComercianteConGanancias {

	var property tipoDeImpuesto = 0

	method impuesto(unArtefacto) = self.tipoDeImpuesto().aplicarImpuesto(unArtefacto)

	method recategorizarse()

}

