object rolando {

	var property valorBase = 3
	var property valorLucha = 1
	var property fuerzaOscura = 5
	var property hechizoFavorito
	const artefactos = []

	method artefactos() = artefactos

	method agregarArtefacto(unArtefacto) = artefactos.add(unArtefacto)

	method agregarVariosArtefactos(unosArtefactos) = artefactos.addAll(unosArtefactos)

	method quitarArtefacto(unArtefacto) = artefactos.remove(unArtefacto)

	method quitarTodoArtefacto() = artefactos.clear()

	method nivelHechiceria() = ( valorBase * hechizoFavorito.poderHechiceria() ) + fuerzaOscura

	method habilidadDeLucha() = valorLucha + self.poderArtefactos()

	method poderArtefactos() = artefactos.sum({ artefacto => artefacto.unidadesLucha() })

	method eclipse() {
		self.fuerzaOscura(fuerzaOscura * 2)
	}

	method sosPoderoso() = hechizoFavorito.hechizoPoderoso()

	method sosMejorLuchadorQueHechicero() = self.habilidadDeLucha() > self.nivelHechiceria()

	method estaCargado() = artefactos.size() >= 5

}

object espectroMalefico {

	var property nombre = "Espectro malefico"

	method poderHechiceria() = nombre.size()

	method hechizoPoderoso() = self.poderHechiceria() >= 15

}

object hechizoBasico {

	var property poderHechiceria = 10

	method hechizoPoderoso() = self.poderHechiceria() >= 15

}

object espadaDelDestino {

	method unidadesLucha() = 3

}

object collarDivino {

	var property cantidadDePerlas = 0

	method unidadesLucha() = cantidadDePerlas

}

object mascaraOscura {

	const unidadesLucha = 4

	method unidadesLucha() = unidadesLucha.max(rolando.fuerzaOscura() / 2)

}

class Armadura {

	var refuerzo
	const valorBase = 2

	constructor() {
		refuerzo = 0
	}

	constructor(_refuerzo) {
		refuerzo = _refuerzo.valorDeRefuerzo()
	}
	
	method refuerzo(_refuerzo) {
		refuerzo = _refuerzo.valorDeRefuerzo()
	}

	method unidadesLucha() = valorBase + refuerzo

}

object cotaDeMalla {

	method valorDeRefuerzo() = 1

}

object bendicion {

	method valorDeRefuerzo() = rolando.nivelHechiceria()

}

object hechizo {

	var property hechizoDeRefuerzo

	method valorDeRefuerzo() = hechizoDeRefuerzo.poderHechiceria()

}

object espejoFantastico {
	
	method unidadesLucha() {
		const artefactos = rolando.artefactos().copy()
		artefactos.remove(self)
		if(artefactos.isEmpty()) {
			return 0
		} else {
			return artefactos.map({ artefacto => artefacto.unidadesLucha() }).max()
		}	
	}

}

object libroDeHechizos {

	const hechizos = []

	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.hechizoPoderoso() })

	method hechizos() = hechizos

	method agregarHechizo(unHechizo) = hechizos.add(unHechizo)

	method agregarVariosHechizos(unosHechizos) = hechizos.addAll(unosHechizos)

	method quitarHechizo(unHechizo) = hechizos.remove(unHechizo)

	method poderHechiceria() = self.poderDeHechizosPoderosos()

	method poderDeHechizosPoderosos() = self.hechizosPoderosos().sum({ hechizoPoderoso => hechizoPoderoso.poderHechiceria() })

}

