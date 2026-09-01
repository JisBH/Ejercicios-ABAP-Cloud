CLASS zcl_empleado_03 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  methods:
  constructor importing i_nombre type string,
  obtener_nombre RETURNING VALUE(rv_nombre) type string.
  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA nombre TYPE string.
ENDCLASS.



CLASS zcl_empleado_03 IMPLEMENTATION.

  METHOD constructor.
    me->nombre = i_nombre.
  ENDMETHOD.

  METHOD obtener_nombre.
    rv_nombre = me->nombre.
  ENDMETHOD.



ENDCLASS.
