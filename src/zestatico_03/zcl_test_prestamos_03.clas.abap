CLASS zcl_test_prestamos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_prestamos_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "Paso 1
    out->write( |Total prestamos: { zcl_prestamo_biblioteca_03=>consultar_total_prestamos(  ) }| ).
    out->write( |Prestamos pendientes: { zcl_prestamo_biblioteca_03=>consultar_pendientes(  ) }\n| ).

    "Paso 2
    DATA(lo_prestamo1) = NEW zcl_prestamo_biblioteca_03( i_nombre = 'Juan' i_titulo = 'La comedia magica' ).
    DATA(lo_prestamo2) = NEW zcl_prestamo_biblioteca_03( i_nombre = 'Pedro' i_titulo = 'Tragicos sucesos' ).
    DATA(lo_prestamo3) = NEW zcl_prestamo_biblioteca_03( i_nombre = 'Jesus' i_titulo = 'Demsiado rapido' ).

    "Paso 3
    lo_prestamo1->consultar_datos( IMPORTING o_devuelto = DATA(lv_devuelto)
                                              o_nombre = DATA(lv_nombre)

                                              o_titulo = DATA(lv_titulo) ).
    out->write( |Nombre del cliente: { lv_nombre }| ).
    out->write( |Titulo del libro: { lv_titulo }| ).

    IF lv_devuelto.
      out->write( |Ha devuelto el libro \n| ).
    ELSE.
      out->write( |No ha devuelto el libro \n| ).
    ENDIF.

    "Paso 4
    out->write( |Total prestamos: { zcl_prestamo_biblioteca_03=>consultar_total_prestamos(  ) }| ).
    out->write( |Prestamos pendientes: { zcl_prestamo_biblioteca_03=>consultar_pendientes(  ) }\n| ).

    "Paso 5
    lo_prestamo1->marcar_devuelto(  ).

    "Paso 6
    out->write( |Total prestamos: { zcl_prestamo_biblioteca_03=>consultar_total_prestamos(  ) }| ).
    out->write( |Prestamos pendientes: { zcl_prestamo_biblioteca_03=>consultar_pendientes(  ) }\n| ).
  ENDMETHOD.
ENDCLASS.
