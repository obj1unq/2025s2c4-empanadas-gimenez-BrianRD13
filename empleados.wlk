/* 
# 1 - Planteo inicial

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
# 2 - Qué hacen los empleados con lo que cobran

- Baigorria cuando cobra el sueldo lo suma a un acumulador de todo lo que cobró, agregarle la capacidad de entender el mensaje `totalCobrado()`.
  > empBaigorria.totalCobrado()
*/

/*
# 3 - Manejo fino de las finanzas de Galván

- Galván arranca con deuda en 0 y dinero en 0. Su sueldo (que aún no cobró) es de 15000.

- Galván gasta 4000, `deuda()` debe ser 4000, `dinero()` debe ser 0.
  > empGalvan.gastar(4000)

- Galván gasta otros 8000, `deuda()` pasa a 12000, `dinero()` sigue en 0.
  > empGalvan.gastar(8000)

- Galván cobra, con los 15000 que recibe paga toda su deuda y le sobran 3000 pesos. Por lo tanto, `deuda()` debe ser 0, y `dinero()` debe ser 3000.
  > gimenez.pagarSueldo(empGalvan)

- Galván gasta 25000, cubre 3000 con el dinero que tiene, el resto es deuda. `deuda()` queda en 22000, `dinero()` en 0.
  > empGalvan.gastar(25000)

- Galván cobra, tiene que dedicar los 15000 a pagar deudas, y no le alcanza. Ahora, `deuda()` pasa a 7000, y `dinero()` a 0.
  > gimenez.pagarSueldo(empGalvan)
*/

object gimenez {
  var fondoSueldos = 300000
  
  method pagarSueldo(empleado) {
    fondoSueldos = fondoSueldos - empleado.cobrarSueldo() 
  }
}

object empGalvan {
  var deuda = 0
  var dinero = 0
  var sueldo = 15000

  method gastar(cuanto) {
    deuda = deuda + (cuanto - dinero)
    dinero = (dinero - cuanto).max(0)
  }
  method sueldoNuevo(sueldoActualizado) {
    sueldo = sueldoActualizado
  }
  
  method cobrarSueldo() {
    const nuevaDeuda = deuda - sueldo
    const nuevoDinero = sueldo - deuda
    deuda = nuevaDeuda.max(0)
    dinero = nuevoDinero.max(0)

    return sueldo
  }
  method deuda() = deuda
  method dinero() = dinero
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