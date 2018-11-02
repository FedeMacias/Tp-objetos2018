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

	method descuentoPara(unPersonaje) {
		if (unPersonaje.hechizoFavorito().precio().div(2) > self.precio()) {
			return self.poderHechiceria()
		} else {
			return unPersonaje.hechizoFavorito().precio().div(2)
		}
	}

	method precio() = self.poderHechiceria() - self.descuentoPara(unPersonaje)

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

