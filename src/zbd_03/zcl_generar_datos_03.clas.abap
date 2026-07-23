CLASS zcl_generar_datos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generar_datos_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Limpiar datos previos (por si se ejecuta varias veces)
    " DELETE FROM zcliente_03 WHERE client = sy-mandt.
    " DELETE FROM zpedido_03 WHERE client = sy-mandt.

    " ---------- CLIENTES ----------
*    DATA lt_clientes TYPE TABLE OF zcliente_03.
*
*    lt_clientes = VALUE #(
*      ( client = sy-mandt cliente_id = '0001' nombre = 'Ana Garcia'      ciudad = 'Sevilla' )
*      ( client = sy-mandt cliente_id = '0002' nombre = 'Luis Perez'      ciudad = 'Huelva' )
*      ( client = sy-mandt cliente_id = '0003' nombre = 'Marta Ruiz'      ciudad = 'Cadiz' )
*      ( client = sy-mandt cliente_id = '0004' nombre = 'Pedro Sanchez'   ciudad = 'Sevilla' )
*      ( client = sy-mandt cliente_id = '0005' nombre = 'Lucia Fernandez' ciudad = 'Granada' )
*      ( client = sy-mandt cliente_id = '0006' nombre = 'Javier Torres'   ciudad = 'Huelva' )
*      ( client = sy-mandt cliente_id = '0007' nombre = 'Sara Jimenez'    ciudad = 'Malaga' )
*      ( client = sy-mandt cliente_id = '0008' nombre = 'Diego Morales'   ciudad = 'Sevilla' )
*    ).
*
*    INSERT zcliente_03 FROM TABLE @lt_clientes.
*
*    " ---------- PEDIDOS ----------
*    DATA lt_pedidos TYPE TABLE OF zpedido_03.
*
*    lt_pedidos = VALUE #(
*      ( client = sy-mandt pedido_id = '0001' cliente_id = '0001' producto = 'Portatil'     importe = '899.00'  fecha = '20260115' )
*      ( client = sy-mandt pedido_id = '0002' cliente_id = '0001' producto = 'Raton'         importe = '25.50'   fecha = '20260118' )
*      ( client = sy-mandt pedido_id = '0003' cliente_id = '0002' producto = 'Monitor'       importe = '210.00'  fecha = '20260120' )
*      ( client = sy-mandt pedido_id = '0004' cliente_id = '0002' producto = 'Teclado'       importe = '45.00'   fecha = '20260122' )
*      ( client = sy-mandt pedido_id = '0005' cliente_id = '0003' producto = 'Auriculares'   importe = '60.00'   fecha = '20260125' )
*      ( client = sy-mandt pedido_id = '0006' cliente_id = '0004' producto = 'Tablet'        importe = '320.00'  fecha = '20260128' )
*      ( client = sy-mandt pedido_id = '0007' cliente_id = '0004' producto = 'Funda tablet'  importe = '18.00'   fecha = '20260130' )
*      ( client = sy-mandt pedido_id = '0008' cliente_id = '0005' producto = 'Impresora'     importe = '150.00'  fecha = '20260201' )
*      ( client = sy-mandt pedido_id = '0009' cliente_id = '0006' producto = 'Silla oficina' importe = '210.00'  fecha = '20260203' )
*      ( client = sy-mandt pedido_id = '0010' cliente_id = '0007' producto = 'Portatil'      importe = '750.00'  fecha = '20260205' )
*      ( client = sy-mandt pedido_id = '0011' cliente_id = '0007' producto = 'Mochila'       importe = '35.00'   fecha = '20260207' )
*      ( client = sy-mandt pedido_id = '0012' cliente_id = '0008' producto = 'Monitor'       importe = '195.00'  fecha = '20260210' )
*      ( client = sy-mandt pedido_id = '0013' cliente_id = '0001' producto = 'Webcam'        importe = '40.00'   fecha = '20260212' )
*      ( client = sy-mandt pedido_id = '0014' cliente_id = '0003' producto = 'Portatil'      importe = '910.00'  fecha = '20260215' )
*      ( client = sy-mandt pedido_id = '0015' cliente_id = '0005' producto = 'Raton'         importe = '22.00'   fecha = '20260218' )
*    ).
*
*    INSERT zpedido_03 FROM TABLE @lt_pedidos.
*
*    out->write( |Insertados { lines( lt_clientes ) } clientes y { lines( lt_pedidos ) } pedidos.| ).



    "Ejercicio 1
