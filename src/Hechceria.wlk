
object rolando {
	var valorBase = 3
	var fuerzaOscura = 5
	var hechizoFavorito

	method valorBase() = valorBase
	method valorBase(nuevoValorBase) {
		valorBase = nuevoValorBase
	}
	method fuerzaOscura() = fuerzaOscura
	method fuerzaOscura(nuevaFuerzaOscura) {
		fuerzaOscura = nuevaFuerzaOscura
	}
	method hechizoFavorito() = hechizoFavorito
	method hechizoFavorito(nuevoHechizoFavorito) {
		hechizoFavorito = nuevoHechizoFavorito
	}

	method nivelHechiceria() = ( valorBase * hechizoFavorito ) + fuerzaOscura
}