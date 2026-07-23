CLASS zcl_bodegas_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bodegas_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: ls_zbodegas_03 TYPE zbodegas_03,
          lt_zbodegas_03 TYPE TABLE OF zbodegas_03.
*
*
*    " === 1. CREATE: Insertando bodegas ===
*    ls_zbodegas_03-anyo_fundacion = '1902'.
*    ls_zbodegas_03-denominacion = 'RI'.
*    ls_zbodegas_03-id_bodega = 'BOD001'.
*    ls_zbodegas_03-moneda = 'EUR'.
*    ls_zbodegas_03-nombre = ' Bodegas Marques de Rioja'.
*    ls_zbodegas_03-precio_botella = '12.50'.
*    ls_zbodegas_03-tipo_vino = 'TI'.
*
*    INSERT zbodegas_03 FROM @ls_zbodegas_03.
*
*    IF sy-subrc = 0.
*      out->write( 'Insercion exitosa' ).
*    ELSE.
*      out->write( 'FALLO en insercion' ).
*    ENDIF.
*
*    INSERT zbodegas_03 FROM TABLE @( VALUE #(
*    ( anyo_fundacion = '1978'
*    denominacion = 'RS'
*    id_bodega = 'BOD002'
*    moneda = 'EUR'
*    nombre = 'Pazo do Mar'
*    precio_botella = '9.90'
*    tipo_vino = 'BL'
*    )
*    ( anyo_fundacion = '1995'
*    denominacion = 'PR'
*    id_bodega = 'BOD003 '
*    moneda = 'EUR'
*    nombre = 'Finca Priorat Alta'
*    precio_botella = '22.00'
*    tipo_vino = 'TI'
*    )
*    ) ).
*
*    IF sy-subrc = 0.
*      out->write( 'Inserciones exitosas' ).
*    ELSE.
*      out->write( 'FALLO en las inserciones' ).
*    ENDIF.


    " === 2. CREATE (ERROR): Clave duplicada ===
*    INSERT zbodegas_03 FROM @( VALUE #(
*    anyo_fundacion = '1978'
*    denominacion = 'RS'
*    id_bodega = 'BOD002'
*    moneda = 'EUR'
*    nombre = 'Pazo do Mar'
*    precio_botella = '9.90'
*    tipo_vino = 'BL'
*    ) ).
*
*    IF sy-subrc = 0.
*      out->write( 'Insercion exitosa' ).
*    ELSE.
*      out->write( 'FALLO en la insercion' ).
*    ENDIF.


    " === 3. READ: Leer una bodega por su ID ===
*    SELECT SINGLE * FROM zbodegas_03 WHERE id_bodega = 'BOD002' INTO @ls_zbodegas_03.
*    IF sy-subrc = 0.
*      out->write( 'Lectura exitosa' ).
*      out->write( ls_zbodegas_03 ).
*    ELSE.
*      out->write( 'FALLO en la lectura' ).
*    ENDIF.


    " === 4. READ (ERROR): Bodega inexistente ===
*    SELECT SINGLE * FROM zbodegas_03 WHERE id_bodega = 'BOD999' INTO @ls_zbodegas_03.
*    IF sy-subrc = 0.
*      out->write( 'Lectura exitosa' ).
*      out->write( ls_zbodegas_03 ).
*    ELSE.
*      out->write( 'FALLO en la lectura' ).
*    ENDIF.


    " === 5. READ: Listar bodegas por denominacion ===
*    SELECT * FROM zbodegas_03 WHERE tipo_vino = 'TI' INTO TABLE @lt_zbodegas_03.
*      IF sy-subrc = 0.
*        out->write( 'Lectura exitosa' ).
*        out->write( lt_zbodegas_03 ).
*      ELSE.
*        out->write( 'FALLO en la lectura' ).
*      ENDIF.


    " === 6. UPDATE: Actualizar precio ===
*    UPDATE zbodegas_03 SET precio_botella = '99.99' WHERE id_bodega = 'BOD002'.
*    IF sy-subrc = 0.
*      out->write( 'Actualizacion exitosa' ).
*    ELSE.
*      out->write( 'FALLO en la actualizacion' ).
*    ENDIF.


    " === 7. UPDATE (ERROR): Bodega inexistente ===
*    UPDATE zbodegas_03 SET precio_botella = '33.33' WHERE id_bodega = 'BOD005'.
*    IF sy-subrc = 0.
*      out->write( 'Actualizacion exitosa' ).
*    ELSE.
*      out->write( 'FALLO en la actualizacion' ).
*    ENDIF.


    " === 8. DELETE: Borrar bodega ===
*    DELETE FROM zbodegas_03 WHERE id_bodega = 'BOD002'.
*    IF sy-subrc = 0.
*      out->write( 'Eliminacion exitosa' ).
*    ELSE.
*      out->write( 'FALLO en la eliminacion' ).
*    ENDIF.


    " === 9. READ final: Recuento ===
    SELECT COUNT( * ) FROM zbodegas_03 INTO @DATA(lv_cuenta).
    IF sy-subrc = 0.
      out->write( 'Recuento exitoso' ).
      out->write( lv_cuenta ).
    ELSE.
      out->write( 'FALLO en el recuento' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
