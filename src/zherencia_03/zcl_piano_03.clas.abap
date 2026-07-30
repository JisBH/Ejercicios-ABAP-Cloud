CLASS zcl_piano_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_instrumento_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_marca_piano TYPE string
                            i_electrico   TYPE abap_bool,

      pedalear RETURNING VALUE(rv_exito) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA electrico TYPE abap_bool.
ENDCLASS.



CLASS zcl_piano_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_marca = i_marca_piano ).
    me->electrico = i_electrico.
  ENDMETHOD.

  METHOD pedalear.
    IF me->horas_uso >= 1.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
