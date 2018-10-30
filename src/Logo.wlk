import Artefacto.*
import Excepciones.*
import Comerciante.*
import Personaje.*

class Logo {

	var property nombre = ""
	var property multiplicador = 1

	method poderHechiceria() = self.nombre().size() * self.multiplicador()

	method hechizoPoderoso() = self.poderHechiceria() >= 15

	method valorDeRefuerzo() = self.poderHechiceria()

	method precio() = self.poderHechiceria()

	method peso() {
		if (self.poderHechiceria().even()) {
			return 2
		} else {
			return 1
		}
	}

	method vendeteA(unPersonaje, unComerciante) = unPersonaje.hechizoFavorito(self)

}

class HechizoComercial inherits Logo {

	var property porcentaje = 0.20

	override method poderHechiceria() = self.nombre().size() * self.porcentaje() * self.multiplicador()

}

class HechizoBasico inherits Logo {

	override method poderHechiceria() = 10

}

