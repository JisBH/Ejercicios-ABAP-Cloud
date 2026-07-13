CLASS zcl_insertar_datos_bd_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insertar_datos_bd_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_alumnos TYPE zalumnos_03.

    ls_alumnos-dni = '123456789'.
    ls_alumnos-edad = 24.
    ls_alumnos-id_curso = '123'.
    ls_alumnos-nivel = 'ME'.
    ls_alumnos-nombre = 'Jesus Bogarin'.

    INSERT zalumnos_03 FROM @ls_alumnos.
    IF sy-subrc = 0.
      out->write( 'Dato insertado' ).
    ELSE.
      out->write( 'Fallo al insertar' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
