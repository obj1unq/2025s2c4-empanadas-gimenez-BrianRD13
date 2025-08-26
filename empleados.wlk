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
  var sueldo = 0
  var empanadas = 0

  method ventaEmpanadas(cantidad) {
    empanadas = empanadas + cantidad
    sueldo= sueldo + (cantidad * 15)
  }

  method cobrarSueldo() = sueldo
}