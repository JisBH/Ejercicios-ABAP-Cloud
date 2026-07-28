CLASS zcl_maquina_chicles_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  METHODS:
   constructor importing iv_num_chicles type i,
   vender_chicle importing iv_moneda type i
   returning value(rv_cambio) type i,
   consultar_stock returning value(rv_stock) type i.

  PROTECTED SECTION.
  PRIVATE SECTION.

  DATA: chicles_restantes type i,
        precio type i.
ENDCLASS.



CLASS zcl_maquina_chicles_03 IMPLEMENTATION.

  METHOD constructor.
    me->chicles_restantes = iv_num_chicles.
    me->precio = 25.
  ENDMETHOD.

  METHOD vender_chicle.
    if iv_moneda >= me->precio AND me->chicles_restantes > 0.
        me->chicles_restantes -= 1.
        rv_cambio = iv_moneda - me->precio.

    else.
        rv_cambio = iv_moneda.
    endif.

  ENDMETHOD.

  METHOD consultar_stock.
    rv_stock = me->chicles_restantes.
  ENDMETHOD.

ENDCLASS.
