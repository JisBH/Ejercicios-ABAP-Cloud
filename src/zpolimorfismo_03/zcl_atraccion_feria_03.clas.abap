CLASS zcl_atraccion_feria_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_atraccion_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_nombre_atraccion_feria type string
                            i_precio TYPE zdecimals_03,
      calcular_precio_entrada REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA precio_atraccion TYPE zdecimals_03.
ENDCLASS.



CLASS zcl_atraccion_feria_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre_atraccion_feria ).
    me->precio_atraccion = i_precio.
  ENDMETHOD.

  METHOD calcular_precio_entrada.
    rv_importe = precio_atraccion.
  ENDMETHOD.



ENDCLASS.
