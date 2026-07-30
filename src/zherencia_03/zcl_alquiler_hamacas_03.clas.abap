CLASS zcl_alquiler_hamacas_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_chiringuitos_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      calcular_comision_ayuntamiento REDEFINITION,
      reservar_sombrilla IMPORTING i_num_sombrilla TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: num_sombrilla TYPE i.
ENDCLASS.



CLASS zcl_alquiler_hamacas_03 IMPLEMENTATION.

  METHOD calcular_comision_ayuntamiento.
    rv_importe = me->dinero * '0.2'.
  ENDMETHOD.

  METHOD reservar_sombrilla.
    me->num_sombrilla = i_num_sombrilla.
  ENDMETHOD.

ENDCLASS.
