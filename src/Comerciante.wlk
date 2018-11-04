import Artefacto.*
import Excepciones.*
import Comerciante.*

class Comerciante {

	var property tipoComerciante = 0
	var property minimoNoImponible = 1

	method impuestoSobre(unArtefacto) = self.tipoComerciante().impuesto(unArtefacto)

	method recategorizate() = self.tipoComerciante().siguiente()

	method iva() = 0.21

}

class Independiente inherits Comerciante {

	var property comision = 0.21

	method impuesto(unArtefacto) = unArtefacto.precio() * self.comision()

	method siguiente() = self.comision(self.comision()*2)
	
}

object registrado inherits Comerciante {

	method impuesto(unArtefacto) = unArtefacto.precio() * self.iva()

	method siguiente() = self.tipoComerciante(conGanancias)

}

object conGanancias inherits Comerciante {

	method impuesto(unArtefacto) {
		if (unArtefacto.precio() > self.minimoNoImponible()) {
			return ((unArtefacto.precio() - self.minimoNoImponible()) * 0.35)
		} else {
			return 0
		}
	}

	method siguiente() {}

}

