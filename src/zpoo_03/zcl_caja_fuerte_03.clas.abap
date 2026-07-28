CLASS zcl_caja_fuerte_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING iv_cod_apertura TYPE string,

      abrir IMPORTING iv_cod_introducido TYPE string
            RETURNING VALUE(rv_abierta)  TYPE abap_bool,

      esta_bloqueada RETURNING VALUE(rv_bloqueada) TYPE abap_bool,

      cambiar_contrasenha IMPORTING iv_cod_antiguo                 TYPE string
                                    iv_cod_nuevo                   TYPE string
                          RETURNING VALUE(rv_contrasenha_cambiada) TYPE abap_bool.


  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: codigo_correcto       TYPE string,
          num_intentos_fallidos TYPE i,
          bloqueada             TYPE abap_bool.
ENDCLASS.



CLASS zcl_caja_fuerte_03 IMPLEMENTATION.

  METHOD constructor.
    codigo_correcto = iv_cod_apertura.
    num_intentos_fallidos = 0.
    bloqueada = abap_false.
  ENDMETHOD.


  METHOD abrir.
    IF bloqueada.
      rv_abierta = abap_false.

    ELSEIF codigo_correcto = iv_cod_introducido.
      num_intentos_fallidos = 0.
      rv_abierta = abap_true.

    ELSE.
      num_intentos_fallidos += 1.
      IF num_intentos_fallidos = 3.
        bloqueada = abap_true.
        rv_abierta = abap_false.
      ENDIF.
    ENDIF.

  ENDMETHOD.


  METHOD esta_bloqueada.
    rv_bloqueada = bloqueada.
  ENDMETHOD.

  METHOD cambiar_contrasenha.
    IF iv_cod_antiguo = codigo_correcto.
      codigo_correcto = iv_cod_nuevo.
      num_intentos_fallidos = 0.
      rv_contrasenha_cambiada = abap_true.
    ELSE.
      rv_contrasenha_cambiada = abap_false.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
