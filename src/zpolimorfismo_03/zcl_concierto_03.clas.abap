CLASS zcl_concierto_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_atraccion_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_nombre_concierto type string,
      calcular_precio_entrada REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_concierto_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre_concierto ).
  ENDMETHOD.

  METHOD calcular_precio_entrada.
    IF consultar_visitantes(  ) < 500.
      rv_importe = 10.
    ELSE.
      rv_importe = 5.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
