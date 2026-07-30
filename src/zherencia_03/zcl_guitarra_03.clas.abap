CLASS zcl_guitarra_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_instrumento_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_marca_guitarra TYPE string
                            i_num_cuerdas    TYPE i,

      afinar_cuerda IMPORTING i_num_cuerdas   TYPE i
                    RETURNING VALUE(rv_exito) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA num_cuerdas TYPE i.
ENDCLASS.



CLASS zcl_guitarra_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_marca = i_marca_guitarra ).
    me->num_cuerdas = i_num_cuerdas.
  ENDMETHOD.

  METHOD afinar_cuerda.
    IF i_num_cuerdas > 0 AND i_num_cuerdas <= me->num_cuerdas.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
