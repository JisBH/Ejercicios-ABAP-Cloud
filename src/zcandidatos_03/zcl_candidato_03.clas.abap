CLASS zcl_candidato_03 DEFINITION
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING
                    iv_nombre      TYPE string
                    iv_experiencia TYPE i
                    iv_salario     TYPE decfloat34,

      get_nombre RETURNING VALUE(rv_nombre) TYPE string,

      calcular_idoneidad RETURNING VALUE(rv_idoneidad) TYPE decfloat34,

      anadir_puntos_entrevista IMPORTING iv_puntos TYPE i,

      obtener_idoneidad_final RETURNING VALUE(rv_idoneidad_final) TYPE i,

      comparar_con IMPORTING io_otro             TYPE REF TO zcl_candidato_03
                   RETURNING VALUE(rv_resultado) TYPE string,

      calcular_banda_salarial RETURNING VALUE(rv_banda) TYPE string.
  PROTECTED SECTION.
    DATA:
      id                    TYPE i,
      nombre_completo       TYPE string,
      anios_experiencia     TYPE i,
      dni                   TYPE string,
      telefono_personal     TYPE string,
      salario_actual        TYPE decfloat34,
      salario_pretendido    TYPE decfloat34,
      puntuacion_entrevista TYPE i VALUE 0.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_candidato_03 IMPLEMENTATION.


  METHOD constructor.
    me->nombre_completo    = iv_nombre.
    me->anios_experiencia  = iv_experiencia.
    me->salario_pretendido = iv_salario.
  ENDMETHOD.

  METHOD anadir_puntos_entrevista.
    puntuacion_entrevista += iv_puntos.
  ENDMETHOD.

  METHOD calcular_banda_salarial.

    DATA(lv_inferior) =  floor( salario_pretendido / 5000 ) * 5000.
    DATA(lv_superior) = ceil(  salario_pretendido / 5000 ) * 5000.

    IF lv_inferior = lv_superior.
      lv_superior = lv_inferior + 5000.
    ENDIF.

    rv_banda = |{ lv_inferior } - { lv_superior }|.
  ENDMETHOD.

  METHOD calcular_idoneidad.
    rv_idoneidad = anios_experiencia * '0.5'.

    IF rv_idoneidad > 10.
      rv_idoneidad = 10.
    ENDIF.
  ENDMETHOD.

  METHOD comparar_con.
    IF me->obtener_idoneidad_final(  ) > io_otro->obtener_idoneidad_final(  ).
      rv_resultado = me->nombre_completo.

    ELSEIF me->obtener_idoneidad_final(  ) < io_otro->obtener_idoneidad_final(  ).
      rv_resultado = io_otro->nombre_completo.

    ELSE.
      rv_resultado = 'EMPATE'.
    ENDIF.
  ENDMETHOD.

  METHOD obtener_idoneidad_final.
    DATA(lv_aux) = puntuacion_entrevista / 10.
    DATA(lv_total) = lv_aux + calcular_idoneidad(  ).
    rv_idoneidad_final = round( val = lv_total dec = 0 ).
  ENDMETHOD.

  METHOD get_nombre.
    rv_nombre = me->nombre_completo.
  ENDMETHOD.

ENDCLASS.
