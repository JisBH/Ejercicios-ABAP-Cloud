CLASS zcl_estatico_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS
      constructor IMPORTING i_saludo TYPE string.
    CLASS-METHODS
      consultar_contador RETURNING VALUE(rv_contador) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA contador TYPE i.
    DATA saludo TYPE string.
ENDCLASS.



CLASS ZCL_ESTATICO_03 IMPLEMENTATION.


  METHOD consultar_contador.
    rv_contador = contador.
  ENDMETHOD.


  METHOD constructor.
    saludo = i_saludo.
    contador += 1.
  ENDMETHOD.
ENDCLASS.
