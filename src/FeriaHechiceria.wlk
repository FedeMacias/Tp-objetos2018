import Personaje.*
import Artefacto.*

object feriaHechiceria {

	method canjearHechizo(unHechizoNuevo) {
		self.transaccionPor(unHechizoNuevo)
		unPersonaje.hechizoFavorito(unHechizoNuevo)
	}

	method transaccionPor(unHechizoNuevo) {
		unPersonaje.quitarMonedas(unHechizoNuevo.precio())
		unPersonaje.ganarMonedas(unPersonaje.hechizoFavorito().precio().div(2))
	}
	
	method comprarArtefacto(unArtefactoNuevo){
		unPersonaje.quitarMonedas(unArtefactoNuevo.precio())
		unPersonaje.agregarArtefacto(unArtefactoNuevo)
	}

}

