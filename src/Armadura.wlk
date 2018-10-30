import Artefacto.*
import Excepciones.*
import Comerciante.*
import Personaje.*

class Armadura inherits Artefacto {

	var property refuerzoArmadura = refuerzoNulo
	const property valorBase = 2
	var property precio = 2

	method unidadesLucha() = self.valorBase() + self.refuerzo()

	method refuerzo() = self.refuerzoArmadura().valorDeRefuerzo()

	override method peso() = self.pesoInicial() - self.factorDeReduccion() + self.refuerzoArmadura().peso()

	override method precio() = self.precio() + self.refuerzoArmadura().precio()

// Consultar para conseguir el peso del hechizo de forma correcta
// Consultar para conseguir el precio de la armadura de la forma correcta
}

class CotaDeMalla {

	var property valorDeRefuerzo = 1

	method peso() = 1

	method precio() = self.valorDeRefuerzo() / 2

}

object refuerzoNulo {

	method valorDeRefuerzo() = 0

	method peso() = 0

	method precio() = 0

}

class Bendicion {

	var property duenio = new Personaje()

	method valorDeRefuerzo() = duenio.nivelHechiceria()

	method peso() = 0

	method precio() = self.duenio()

}