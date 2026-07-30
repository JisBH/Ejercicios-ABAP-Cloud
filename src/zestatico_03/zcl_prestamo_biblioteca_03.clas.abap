CLASS zcl_prestamo_biblioteca_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS:
      consultar_total_prestamos RETURNING VALUE(rv_total_prestamos_realizados) TYPE i,
      consultar_pendientes RETURNING VALUE(rv_prestamos_pendientes) TYPE i.

    METHODS:
      constructor IMPORTING i_nombre TYPE string
                            i_titulo TYPE string,
      marcar_devuelto,
      consultar_datos EXPORTING o_nombre   TYPE string
                                o_titulo   TYPE string
                                o_devuelto TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: total_prestamos_realizados TYPE i,
                prestamos_pendientes       TYPE i.

    DATA: nombre_socio TYPE string,
          titulo_libro TYPE string,
          devuelto     TYPE abap_bool.
ENDCLASS.



CLASS zcl_prestamo_biblioteca_03 IMPLEMENTATION.

  METHOD constructor.
    me->nombre_socio = i_nombre.
    me->titulo_libro = i_titulo.
    me->devuelto = abap_false.
    total_prestamos_realizados += 1.
    prestamos_pendientes += 1.
  ENDMETHOD.

  METHOD consultar_datos.
    o_nombre = me->nombre_socio.
    o_titulo = me->titulo_libro.
    o_devuelto = me->devuelto.
  ENDMETHOD.

  METHOD consultar_pendientes.
    rv_prestamos_pendientes = prestamos_pendientes.
  ENDMETHOD.

  METHOD consultar_total_prestamos.
    rv_total_prestamos_realizados = total_prestamos_realizados.
  ENDMETHOD.

  METHOD marcar_devuelto.
    IF NOT me->devuelto.
      me->devuelto = abap_true.
      prestamos_pendientes -= 1.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
