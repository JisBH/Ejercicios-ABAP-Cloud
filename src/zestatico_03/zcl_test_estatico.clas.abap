CLASS zcl_test_estatico DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_estatico IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_estatico) = NEW zcl_estatico_03( 'Soy el objeto 1' ).
    out->write( zcl_estatico_03=>consultar_contador(  ) ).
    DATA(lo_estatico2) = NEW zcl_estatico_03( 'Soy el objeto 2' ).
    out->write( zcl_estatico_03=>consultar_contador(  ) ).
  ENDMETHOD.
ENDCLASS.
