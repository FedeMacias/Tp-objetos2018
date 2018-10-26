import Artefacto.*
import Excepciones.*

class Personaje {

	var property valorLucha = 1
	var property hechizoFavorito
	var property monedasOro = 100
	const property maximoEquipaje = 1
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

	method canjearHechizo(unPersonaje, unHechizoNuevo) {
		if (unPersonaje.monedasOro() > unHechizoNuevo.precio()) {
			self.transaccionPor(unPersonaje, unHechizoNuevo)
		} else {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		}
	}

	method transaccionPor(unPersonaje, unHechizoNuevo) {
		if (unPersonaje.hechizoFavorito().precio().div(2) > unHechizoNuevo.precio()) {
			unPersonaje.hechizoFavorito(unHechizoNuevo)
		} else {
			unPersonaje.quitarMonedas(unHechizoNuevo.precio())
			unPersonaje.ganarMonedas(unPersonaje.hechizoFavorito().precio().div(2).min(unHechizoNuevo.precio()))
			unPersonaje.hechizoFavorito(unHechizoNuevo)
		}
	}

	method comprarArtefacto(unPersonaje, unArtefactoNuevo) {
		if (unPersonaje.monedasOro() > unArtefactoNuevo.precio()) {
			unPersonaje.quitarMonedas(unArtefactoNuevo.precio())
			unPersonaje.agregarArtefacto(unArtefactoNuevo)
		} else {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		}
	}

}

class NPC inherits Personaje {

	var property dificultad = moderado

	override method habilidadDeLucha() = (self.valorLucha() + self.poderArtefactos()) * self.dificultad().multiplicador()

}

object facil {

	method multiplicador() = 1

}

object moderado {

	method multiplicador() = 2

}

object dificil {

	method multiplicador() = 4

}

object fuerzaOscura {

	var property fuerzaOscura = 5

	method eclipse() = self.fuerzaOscura(self.fuerzaOscura() * 2)

}

