import Personaje.*
import Artefacto.*
import Excepciones.*

object feriaHechiceria {

	method canjearHechizo(unPersonaje, unHechizoNuevo) {
		if (unPersonaje.monedasOro() < unHechizoNuevo.precio()) {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		} else {
			self.transaccionPor(unPersonaje, unHechizoNuevo)
			unPersonaje.hechizoFavorito(unHechizoNuevo)
		}
	}

	method transaccionPor(unPersonaje, unHechizoNuevo) {
		unPersonaje.quitarMonedas(unHechizoNuevo.precio())
		unPersonaje.ganarMonedas(unPersonaje.hechizoFavorito().precio().div(2).min(unHechizoNuevo.precio()))
	}

	method comprarArtefacto(unPersonaje, unArtefactoNuevo) {
		if (unPersonaje.monedasOro() < unArtefactoNuevo.precio()) {
			throw new ExcepcionPorFaltaDeFondos("No tenes suficientes monedas de oro para comprar esto")
		} else {
			unPersonaje.quitarMonedas(unArtefactoNuevo.precio())
			unPersonaje.agregarArtefacto(unArtefactoNuevo)
		}
	}

}

