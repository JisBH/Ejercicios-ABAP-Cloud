CLASS zcl_atraccion_03 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_nombre TYPE string,
      recibir_visitante,
      calcular_precio_entrada RETURNING VALUE(rv_importe) TYPE zdecimals_03,
      consultar_visitantes RETURNING VALUE(rv_num_visitantes) TYPE i,
      consultar_nombre RETURNING VALUE(rv_nombre) TYPE string.
  PROTECTED SECTION.
    DATA: nombre         TYPE string,
          num_visitantes TYPE i.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atraccion_03 IMPLEMENTATION.

  METHOD constructor.
    me->nombre = i_nombre.
    me->num_visitantes = 0.
  ENDMETHOD.

  METHOD calcular_precio_entrada.
    rv_importe = 0.
  ENDMETHOD.

  METHOD consultar_visitantes.
    rv_num_visitantes = me->num_visitantes.
  ENDMETHOD.

  METHOD recibir_visitante.
    me->num_visitantes += 1.
  ENDMETHOD.

  METHOD consultar_nombre.
    rv_nombre = me->nombre.
  ENDMETHOD.

ENDCLASS.
