class Prenda {
	var property precio
	var property estado=nueva
	var property estaVendida=false

	method precioFinal()=estado.precioTotal(precio)
}

class Pantalon inherits Prenda{
	
}

class Saco inherits Prenda{
	
}

class Camisa inherits Prenda{
	
}

class Estado{
	method precioTotal(precioBase)
}

object nueva inherits Estado{
	override method precioTotal(precioBase)=precioBase
}

class Promocion inherits Estado{
	const valorFijo
	override method precioTotal(precioBase)=0.max(precioBase-valorFijo)
}

object liquidacion inherits Estado{
	override method precioTotal(precioBase)=precioBase*0.5
}

object macowins{
	const property ventas = []
	
	method registrarVenta(unaVenta){
		ventas.add(unaVenta)
	}
	
	method gananciasDelDia(unaFecha)=self.ventasDeUnDia(unaFecha).sum({unaVenta=>unaVenta.totalVenta()})
	
	method ventasDeUnDia(unaFecha)=ventas.filter({unaVenta=>unaVenta.mismaFecha(unaFecha)})
}

class Venta{
	const property prendasVendidas=[]
	var property cantidad  //No entendí bien que hay que hacer con la cantidad pero no quería dejar de ponerlo
	var property fecha
	var property metodoPago
	
	method mismaFecha(unaFecha)=unaFecha == fecha
	
	method totalVenta()= (prendasVendidas.sum({prendaVenta=>metodoPago.precioEnTotal(prendaVenta.precioFinal())}))
	
}

class Efectivo{
	method precioEnTotal(precio)=precio
}

class Tarjeta inherits Efectivo{
	var property cantidadCuotas
	var property coeficienteFijo
	
	override method precioEnTotal(precio)=super(precio) + self.recargo(precio*0.01)
	
	method recargo(valor)=cantidadCuotas*coeficienteFijo+valor
}

