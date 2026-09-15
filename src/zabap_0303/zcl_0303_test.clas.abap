CLASS zcl_0303_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_0303_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(lo_0303) = new zcl_0303_connections(  ).
  out->write( lo_0303->get_connections( 'SFO' ) ).

  ENDMETHOD.
ENDCLASS.
