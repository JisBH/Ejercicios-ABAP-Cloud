CLASS zcl_habitacion_suite_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_habitacion_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces zif_describible_03.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_habitacion_suite_03 IMPLEMENTATION.
  METHOD zif_describible_03~describir.

  ENDMETHOD.

ENDCLASS.
