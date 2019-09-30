class Dependencia{
	var flota = []
	var property empleado
		
	method agregarFlota(rodado){flota.add(rodado)}
	method quitarFlota(rodado){flota.remove(rodado)}
	method pesoTotalFlota(){return flota.sum({rodado => rodado.peso()})}
	method estaBienEquipado(){return flota.size() >= 3 and flota.all({rodado => rodado.velocidadMaxima() > 100})}
	method capacidadTotalEnColor(color){
		var flotaAux = flota.filter({rodado => rodado.color() == color})
		return flotaAux.sum({rodado => rodado.capacidad()})
	}
	method colorDelRodadoMasRapido(){return flota.max({rodado => rodado.velocidadMaxima()}).color()}
	method capacidadFaltante(){return empleado - (flota.sum({rodado => rodado.capacidad()}))}
	method esGrande(){return empleado >= 40 and flota.size() >= 5}
}

class Corsa{
	var property color = null
	
	method capacidad(){return 4}
	method velocidadMaxima(){return 150}
	method peso(){return 1300}
}

class Kwid{
	var property tieneTanqueAdicional 
	method capacidad(){return if(tieneTanqueAdicional){3}else{4}}
	method velocidadMaxima(){return if(tieneTanqueAdicional){120}else{110}}
	method peso(){return if(tieneTanqueAdicional){1350}else{1200}}
	method color(){return azul}
}
object trafic{
	var property motor = null
	var property interior = null
	
	method capacidad(){return interior.capacidad()}
	method velocidadMaxima(){return motor.velocidadMaxima()}
	method peso(){return 4000 + motor.peso() + interior.peso()}
	method color(){return blanco}
}
object interiorComodo{
	method capacidad(){return 5}
	method peso(){return 700}
}
object interiorPopular{
	method capacidad(){return 12}
	method peso(){return 1000}
}
object motorPulente{
	method peso(){return 800}
	method velocidadMaxima(){return 130}
}
object motorBataton{
	method peso(){return 500}
	method velocidadMaxima(){return 80}
}
class AutoEspecial{
	var property peso
	var property capacidad
	var property velocidadMaxima
	var property color
}

object azul{}
object rojo{}
object verde{}
object blanco{}
object beige{}