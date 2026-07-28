CLASS zcl_test_mascota_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_mascota_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_mascota) = NEW zcl_mascota_03(  ).
    DATA: energia TYPE i,
          lleno   TYPE i.

    lo_mascota->consultar_estado( IMPORTING ov_energia = energia
                                            ov_lleno = lleno ).
    out->write( |Energia: { energia } lleno: { lleno }| ).

    DO 10 TIMES.
      out->write( 'Voy a comer' ).
      lo_mascota->comer(  ).
      lo_mascota->consultar_estado( IMPORTING ov_energia = energia
                                              ov_lleno = lleno ).
      out->write( |Energia: { energia } lleno: { lleno }| ).
    ENDDO.

    DO 10 TIMES.
      out->write( 'Voy a jugar' ).
      lo_mascota->jugar(  ).
      lo_mascota->consultar_estado( IMPORTING ov_energia = energia
                                              ov_lleno = lleno ).
      out->write( |Energia: { energia } lleno: { lleno }| ).
    ENDDO.
  ENDMETHOD.
ENDCLASS.
