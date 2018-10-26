import Personaje.*

class Artefacto {

	var property duenio = new Personaje()
	var property pesoInicial = 1
	var property fechaDeCompra = new Date(1, 1, 1)
	const property fechaDeHoy = new Date()

	method factorDeReduccion() = ((self.fechaDeHoy() - self.fechaDeCompra()) / 1000).min(1)
	
	method peso() = self.pesoInicial()

}

class ArmaAfilada inherits Artefacto {

	method unidadesLucha() = 3

	method precio() = 5 * self.peso()

}

class CollarDivino inherits Artefacto {

	var property cantidadDePerlas = 0

	method unidadesLucha() = self.cantidadDePerlas()

	method precio() = 2 * self.cantidadDePerlas()

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + (self.cantidadDePerlas() * 0.5)

}

class MascaraOscura inherits Artefacto {

	var property unidadesLucha = 4
	var property indiceDeOscuridad = 1

	method unidadesLucha() = unidadesLucha.max(self.poderMascara())

	method poderMascara() = self.indiceDeOscuridad() * (fuerzaOscura.fuerzaOscura().div(2))

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + self.bonusMascara()

	method bonusMascara() = (self.poderMascara() - 3).max(0)
	
	method precio() = self.indiceDeOscuridad()*10 

}

object espejoFantastico inherits Artefacto {

	method unidadesLucha() {
		duenio.mejorArtefacto()
	}

	method precio() = 90

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

	method precio() = (10 * self.hechizos().size()) + self.poderDeHechizosPoderosos()

}

class Armadura inherits Artefacto {

	var property refuerzoArmadura = refuerzoNulo
	const property valorBase = 2

	method unidadesLucha() = self.valorBase() + self.refuerzo()

	method refuerzo() = self.refuerzoArmadura().valorDeRefuerzo()

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + self.refuerzoArmadura().peso()
	//Consultar para conseguir el peso del hechizo de forma correcta
}

class CotaDeMalla {

	var property valorDeRefuerzo = 1

	method peso() = 1

}

object refuerzoNulo {

	method valorDeRefuerzo() = 0

	method peso() = 0

}

class Bendicion {

	var duenio = new Personaje()

	method valorDeRefuerzo() = duenio.nivelHechiceria()

	method peso() = 0

}

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
		} else return 1
	}

}

class HechizoComercial inherits Logo {

	var property porcentaje = 0.2

	override method poderHechiceria() = self.nombre().size() * self.porcentaje() * self.multiplicador()

}

class HechizoBasico inherits Logo{

	override method poderHechiceria() = 10


}

