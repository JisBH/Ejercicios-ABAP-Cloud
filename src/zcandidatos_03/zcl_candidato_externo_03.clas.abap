CLASS zcl_candidato_externo_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_candidato_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING
                    iv_nombre      TYPE string
                    iv_experiencia TYPE i
                    iv_salario     TYPE decfloat34
                    iv_certif      TYPE i,

      calcular_idoneidad REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA num_certificaciones TYPE i.
ENDCLASS.



CLASS zcl_candidato_externo_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor(
      iv_nombre      = iv_nombre
      iv_experiencia = iv_experiencia
      iv_salario     = iv_salario
    ).

    me->num_certificaciones = iv_certif.
  ENDMETHOD.

  METHOD calcular_idoneidad.
    rv_idoneidad = ( anios_experiencia * '0.3' ) + ( num_certificaciones * '1.5' ).

    IF rv_idoneidad > 10.
      rv_idoneidad = 10.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
