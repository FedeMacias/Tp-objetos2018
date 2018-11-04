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
			return self.precio()
		} else {
			return unPersonaje.hechizoFavorito().precio().div(2)
		}
	}

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

object libroDeHechizos inherits Logo {

	const property hechizos = []

	override method peso() = 0

	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.hechizoPoderoso() })

	method hechizosPoderososSinLibro() = self.hechizosPoderosos().filter({ hechizo => hechizo != self })

	method agregarHechizo(unHechizo) = hechizos.add(unHechizo)

	method agregarVariosHechizos(unosHechizos) = hechizos.addAll(unosHechizos)

	method quitarHechizo(unHechizo) = hechizos.remove(unHechizo)

	override method poderHechiceria() = self.poderDeHechizosPoderosos()

	method poderDeHechizosPoderosos() = self.hechizosPoderososSinLibro().sum({ hechizosPoderososSinLibro => hechizosPoderososSinLibro.poderHechiceria() })

	override method precio() = (10 * self.hechizos().size()) + self.poderDeHechizosPoderosos()

}

