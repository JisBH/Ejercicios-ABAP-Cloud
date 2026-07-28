CLASS zcl_aparcamiento_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES ty_precio TYPE p LENGTH 9 DECIMALS 2.

    METHODS:
      calcular_tarifa IMPORTING iv_horas_estacionado TYPE i
                      EXPORTING ev_minutos_totales   TYPE i
                      RETURNING VALUE(rv_precio)     TYPE ty_precio.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aparcamiento_03 IMPLEMENTATION.
  METHOD calcular_tarifa.
    ev_minutos_totales = iv_horas_estacionado * 60.
    rv_precio = iv_horas_estacionado * 5.
  ENDMETHOD.

ENDCLASS.
