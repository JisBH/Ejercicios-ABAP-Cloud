CLASS zcl_test_empleado_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_empleado_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lr_persona TYPE REF TO zcl_empleado_03.
    lr_persona = NEW zcl_programador_03( i_nombre_hija = 'Jesus' i_lenguaje = 'ABAP' ).

    IF lr_persona IS INSTANCE OF zcl_programador_03.
      out->write( 'Soy un programador' ).
      "lr_persona->obtener_lenguaje(  ). CLASE PADRE NO TIENE ESE MÉTODO
    ELSE.
      out->write( 'Soy otro tipo de empleado' ).
    ENDIF.

    DATA(lr_programador) = CAST zcl_programador_03( lr_persona ).

    out->write( |Lenguaje: { lr_programador->obtener_lenguaje( ) }| ).

  ENDMETHOD.
ENDCLASS.
