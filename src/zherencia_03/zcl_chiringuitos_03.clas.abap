CLASS zcl_chiringuitos_03 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_nombre TYPE string,
      vender IMPORTING i_importe       TYPE ZDECIMALS_03,
      calcular_comision_ayuntamiento RETURNING VALUE(rv_importe) TYPE ZDECIMALS_03,
      consultar_recaudacion RETURNING VALUE(rv_dinero) TYPE ZDECIMALS_03.
  PROTECTED SECTION.
    DATA: nombre TYPE string,
          dinero TYPE ZDECIMALS_03.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_chiringuitos_03 IMPLEMENTATION.

  METHOD constructor.
    me->nombre = i_nombre.
    me->dinero = 0.
  ENDMETHOD.

  METHOD calcular_comision_ayuntamiento.
    rv_importe = me->dinero * '0.1'.
  ENDMETHOD.

  METHOD consultar_recaudacion.
    rv_dinero = me->dinero.
  ENDMETHOD.

  METHOD vender.
    IF i_importe > 0.
      me->dinero += i_importe.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
