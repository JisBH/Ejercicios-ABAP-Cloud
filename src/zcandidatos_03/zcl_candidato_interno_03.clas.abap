CLASS zcl_candidato_interno_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_candidato_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING
                    iv_nombre      TYPE string
                    iv_experiencia TYPE i
                    iv_salario     TYPE decfloat34,

      calcular_idoneidad REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS puntuacion_base_interna TYPE i VALUE 5.
ENDCLASS.



CLASS zcl_candidato_interno_03 IMPLEMENTATION.

  METHOD calcular_idoneidad.
    rv_idoneidad = ( anios_experiencia * '0.6' ) + ( puntuacion_base_interna * '0.4' ).

    IF rv_idoneidad > 10.
      rv_idoneidad = 10.
    ENDIF.
  ENDMETHOD.

  METHOD constructor.

    super->constructor(
      iv_nombre      = iv_nombre
      iv_experiencia = iv_experiencia
      iv_salario     = iv_salario
    ).

  ENDMETHOD.

ENDCLASS.
