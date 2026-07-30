CLASS zcl_caseta_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_atraccion_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_nombre_caseta type string,
      pedir_rebujito RETURNING VALUE(rv_mensaje) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_caseta_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre_caseta ).
  ENDMETHOD.

  METHOD pedir_rebujito.
    rv_mensaje = 'Se ha pedido un rebujito'.
  ENDMETHOD.


ENDCLASS.
