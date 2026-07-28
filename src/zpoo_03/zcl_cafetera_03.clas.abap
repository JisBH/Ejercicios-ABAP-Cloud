CLASS zcl_cafetera_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING i_num TYPE i,
      preparar_cafe,
      consultar_agua RETURNING VALUE(rv_agua) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA cantidad_agua TYPE i.
ENDCLASS.



CLASS zcl_cafetera_03 IMPLEMENTATION.

  METHOD constructor.
    me->cantidad_agua = i_num.
  ENDMETHOD.

  METHOD consultar_agua.
    rv_agua = me->cantidad_agua.
  ENDMETHOD.

  METHOD preparar_cafe.
    IF me->cantidad_agua >= 250.
      me->cantidad_agua -= 250.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
