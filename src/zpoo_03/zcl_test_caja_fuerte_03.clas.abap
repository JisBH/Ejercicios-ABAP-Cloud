CLASS zcl_test_caja_fuerte_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_caja_fuerte_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_caja_fuerte) = NEW zcl_caja_fuerte_03( '1234' ).

    out->write( |La caja esta: { lo_caja_fuerte->esta_bloqueada( ) }| ).

    DATA(lv_resultado) = lo_caja_fuerte->abrir( EXPORTING iv_cod_introducido = '456' ).
    out->write( |El resultado de abrir es: { lv_resultado }| ).
    out->write( |La caja esta bloqueada? { lo_caja_fuerte->esta_bloqueada(  ) }| ).

    DATA(lv_cambio) = lo_caja_fuerte->cambiar_contrasenha( EXPORTING iv_cod_antiguo = '1111'
                                                                     iv_cod_nuevo = '9999' ).
    out->write( |Se ha realizado el cambio de contrasenha? { lv_cambio }| ).

    lv_resultado = lo_caja_fuerte->abrir( EXPORTING iv_cod_introducido = '456' ).
    out->write( |El resultado de abrir es: { lv_resultado }| ).
    out->write( |La caja esta bloqueada? { lo_caja_fuerte->esta_bloqueada(  ) }| ).

    lv_cambio = lo_caja_fuerte->cambiar_contrasenha( EXPORTING iv_cod_antiguo = '1234'
                                                               iv_cod_nuevo = '456' ).
    out->write( |Se ha realizado el cambio de contrasenha? { lv_cambio }| ).

    lv_resultado = lo_caja_fuerte->abrir( EXPORTING iv_cod_introducido = '456' ).
    out->write( |El resultado de abrir es: { lv_resultado }| ).
    out->write( |La caja esta bloqueada? { lo_caja_fuerte->esta_bloqueada(  ) }| ).
*
*  lv_resultado = lo_caja_fuerte->abrir( EXPORTING iv_cod_introducido = '456' ).
*  out->write( |El resultado de abrir es: { lv_resultado }| ).
*  out->write( |La caja esta bloqueada? { lo_caja_fuerte->esta_bloqueada(  ) }| ).
*
*  lv_resultado = lo_caja_fuerte->abrir( EXPORTING iv_cod_introducido = '456' ).
*  out->write( |El resultado de abrir es: { lv_resultado }| ).
*  out->write( |La caja esta bloqueada? { lo_caja_fuerte->esta_bloqueada(  ) }| ).
  ENDMETHOD.
ENDCLASS.
