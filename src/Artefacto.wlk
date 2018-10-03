import Personaje.*
import FeriaHechiceria.*

class Artefacto {

}

class Arma inherits Artefacto {

	method unidadesLucha() = 3

}

class EspadaDelDestino inherits Arma {

}

class Espada inherits Arma {

}

class Hacha inherits Arma {

}

class Lanza inherits Arma {

}

class CollarDivino inherits Artefacto {

	var property cantidadDePerlas = 0

	method unidadesLucha() = cantidadDePerlas

}

class MascaraOscura inherits Artefacto {

	const property unidadesLucha = 4
	var property indiceDeOscuridad = 1

	method unidadesLucha() = unidadesLucha.max(self.poderMascara())

	method poderMascara() = self.indiceDeOscuridad() * (fuerzaOscura.fuerzaOscura() / 2)

}

object espejoFantastico inherits Artefacto {

	method unidadesLucha() {
		const artefactos = unPersonaje.artefactos().copy()
		artefactos.remove(self)
		if (artefactos.isEmpty()) {
			return 0
		} else {
			return artefactos.map({ artefacto => artefacto.unidadesLucha() }).max()
		}
	}

}

object libroDeHechizos inherits Artefacto {

	const property hechizos = []

	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.hechizoPoderoso() })

	method agregarHechizo(unHechizo) = hechizos.add(unHechizo)

	method agregarVariosHechizos(unosHechizos) = hechizos.addAll(unosHechizos)

	method quitarHechizo(unHechizo) = hechizos.remove(unHechizo)

	method poderHechiceria() = self.poderDeHechizosPoderosos()

	method poderDeHechizosPoderosos() = self.hechizosPoderosos().sum({ hechizoPoderoso => hechizoPoderoso.poderHechiceria() })

}

class Armadura inherits Artefacto {

	var property refuerzo = refuerzoNulo
	const property valorBase = 2

	method unidadesLucha() = self.valorBase() + self.refuerzo()

	method refuerzo() = self.refuerzo().valorDeRefuerzo()

}

class CotaDeMalla {

	var property valorDeRefuerzo = 1

}

object refuerzoNulo {

	method valorDeRefuerzo() = 0

}

object bendicion {

	method valorDeRefuerzo() = unPersonaje.nivelHechiceria()

}

