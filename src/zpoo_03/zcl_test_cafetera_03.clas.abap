CLASS zcl_test_cafetera_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_cafetera_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_cafetera) = new zcl_cafetera_03( 600 ).

  DO 3 TIMES.
    lo_cafetera->preparar_cafe(  ).
    out->write( |Después del café quedan { lo_cafetera->consultar_agua(  ) }| ).
  ENDDO.

  ENDMETHOD.
ENDCLASS.
