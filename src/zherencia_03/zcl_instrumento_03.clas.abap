CLASS zcl_instrumento_03 DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_marca TYPE string,
      registrar_practica IMPORTING i_horas TYPE i,
      consultar_horas_uso RETURNING VALUE(rv_horas) TYPE i.

  PROTECTED SECTION.
    DATA: marca     TYPE string,
          horas_uso TYPE i.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_instrumento_03 IMPLEMENTATION.

  METHOD constructor.
    me->horas_uso = 0.
    me->marca = i_marca.
  ENDMETHOD.

  METHOD registrar_practica.
    me->horas_uso += i_horas.
  ENDMETHOD.

  METHOD consultar_horas_uso.
    rv_horas = me->horas_uso.
  ENDMETHOD.

ENDCLASS.
