import Personaje.*
import Comerciante.*
import Excepciones.*

class Artefacto {

	var property duenio = new Personaje()
	var property pesoInicial = 0
	var property fechaDeCompra = new Date()
	const property fechaDeHoy = new Date()
	var property diasDeUso = self.fechaDeHoy() - self.fechaDeCompra()

	method factorDeReduccion() = ((self.diasDeUso()) / 1000).min(1)

	method peso() = self.pesoInicial() - self.factorDeReduccion()

	method precio()

	method vendeteA(unPersonaje) = unPersonaje.agregarArtefacto(self)

}

class ArmaAfilada inherits Artefacto {

	method unidadesLucha() = 3

	override method precio() = 5 * self.peso()

	override method peso() = self.pesoInicial() - self.factorDeReduccion()

}

class CollarDivino inherits Artefacto {

	var property cantidadDePerlas = 5

	method unidadesLucha() = self.cantidadDePerlas()

	override method precio() = 2 * self.cantidadDePerlas()

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + (self.cantidadDePerlas() * 0.5)

}

class MascaraOscura inherits Artefacto {

	var property unidadesLucha = 4
	var property indiceDeOscuridad = 1

	method unidadesLucha() = unidadesLucha.max(self.poderMascara())

	method poderMascara() = self.indiceDeOscuridad() * (fuerzaOscura.fuerzaOscura().div(2))

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + self.bonusMascara()

	method bonusMascara() = (self.poderMascara() - 3).max(0)

	override method precio() = self.indiceDeOscuridad() * 10

}

object fuerzaOscura {

	var property fuerzaOscura = 5

	method eclipse() = self.fuerzaOscura(self.fuerzaOscura() * 2)

}

object espejoFantastico inherits Artefacto {

	method unidadesLucha() {
		duenio.mejorArtefacto()
	}

	override method precio() = 90

}

object libroDeHechizos inherits Artefacto {

	const property hechizos = []

	override method peso() = 0

	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.hechizoPoderoso() })

	method hechizosPoderososSinLibro() = self.hechizosPoderosos().filter({ hechizo => hechizo != self })

	method agregarHechizo(unHechizo) = hechizos.add(unHechizo)

	method agregarVariosHechizos(unosHechizos) = hechizos.addAll(unosHechizos)

	method quitarHechizo(unHechizo) = hechizos.remove(unHechizo)

	method poderHechiceria() = self.poderDeHechizosPoderosos()

	method poderDeHechizosPoderosos() = self.hechizosPoderososSinLibro().sum({ hechizosPoderososSinLibro => hechizosPoderososSinLibro.poderHechiceria() })

	override method precio() = (10 * self.hechizos().size()) + self.poderDeHechizosPoderosos()

}

