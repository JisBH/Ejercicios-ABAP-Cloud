CLASS zcl_habitacion_03 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS consultar_total_habitaciones RETURNING value(rv_total) type i.

  PROTECTED SECTION.
  DATA: lv_precio_noche type zdecimals2.

  PRIVATE SECTION.
  DATA:
  lv_numero_habitacion type string,

  lv_veces_reservada type i.

  CLASS-DATA total_habitaciones_creadas type i.

ENDCLASS.



CLASS zcl_habitacion_03 IMPLEMENTATION.
  METHOD consultar_total_habitaciones.
    rv_total = total_habitaciones_creadas.
  ENDMETHOD.

ENDCLASS.
