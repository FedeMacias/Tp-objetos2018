import Artefacto.*
import Excepciones.*
import Comerciante.*

class Comerciante {

	var property minimoNoImponible = 1

	method impuestoSobre(unArtefacto)

}

class ComercianteIndependiente inherits Comerciante {

	var property comision = 1

	override method impuestoSobre(unArtefacto) = comision

}

class ComercianteRegistrado inherits Comerciante {

	var property iva = 0.21

	override method impuestoSobre(unArtefacto) = unArtefacto.precio() * iva

}

class ComercianteConGanancias inherits Comerciante {

	override method impuestoSobre(unArtefacto) {
		if (unArtefacto.precio() > self.minimoNoImponible()) {
			return (unArtefacto.precio() - self.minimoNoImponible()) * 0.35
		} else {
			return 0
		}
	}

}
