import Artefacto.*
import Excepciones.*
import Comerciante.*
import Personaje.*

class Armadura inherits Artefacto {

	var property refuerzoArmadura = refuerzoNulo
	const property valorBase = 2
	var property precioBase = 2

	method unidadesLucha() = self.valorBase() + self.refuerzo()

	method refuerzo() = self.refuerzoArmadura().valorDeRefuerzo()

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + self.refuerzoArmadura().peso()

	override method precio() = self.precioBase() + self.refuerzoArmadura().precio()

}

class CotaDeMalla inherits Armadura {

	var property valorDeRefuerzo = 1

	override method peso() = 1

	override method precio() = self.valorDeRefuerzo() / 2 - self.precioBase()

}

object refuerzoNulo {

	method valorDeRefuerzo() = 0

	method peso() = 0

	method precio() = 0

}

class Bendicion inherits Armadura{

	method valorDeRefuerzo() = duenio.nivelHechiceria()

	override method peso() = 0

	override method precio() = 0

}