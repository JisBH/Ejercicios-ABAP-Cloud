CLASS zcl_test_chiringuitos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_test_chiringuitos_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    "Crear un chiringuito de bebidas
    DATA(lo_bebidas) = NEW zcl_chiringuito_bebidas_03( i_nombre = 'Chiringuito El Sol' ).
    out->write( '--- CHIRINGUITO DE BEBIDAS CREADO ---' ).

    "Intentar vender por 1,00€ (debe rechazarse)
    DATA(lv_exito) = lo_bebidas->vender_bebida( '1.0' ).
    IF lv_exito = abap_true.
      out->write( 'Venta de 1.00€: ACEPTADA (ERROR)' ).
    ELSE.
      out->write( 'Venta de 1.00€: RECHAZADA (Correcto, por debajo del minimo 1.50€)' ).
    ENDIF.

    "Vender por 3,5€ (debe aceptarse)
    lv_exito = lo_bebidas->vender_bebida( '3.5' ).
    IF lv_exito = abap_true.
      out->write( 'Venta de 3.50€: ACEPTADA (Correcto)' ).
    ELSE.
      out->write( 'Venta de 3.50€: RECHAZADA (ERROR)' ).
    ENDIF.

    "Consultar y mostrar recaudación y comisión (10%)
    out->write( |Recaudacion Bebidas: { lo_bebidas->consultar_recaudacion( ) } EUR| ).
    out->write( |Comision Ayuntamiento (10%): { lo_bebidas->calcular_comision_ayuntamiento( ) } EUR| ).

    out->write( '----------------------------------------' ).

    "Crear un alquiler de hamacas
    DATA(lo_hamacas) = NEW zcl_alquiler_hamacas_03( i_nombre = 'Hamacas La Brisa' ).
    out->write( '--- ALQUILER DE HAMACAS CREADO ---' ).



  ENDMETHOD.

ENDCLASS.
