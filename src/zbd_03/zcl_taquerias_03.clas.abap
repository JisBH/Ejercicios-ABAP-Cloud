CLASS zcl_taquerias_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_taquerias_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_ZCL_TAQUERIAS_03 TYPE ztaquerias_03,
          lt_ZCL_TAQUERIAS_03 TYPE TABLE OF ztaquerias_03.


    " === 1. CREATE: Insertando taquerias ===
*    ls_zcl_taquerias_03-id_taqueria = '123456'.
*    ls_zcl_taquerias_03-especialidad = 'PA'.
*    ls_zcl_taquerias_03-estado = 'JA'.
*    ls_zcl_taquerias_03-moneda = 'MXN'.
*    ls_zcl_taquerias_03-nivel_picante = '1'.
*    ls_zcl_taquerias_03-nombre = 'Taqueria 1'.
*    ls_zcl_taquerias_03-precio_taco = '50.99'.
*
*    APPEND ls_zcl_taquerias_03 TO lt_ZCL_TAQUERIAS_03.
*
*    ls_zcl_taquerias_03-id_taqueria = '769834'.
*    ls_zcl_taquerias_03-especialidad = 'BA'.
*    ls_zcl_taquerias_03-estado = 'OA'.
*    ls_zcl_taquerias_03-moneda = 'MXN'.
*    ls_zcl_taquerias_03-nivel_picante = '2'.
*    ls_zcl_taquerias_03-nombre = 'Taqueria 2'.
*    ls_zcl_taquerias_03-precio_taco = '65.99'.
*
*    APPEND ls_zcl_taquerias_03 TO lt_ZCL_TAQUERIAS_03.
*
*    ls_zcl_taquerias_03-id_taqueria = '890743'.
*    ls_zcl_taquerias_03-especialidad = 'CO'.
*    ls_zcl_taquerias_03-estado = 'YU'.
*    ls_zcl_taquerias_03-moneda = 'MXN'.
*    ls_zcl_taquerias_03-nivel_picante = '3'.
*    ls_zcl_taquerias_03-nombre = 'Taqueria 3'.
*    ls_zcl_taquerias_03-precio_taco = '44.99'.
*
*    APPEND ls_zcl_taquerias_03 TO lt_ZCL_TAQUERIAS_03.
*    INSERT ztaquerias_03 FROM TABLE @lt_ZCL_TAQUERIAS_03.
*    IF sy-subrc = 0.
*      out->write( 'Insercion exitosa' ).
*    ELSE.
*      out->write( 'Insercion erronea' ).
*    ENDIF.


    " === 2. CREATE (ERROR): Clave duplicada ===
*    ls_zcl_taquerias_03-id_taqueria = '890743'.
*    ls_zcl_taquerias_03-especialidad = 'CO'.
*    ls_zcl_taquerias_03-estado = 'YU'.
*    ls_zcl_taquerias_03-moneda = 'MXN'.
*    ls_zcl_taquerias_03-nivel_picante = '3'.
*    ls_zcl_taquerias_03-nombre = 'Taqueria 3'.
*    ls_zcl_taquerias_03-precio_taco = '44.99'.
*
*    INSERT ztaquerias_03 FROM @ls_ZCL_TAQUERIAS_03.
*    IF sy-subrc = 0.
*      out->write( 'Insercion exitosa' ).
*    ELSE.
*      out->write( 'Insercion erronea' ).
*    ENDIF.


    " === 3. READ: Leer una taqueria por su ID ===
*    SELECT SINGLE * FROM ztaquerias_03 WHERE id_taqueria = '890743' INTO @ls_zcl_taquerias_03.
*    IF sy-subrc = 0.
*      out->write( 'Lectura exitosa' ).
*      out->write( ls_zcl_taquerias_03 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


    " === 4. READ (ERROR): Taqueria inexistente ===
*    SELECT SINGLE * FROM ztaquerias_03 WHERE id_taqueria = '732737' INTO @ls_zcl_taquerias_03.
*    IF sy-subrc = 0.
*      out->write( 'Lectura exitosa' ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


    " === 5. READ: Listar taquerias por estado ===
*    SELECT * FROM ztaquerias_03 WHERE estado = 'JA' INTO TABLE @lt_ZCL_TAQUERIAS_03.
*    IF sy-subrc = 0.
*      out->write( |Lectura exitosa. Se han devuelto { sy-dbcnt } taquerias| ).
*      out->write( lt_zcl_taquerias_03 ).
*
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


    " === 6. UPDATE: Actualizar precio ===
*    UPDATE ztaquerias_03 SET precio_taco = '12.99' WHERE id_taqueria = '890743'.
*    IF sy-subrc = 0.
*      out->write( 'Actualizacion exitosa' ).
*
*    ELSE.
*      out->write( 'Actualizacion erronea' ).
*    ENDIF.


    " === 7. UPDATE (ERROR): Taqueria inexistente ===
*    UPDATE ztaquerias_03 SET precio_taco = '79.99' WHERE id_taqueria = '999999'.
*    IF sy-subrc = 0.
*      out->write( 'Actualizacion exitosa' ).
*
*    ELSE.
*      out->write( 'Actualizacion erronea' ).
*    ENDIF.


    " === 8. DELETE: Borrar taqueria ===
*    DELETE FROM ztaquerias_03 WHERE id_taqueria = '123456'.
*    IF sy-subrc = 0.
*      out->write( 'Eliminacion exitosa' ).
*
*    ELSE.
*      out->write( 'Eliminacion erronea' ).
*    ENDIF.


    " === 9. READ final: Recuento ===
    SELECT COUNT( * ) FROM ztaquerias_03 INTO @DATA(lv_cuenta).
    IF sy-subrc = 0.
      out->write( 'Recuento exitosa' ).
      out->write( lv_cuenta ).

    ELSE.
      out->write( 'Recuento erronea' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
