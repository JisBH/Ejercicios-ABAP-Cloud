CLASS zcl_test_deposito_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_deposito_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(lo_deposito) = NEW zcl_deposito_03( 1000 ).

    lo_deposito->repostar_deposito( 700 ).
    out->write( |Nivel del deposito: { lo_deposito->consultar_nivel(  ) }| ).

    lo_deposito->repostar_deposito( 500 ).
    out->write( |Nivel del deposito: { lo_deposito->consultar_nivel(  ) }| ).

    data(lv_exito) = lo_deposito->despachar_combustible( 200 ).
    out->write( |Resultado de la operacion: { lv_exito }| ).

    lv_exito = lo_deposito->despachar_combustible( 5000 ).
    out->write( |Resultado de la operacion: { lv_exito }| ).

    out->write( |Nivel del deposito: { lo_deposito->consultar_nivel(  ) }| ).
  ENDMETHOD.

ENDCLASS.
