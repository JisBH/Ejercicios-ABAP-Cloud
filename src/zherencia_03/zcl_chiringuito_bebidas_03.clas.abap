CLASS zcl_chiringuito_bebidas_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_chiringuitos_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      vender_bebida  IMPORTING i_importe       TYPE ZDECIMALS_03
                     RETURNING VALUE(rv_exito) TYPE abap_bool,
      anadir_hielo.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_chiringuito_bebidas_03 IMPLEMENTATION.

  METHOD anadir_hielo.

  ENDMETHOD.

  METHOD vender_bebida.
    IF i_importe >= '1.5'.
      vender( i_importe ).
      rv_exito = abap_true.
    ENDIF.
    rv_exito = abap_false.
  ENDMETHOD.

ENDCLASS.
