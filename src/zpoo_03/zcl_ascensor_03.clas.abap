CLASS zcl_ascensor_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS:
  constructor importing iv_planta_max type i
                        iv_peso_max type i,

  entrar_peso importing iv_kilos type i.
  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA: planta_actual type i,
        planta_max type i,
        peso_max type i,
        peso_actual type i,
        bloqueado_sobrepeso type abap_bool.
ENDCLASS.



CLASS zcl_ascensor_03 IMPLEMENTATION.

  METHOD constructor.
    me->planta_max = iv_planta_max.
    me->peso_max = iv_planta_max.
    me->planta_actual = 0.
    me->peso_actual = 0.
    me->bloqueado_sobrepeso = abap_false.
  ENDMETHOD.

  METHOD entrar_peso.

  ENDMETHOD.

ENDCLASS.
