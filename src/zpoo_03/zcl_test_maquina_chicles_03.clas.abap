CLASS zcl_test_maquina_chicles_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_maquina_chicles_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_maquina_chicles) = new ZCL_MAQUINA_CHICLES_03( 20 ).

  out->write( lo_maquina_chicles->consultar_stock(  ) ).

  out->write( lo_maquina_chicles->vender_chicle( EXPORTING iv_moneda = 60 ) ).

  out->write( lo_maquina_chicles->consultar_stock(  ) ).

  out->write( lo_maquina_chicles->vender_chicle( EXPORTING iv_moneda = 15 ) ).

  out->write( lo_maquina_chicles->consultar_stock(  ) ).

  out->write( lo_maquina_chicles->vender_chicle( EXPORTING iv_moneda = 25 ) ).

  out->write( lo_maquina_chicles->consultar_stock(  ) ).
  ENDMETHOD.
ENDCLASS.