*    SELECT SINGLE * FROM zcliente_03
*    WHERE cliente_id = '0005'
*    INTO @DATA(ls_resultado1).
*
*    IF sy-subrc = 0.
*      out->write( ls_resultado1 ).
*
*      UPDATE zcliente_03
*      SET ciudad = 'SEVILLA'
*      WHERE cliente_id = '0005'.
*
*      IF sy-subrc = 0.
*        SELECT SINGLE * FROM zcliente_03
*        WHERE cliente_id = '0005'
*        INTO @ls_resultado1.
*
*        IF sy-subrc = 0.
*          out->write( 'Registro sobreecrito' ).
*          out->write( ls_resultado1 ).
*        ENDIF.
*      ENDIF.
*    ENDIF.



    "Ejercicio 2
    "Pedido nuevo para un cliente existente"
*    Elige un cliente_id que ya exista en ZCLIENTE_XX (compruébalo con Data Preview). Inserta una fila nueva
*    en ZPEDIDO_XX con INSERT, usando ese cliente_id, un pedido_id que no exista todavía ('0016'),
*    y datos inventados de producto e importe. Después haz un JOIN ZPEDIDO_XX + ZCLIENTE_XX filtrando por ese pedido_id
*    para comprobar que aparece con el nombre del cliente correcto.

*    DELETE FROM zpedido_03 WHERE pedido_id = '0016'.
*    SELECT SINGLE * FROM zcliente_03
*    WHERE cliente_id = '0001'
*    INTO @DATA(ls_resultado1).
*
*    IF sy-subrc = 0.
*      INSERT zpedido_03 FROM @( VALUE #(
*      pedido_id = '0016'
*      cliente_id = ls_resultado1-cliente_id
*      producto = 'Disco duro'
*      importe = '99.80'
*      fecha = '20260720'
*      ) ).
*
*      IF sy-subrc = 0.
*        SELECT SINGLE
*        p~pedido_id,
*        p~producto,
*        p~importe,
*        p~fecha,
*        c~cliente_id,
*        c~nombre
*      FROM zpedido_03 AS p
*      INNER JOIN zcliente_03 AS c ON p~cliente_id = c~cliente_id
*      WHERE p~pedido_id = '0016'
*      INTO @DATA(ls_resultado_join).
*
*        IF sy-subrc = 0.
*          out->write( ls_resultado_join ).
*          else.
*          out->write( 'Error en el join' ).
*        ENDIF.
*
*      ENDIF.
*    ENDIF.



    "Ejercicio 3 "El pedido que ya no existe"
*  Elige un pedido_id de ZPEDIDO_XX cualquiera (por ejemplo '0015'). Bórralo con DELETE.
*  Después, intenta hacer el mismo JOIN de ZPEDIDO_XX + ZCLIENTE_XX que hicisteis antes y comprueba que ese pedido
*  ya no aparece en el resultado, aunque el cliente al que pertenecía sigue existiendo en ZCLIENTE_XX.

*  SELECT SINGLE cliente_id
*  FROM zpedido_03
*  WHERE pedido_id = '0015'
*  INTO @DATA(lv_cliente_borrar).
*
*    DELETE FROM zpedido_03 WHERE pedido_id = '0015'.
*
*    IF sy-subrc = 0.
*      SELECT SINGLE p~pedido_id, c~nombre
*        FROM zpedido_03 AS p
*        INNER JOIN zcliente_03 AS c ON p~cliente_id = c~cliente_id
*        WHERE p~pedido_id = '0015'
*        INTO @DATA(ls_comprobacion).
*
*      SELECT SINGLE cliente_id, nombre
*        FROM zcliente_03
*        WHERE cliente_id = @lv_cliente_borrar
*        INTO @DATA(ls_cliente_vivo).
*
*      out->write( ls_comprobacion ).
*      out->write( ls_cliente_vivo ).
*    ENDIF.




