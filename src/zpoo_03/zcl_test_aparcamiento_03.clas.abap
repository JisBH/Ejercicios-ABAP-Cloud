CLASS zcl_test_aparcamiento_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_aparcamiento_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_minutos TYPE i.
    DATA(lo_aparcamiento) = NEW zcl_aparcamiento_03( ).

    DATA(lv_precio) = lo_aparcamiento->calcular_tarifa(
    EXPORTING iv_horas_estacionado = 3
    IMPORTING ev_minutos_totales = lv_minutos ).

    out->write( |El precio es: { lv_precio } y los minutos son: { lv_minutos }| ).


  ENDMETHOD.
ENDCLASS.
