import Artefacto.*
import FeriaHechiceria.*

class Personaje {

	var property valorBase = 3
	var property valorLucha = 1
	var property hechizoFavorito
	var property monedasOro = 100
	const artefactos = []

	method artefactos() = artefactos

	method agregarArtefacto(unArtefacto) = self.artefactos().add(unArtefacto)

	method agregarVariosArtefactos(unosArtefactos) = self.artefactos().addAll(unosArtefactos)

	method quitarArtefacto(unArtefacto) = self.artefactos().remove(unArtefacto)

	method quitarTodoArtefacto() = self.artefactos().clear()

	method nivelHechiceria() = ( self.valorBase() * self.hechizoFavorito().poderHechiceria() ) + fuerzaOscura.fuerzaOscura()

	method habilidadDeLucha() = self.valorLucha() + self.poderArtefactos()

	method poderArtefactos() = self.artefactos().sum({ artefacto => artefacto.unidadesLucha() })

	method sosPoderoso() = self.hechizoFavorito().hechizoPoderoso()

	method sosMejorLuchadorQueHechicero() = self.habilidadDeLucha() > self.nivelHechiceria()

	method estaCargado() = self.artefactos().size() >= 5
	
	method ganarMonedas(unasMonedas){
		self.monedasOro(self.monedasOro()+ unasMonedas)
	}
	
	method quitarMonedas(unasMonedas) {
		
		self.monedasOro((self.monedasOro()- unasMonedas).max(0))
	}
	
	method cumplirObjetivo(){
		self.ganarMonedas(10)
	}

}

object fuerzaOscura {

	var property fuerzaOscura = 5

	method eclipse() = self.fuerzaOscura(self.fuerzaOscura() * 2)

}

class Logo {

	var property nombre = ""
	var property multiplicador = 1

	method poderHechiceria() = self.nombre().size() * self.multiplicador()

	method hechizoPoderoso() = self.poderHechiceria() >= 15

	method valorDeRefuerzo() = self.poderHechiceria()
	
	method precio() = self.poderHechiceria()

}

class HechizoBasico {

	var property poderHechiceria = 10
	var property precio = 10

	method hechizoPoderoso() = self.poderHechiceria() >= 15

	method valorDeRefuerzo() = self.poderHechiceria()
	
	method precio() = 10

}

