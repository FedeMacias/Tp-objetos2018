import Artefacto.*
import Excepciones.*
import Comerciante.*

class Comerciante {

	var property tipoComerciante = 0
	var property minimoNoImponible = 5

	method impuestoSobre(unArtefacto) = self.tipoComerciante().impuesto(unArtefacto)

	method recategorizate() = self.tipoComerciante().siguiente()

	method iva() = 0.21

}

class Independiente inherits Comerciante {

	var property comision = 0

	method impuesto(unArtefacto) = unArtefacto.precio() * self.comision()

	method duplicarComision() = self.comision(self.comision() * 2)

	method siguiente() {
		if (self.comision() * 2 > 0.21) {
			self.comision(self.iva())
		} else {
			self.duplicarComision()
		}
		
	}
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

	method siguiente() = self.tipoComerciante(self)

}

