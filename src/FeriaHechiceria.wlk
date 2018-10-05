import Personaje.*
import Artefacto.*

object feriaHechiceria {

	method canjearHechizo(unPersonaje,unHechizoNuevo) {
		self.transaccionPor(unPersonaje,unHechizoNuevo)
		unPersonaje.hechizoFavorito(unHechizoNuevo)
	}

	method transaccionPor(unPersonaje,unHechizoNuevo) {
		unPersonaje.quitarMonedas(unHechizoNuevo.precio())
		unPersonaje.ganarMonedas(unPersonaje.hechizoFavorito().precio().div(2))
	}
	
	method comprarArtefacto(unPersonaje,unArtefactoNuevo){
		unPersonaje.quitarMonedas(unArtefactoNuevo.precio())
		unPersonaje.agregarArtefacto(unArtefactoNuevo)
	}

}

