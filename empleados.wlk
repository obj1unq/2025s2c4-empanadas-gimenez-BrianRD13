/* 
## Planteo inicial

- registrar la venta de 500 empanadas por parte de Baigorria
  > empBaigorria.ventaEmpanadas(500)
- cambiar el sueldo de Galván a 20000
  > empGalvan.sueldoNuevo(20000)
- registrar la venta de otras 300 empanadas por parte de Baigorria
  > empBaigorria.ventaEmpanadas(300)
- que Giménez le pague el sueldo a Baigorria
  > gimenez.pagarSueldo(empBaigorria)
- finalmente, que Giménez le pague el sueldo a Galván
  > gimenez.pagarSueldo(empGalvan)

Entonces el sueldo de Baigorria es 12000, y el fondo de Galván tiene 268000 pesos.
*/

/*
## Qué hacen los empleados con lo que cobran

- Baigorria cuando cobra el sueldo lo suma a un acumulador de todo lo que cobró, agregarle la capacidad de entender el mensaje `totalCobrado()`.
  > empBaigorria.totalCobrado()
*/

object gimenez {
  var fondoSueldos = 300000
  method pagarSueldo(empleado) {
    fondoSueldos = fondoSueldos - empleado.cobrarSueldo() 
  }
}

object empGalvan {
  var sueldo = 15000

  method sueldoNuevo(sueldoActualizado) {
    sueldo = sueldoActualizado
  }
  
  method cobrarSueldo() = sueldo 
}

object empBaigorria {
  var empanadas = 0
  var cobrado = 0

  method ventaEmpanadas(cantidad) {
    empanadas = empanadas + cantidad
  }
  method cobrarSueldo() {
    const sueldo = empanadas * 15
    cobrado = cobrado + sueldo
    empanadas = 0
    return sueldo
  }

  method totalCobrado() = cobrado 
}