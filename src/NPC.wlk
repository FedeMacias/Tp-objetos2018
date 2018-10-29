import Artefacto.*
import Excepciones.*
import Comerciante.*
import Personaje.*

class NPC inherits Personaje {

	var property dificultad = moderado

	override method habilidadDeLucha() = (self.valorLucha() + self.poderArtefactos()) * self.dificultad().multiplicador()

}

object facil {

	method multiplicador() = 1

}

object moderado {

	method multiplicador() = 2

}

object dificil {

	method multiplicador() = 4

}

