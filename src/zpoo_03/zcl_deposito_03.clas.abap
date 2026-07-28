CLASS zcl_deposito_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING i_capacidad TYPE i,
      repostar_deposito IMPORTING i_litros TYPE i,
      despachar_combustible IMPORTING i_litros        TYPE i
                            RETURNING VALUE(rv_exito) TYPE abap_bool,
      consultar_nivel RETURNING VALUE(rv_litros) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: litros_actuales  TYPE i,
          capacidad_maxima TYPE i.
ENDCLASS.



CLASS zcl_deposito_03 IMPLEMENTATION.

  METHOD constructor.
    me->litros_actuales = 0.
    me->capacidad_maxima = i_capacidad.
  ENDMETHOD.

  METHOD consultar_nivel.
    rv_litros = me->litros_actuales.
  ENDMETHOD.

  METHOD despachar_combustible.
    IF me->litros_actuales - i_litros > 0.
      me->litros_actuales -= i_litros.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.

    ENDIF.
  ENDMETHOD.

  METHOD repostar_deposito.
    IF me->litros_actuales + i_litros > me->capacidad_maxima.
      me->litros_actuales = me->capacidad_maxima.
    ELSE.
      me->litros_actuales += i_litros.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
