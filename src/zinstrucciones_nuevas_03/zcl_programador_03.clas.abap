CLASS zcl_programador_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING
                    i_nombre_hija TYPE string
                    i_lenguaje    TYPE string,
      obtener_lenguaje RETURNING VALUE(rv_lenguaje) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA lenguaje TYPE string.
ENDCLASS.



CLASS zcl_programador_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre_hija ).
    me->lenguaje = i_lenguaje.
  ENDMETHOD.

  METHOD obtener_lenguaje.
    rv_lenguaje = me->lenguaje.
  ENDMETHOD.

ENDCLASS.
