CLASS zcl_taller_bicis_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      registrar_reparacion IMPORTING i_cliente       TYPE string
                                     i_averia        TYPE string
                           RETURNING VALUE(rv_id_rep) TYPE i,

      consultar_reparacion IMPORTING i_id_rep        TYPE n
                           EXPORTING e_cliente       TYPE string
                                     e_averia        TYPE string
                                     e_estado        TYPE string
                           RETURNING VALUE(rv_existe) TYPE abap_bool,

      cambiar_estado IMPORTING i_id_rep        TYPE n
                               i_nuevo_estado  TYPE string
                     RETURNING VALUE(rv_exito) TYPE abap_bool,

      eliminar_reparacion IMPORTING i_id_rep        TYPE n
                          RETURNING VALUE(rv_exito) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_taller_bicis_03 IMPLEMENTATION.

  METHOD registrar_reparacion.
    DATA: lv_max_id TYPE n LENGTH 10.


    SELECT SINGLE MAX( id_reparacion )
      FROM ztaller_bici_03
      INTO @lv_max_id.


    rv_id_rep = lv_max_id + 1.


    DATA(ls_reparacion) = VALUE ztaller_bici_03(
      id_reparacion  = rv_id_rep
      cliente = i_cliente
      averia  = i_averia
      estado  = 'PENDIENTE'
    ).

    INSERT ztaller_bici_03 FROM @ls_reparacion.

  ENDMETHOD.


  METHOD consultar_reparacion.

    SELECT SINGLE cliente, averia, estado
      FROM ztaller_bici_03
      WHERE id_reparacion = @i_id_rep
      INTO (@e_cliente, @e_averia, @e_estado).


    IF sy-subrc = 0.
      rv_existe = abap_true.
    ELSE.
      rv_existe = abap_false.
      CLEAR: e_cliente, e_averia, e_estado.
    ENDIF.

  ENDMETHOD.


  METHOD cambiar_estado.

    UPDATE ztaller_bici_03
      SET estado = @i_nuevo_estado
      WHERE id_reparacion = @i_id_rep.


    IF sy-subrc = 0.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.


  METHOD eliminar_reparacion.

    DELETE FROM ztaller_bici_03
      WHERE id_reparacion = @i_id_rep.

    IF sy-subrc = 0.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