*   4️ "Sube el importe a un cliente concreto"

*   Usando UPDATE ... WHERE, sube un 10% el importe de todos los pedidos del cliente '0001'.
*    Antes y después, haz un SELECT con SUM( importe ) filtrado por ese cliente_id
*   para comprobar visualmente que el total ha subido.

*    Pasos: 1) SELECT con SUM antes · 2) UPDATE con cálculo importe = importe * '1.1' ·
*   3) SELECT con SUM después · 4) comparar.

*    DATA(lv_id_cliente) = '0001'.
*    SELECT FROM zpedido_03
*        FIELDS SUM( importe )
*        WHERE cliente_id = @lv_id_cliente
*        INTO @DATA(lv_importe_4).
*    IF sy-subrc = 0.
*      out->write( |El importe inicial es { lv_importe_4 }€| ).
*    ELSE.
*      out->write( |El cliente { lv_id_cliente } no existe| ).
*    ENDIF.

    " Solución PRO de Ramón
*    DATA lv_mult TYPE p DECIMALS 4.
*    lv_mult = 1 / '1.10'.
*
*    UPDATE zpedido_03
*        SET importe = division( importe, @lv_mult, 2 )
*        WHERE cliente_id = '0001'.

    " Estilo chapucero de LCa
*    SELECT FROM zpedido_03
*        FIELDS *
*        WHERE cliente_id = @lv_id_cliente
*        INTO TABLE @DATA(lt_pedido_4).
*    IF sy-subrc = 0.
*      LOOP AT lt_pedido_4 ASSIGNING FIELD-SYMBOL(<fs_pedido>).
*        <fs_pedido>-importe = <fs_pedido>-importe * '1.1'.
*      ENDLOOP.
*
*      UPDATE zpedido_03 FROM TABLE @lt_pedido_4.
*      IF sy-subrc = 0.
*        out->write( |Se han actalizado los importes del cliente { lv_id_cliente } | ).
*      ELSE.
*        out->write( |No se han podido actualizar los importes del cliente { lv_id_cliente } | ).
*      ENDIF.
*    ENDIF.
*
*    SELECT FROM zpedido_03
*        FIELDS SUM( importe )
*        WHERE cliente_id = @lv_id_cliente
*        INTO @lv_importe_4.
*    IF sy-subrc = 0.
*      out->write( |El importe final es { lv_importe_4 }€| ).
*    ELSE.
*      out->write( |El cliente { lv_id_cliente } no existe| ).
*    ENDIF.


*    "Ejercicio 5
*    SELECT SINGLE cliente_id
*  FROM zcliente_03
*  WHERE cliente_id = '9999'
*  INTO @DATA(lv_existe).
*
*    IF sy-subrc <> 0.
*      INSERT zpedido_03 FROM @( VALUE #(
*        pedido_id  = '0099'
*        cliente_id = '9999'
*        producto   = 'Monitor'
*        importe    = '150.00'
*        fecha      = '20260720'
*      ) ).
*    ENDIF.


    SELECT FROM zcliente_03 AS c
    INNER JOIN zpedido_03 AS p ON c~cliente_id = p~cliente_id
    FIELDS c~nombre, SUM( p~importe ) AS total_gastado
    GROUP BY c~nombre
    ORDER BY total_gastado DESCENDING
    INTO TABLE @DATA(lt_top_cliente).

    IF sy-subrc = 0.
      READ TABLE lt_top_cliente INTO DATA(ls_ej6) INDEX 1.
      out->write( ls_ej6 ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
