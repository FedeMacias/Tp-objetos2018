import Artefacto.*
import Excepciones.*
import Comerciante.*
import Logo.*

class Personaje {

	var property valorLucha = 1
	var property hechizoFavorito = new HechizoBasico()
	var property monedasOro = 100
	const property maximoEquipaje = 200
	var property equipaje = 1
	const property artefactos = []

	method valorBase() = 3

	method agregarArtefacto(unArtefacto) {
		if (self.equipaje() + unArtefacto.peso() < self.maximoEquipaje()) {
			self.artefactos().add(unArtefacto)
			self.aumentarEquipaje(unArtefacto.peso())
		} else {
			throw new ExcepcionPorSobrecarga("Te pasaste de peso, no podes cargar tantas cosas")
		}
	}

	method agregarVariosArtefactos(unosArtefactos) {
		if (self.equipaje() + unosArtefactos.sum({ artefacto => artefacto.peso() }) < self.maximoEquipaje()) {
			self.artefactos().addAll(unosArtefactos)
			self.aumentarEquipaje(unosArtefactos.sum({ artefacto => artefacto.peso()}))
		} else {
			throw new ExcepcionPorSobrecarga("Te pasaste de peso, no podes cargar tantas cosas")
		}
	}

	method quitarArtefacto(unArtefacto) {
		self.artefactos().remove(unArtefacto)
		return self.reducirEquipaje(unArtefacto.peso())
	}

	// ese return self.reducirEquipaje no me cierra
	method quitarTodoArtefacto() {
		self.artefactos().clear()
		self.equipaje(0)
	}

	method equipaje() = self.artefactos().sum({ artefacto => artefacto.peso() })

	method reducirEquipaje(unaCantidad) = self.equipaje(self.equipaje() - unaCantidad)

	method aumentarEquipaje(unaCantidad) = self.equipaje(self.equipaje() + unaCantidad)

	method nivelHechiceria() = ( self.valorBase() * self.hechizoFavorito().poderHechiceria() ) + fuerzaOscura.fuerzaOscura()

	method habilidadDeLucha() = self.valorLucha() + self.poderArtefactos()

	method poderArtefactos() = self.artefactos().sum({ artefacto => artefacto.unidadesLucha() })

	method sosPoderoso() = self.hechizoFavorito().hechizoPoderoso()

	method sosMejorLuchadorQueHechicero() = self.habilidadDeLucha() > self.nivelHechiceria()

	method estaCargado() = self.artefactos().size() >= 5

	method ganarMonedas(unasMonedas) {
		self.monedasOro(self.monedasOro() + unasMonedas)
	}

	method quitarMonedas(unasMonedas) {
		self.monedasOro((self.monedasOro() - unasMonedas).max(0))
	}

	method cumplirObjetivo() {
		self.ganarMonedas(10)
	}

	method mejorArtefacto() {
		const artefactosSinEspejo = self.artefactos().filter({ artefacto => artefacto != espejoFantastico })
		if (artefactosSinEspejo.isEmpty()) {
			return 0
		} else {
			return artefactosSinEspejo.max({ artefacto => artefacto.unidadesLucha() })
		}
	}

	method canjearHechizo(unHechizoNuevo, unComerciante) {
		if (self.monedasOro() > unHechizoNuevo.precio()) {
			self.transaccion(unHechizoNuevo, unComerciante)
			unHechizoNuevo.vendeteA(self, unComerciante)
		} else {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		}
	}

	method transaccion(unHechizoNuevo, unComerciante) {
		if (self.hechizoFavorito().precio().div(2) > unHechizoNuevo.precio()) {
			unHechizoNuevo.vendeteA(self, unComerciante)
		} else {
			self.quitarMonedas(unHechizoNuevo.precio())
			self.ganarMonedas(self.hechizoFavorito().precio().div(2))
			unHechizoNuevo.vendeteA(self, unComerciante)
		}
	}

	method comprarArtefacto(unArtefactoNuevo, unComerciante) {
		if (self.monedasOro() > unArtefactoNuevo.precio() + unComerciante.impuestoSobre(unArtefactoNuevo)) {
			self.quitarMonedas(unArtefactoNuevo.precio() + unComerciante.impuestoSobre(unArtefactoNuevo))
			unArtefactoNuevo.vendeteA(self)
		} else {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		}
	}

}

