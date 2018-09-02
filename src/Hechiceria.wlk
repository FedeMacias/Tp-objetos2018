object rolando {

	var valorBase = 3
	var fuerzaOscura = 5
	var hechizoFavorito
	var valorLucha = 1
	const artefactos = []

	method valorBase() = valorBase

	method valorBase(nuevoValorBase) {
		valorBase = nuevoValorBase
	}

	method valorLucha() = valorLucha

	method valorLucha(nuevoValor) {
		valorLucha = nuevoValor
	}

	method artefactos() = artefactos

	method agregarArtefacto(unArtefacto) = artefactos.add(unArtefacto)

	method agregarVariosArtefactos(unosArtefactos) = artefactos.addAll(unosArtefactos)

	method quitarArtefacto(unArtefacto) = artefactos.remove(unArtefacto)

	method fuerzaOscura() = fuerzaOscura

	method fuerzaOscura(nuevaFuerzaOscura) {
		fuerzaOscura = nuevaFuerzaOscura
	}

	method hechizoFavorito() = hechizoFavorito

	method hechizoFavorito(nuevoHechizoFavorito) {
		hechizoFavorito = nuevoHechizoFavorito
	}

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

	var nombre = "Espectro malefico"

	method nombre() = nombre

	method nombre(nuevoNombre) {
		nombre = nuevoNombre
	}

	method poderHechiceria() = nombre.size()

	method hechizoPoderoso() = self.poderHechiceria() >= 15

}

object hechizoBasico {

	var poderHechiceria = 10

	method poderHechiceria() = poderHechiceria

	method poder(nuevoPoder) {
		poderHechiceria = nuevoPoder
	}

	method hechizoPoderoso() = self.poderHechiceria() >= 15

}

object espadaDelDestino {

	var unidadesLucha = 3

	method unidadesLucha() = unidadesLucha

	method unidadesLucha(nuevasUnidadesLucha) {
		unidadesLucha = nuevasUnidadesLucha
	}

}

object collarDivino {

	var cantidadDePerlas

	method cantidadDePerlas() = cantidadDePerlas

	method cantidadDePerlas(nuevaCantidadPerlas) {
		cantidadDePerlas = nuevaCantidadPerlas
	}

	method unidadesLucha() = cantidadDePerlas

}

object mascaraOscura {

	const unidadesLucha = 4

	method unidadesLucha() = unidadesLucha.max(rolando.fuerzaOscura() / 2)

}

class Armadura {

	var valorBase = 2
	var refuerzo

	method valorBase() = valorBase

	method valorBase(nuevoValorBase) {
		valorBase = nuevoValorBase
	}

	method refuerzo() = refuerzo

	method refuerzo(nuevoRefuerzo) {
		refuerzo = nuevoRefuerzo
	}

	method unidadesLucha() = valorBase + refuerzo.valorDeRefuerzo()

}

object cotaDeMalla {

	var valorDeRefuerzo = 1

	method valorDeRefuerzo() = valorDeRefuerzo

	method valorDeRefuerzo(nuevoValorDeRefuerzo) {
		valorDeRefuerzo = nuevoValorDeRefuerzo
	}

}

object bendicion {

	method valorDeRefuerzo() = rolando.nivelHechiceria()

}

object hechizo {

	var hechizoDeRefuerzo

	method hechizoDeRefuerzo() = hechizoDeRefuerzo

	method hechizoDeRefuerzo(nuevoHechizo) {
		hechizoDeRefuerzo = nuevoHechizo
	}

	method valorDeRefuerzo() = hechizoDeRefuerzo.poderHechiceria()

}

object ninguno {

	const valorDeRefuerzo = 0

	method valorDeRefuerzo() = valorDeRefuerzo

}

object espejoFantastico {

	method unidadesLucha() = if (rolando.artefactos().size() == 1) {
		return 0
	} else return rolando.artefactos().max({ artefacto => artefacto.unidadesLucha() })

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

