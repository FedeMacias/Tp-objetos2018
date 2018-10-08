import Personaje.*
import FeriaHechiceria.*

class Artefacto {

	var duenio = new Personaje()

}

class Arma inherits Artefacto {

	method unidadesLucha() = 3

	method precio() = 5 * self.unidadesLucha()

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

	method precio() = 2 * self.cantidadDePerlas()

}

class MascaraOscura inherits Artefacto {

	const property unidadesLucha = 4
	var property indiceDeOscuridad = 1

	method unidadesLucha() = unidadesLucha.max(self.poderMascara())

	method poderMascara() = self.indiceDeOscuridad() * (fuerzaOscura.fuerzaOscura().div(2))

}

object espejoFantastico inherits Artefacto {

	method unidadesLucha() {
		const artefactos = duenio.artefactos().filter({ artefacto => artefacto != self })
		if (artefactos.isEmpty()) {
			return 0
		} else {
			return artefactos.max({ artefacto => artefacto.unidadesLucha() })
		}
	}

	method precio() = 90

}

object libroDeHechizos inherits Artefacto {

	const property hechizos = []

	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.hechizoPoderoso() })

	method agregarHechizo(unHechizo) = hechizos.add(unHechizo)

	method agregarVariosHechizos(unosHechizos) = hechizos.addAll(unosHechizos)

	method quitarHechizo(unHechizo) = hechizos.remove(unHechizo)

	method poderHechiceria() = self.poderDeHechizosPoderosos()

	method poderDeHechizosPoderosos() = self.hechizosPoderosos().sum({ hechizoPoderoso => hechizoPoderoso.poderHechiceria() })

	method precio() = (10 * self.hechizos().size()) + self.poderDeHechizosPoderosos()

}

class Armadura inherits Artefacto {

	var property refuerzoArmadura = refuerzoNulo
	const property valorBase = 2

	method unidadesLucha() = self.valorBase() + self.refuerzo()

	method refuerzo() = self.refuerzoArmadura().valorDeRefuerzo()

}

class CotaDeMalla {

	var property valorDeRefuerzo = 1

}

object refuerzoNulo {

	method valorDeRefuerzo() = 0

}

class Bendicion {

	var duenio = new Personaje()

	method valorDeRefuerzo() = duenio.nivelHechiceria()

}

