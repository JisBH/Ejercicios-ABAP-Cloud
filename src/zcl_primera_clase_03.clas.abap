CLASS zcl_primera_clase_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    "Ejercicio 3
*
*    TYPES: BEGIN OF ty_pedido,
*            lv_id_pedido    TYPE i,
*            lv_importe      TYPE p LENGTH 5 DECIMALS 2,
*            lv_tipo_cliente TYPE string,
*          END OF ty_pedido.
*
*    DATA ls_pedido TYPE ty_pedido.
*    DATA lt_pedidos TYPE TABLE OF ty_pedido.
*    DATA: lv_contador TYPE i,
*          lv_resto    TYPE i.
*
*    DO 5 TIMES.
*      lv_contador += 1.
*      ls_pedido-lv_id_pedido = lv_contador.
*      ls_pedido-lv_importe = lv_contador * '120.75'.
*      lv_resto = lv_contador MOD 2.
*
*      CASE lv_resto.
*        WHEN 0.
*          ls_pedido-lv_tipo_cliente = 'PREMIUM'.
*
*        WHEN OTHERS.
*          ls_pedido-lv_tipo_cliente = 'ESTANDAR'.
*
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedidos.
*    ENDDO.
*
*    out->write( ls_pedido ).


*    "Ejercicio 1 con LOOP AT
*    TYPES: BEGIN OF ty_producto,
*             nombre TYPE string,
*             precio TYPE p LENGTH 5 DECIMALS 2,
*           END OF ty_producto.
*
*    DATA ls_producto TYPE ty_producto.
*    DATA lt_producto TYPE TABLE OF ty_producto.
*
*    ls_producto-nombre = 'Producto A'.
*    ls_producto-precio = '50.27'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto B'.
*    ls_producto-precio = '65.45'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto C'.
*    ls_producto-precio = '80.39'.
*    APPEND ls_producto TO lt_producto.
*
*    LOOP AT lt_producto INTO ls_producto.
*      out->write( ls_producto-nombre ).
*    ENDLOOP.
*
*
*    "Ejercicio 2 con LOOP AT
*    TYPES: BEGIN OF ty_empleado,
*             nombre  TYPE string,
*             salario TYPE p LENGTH 5 DECIMALS 2,
*           END OF ty_empleado.
*
*    DATA ls_empleado TYPE ty_empleado.
*    DATA lt_empleado TYPE TABLE OF ty_empleado.
*
*    ls_empleado-nombre = 'Juan'.
*    ls_empleado-salario = '3000'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-nombre = 'Pedro'.
*    ls_empleado-salario = '1500'.
*    APPEND ls_empleado TO lt_empleado.
*
*    LOOP AT lt_empleado INTO ls_empleado.
*      IF ls_empleado-salario > 2000.
*        out->write( ls_empleado-nombre ).
*      ENDIF.
*    ENDLOOP.
*
*
*    "Ejercicio 3 con LOOP AT
*    TYPES: BEGIN OF ty_pedido,
*             id_pedido TYPE i,
*             importe   TYPE p LENGTH 5 DECIMALS 2,
*             estado    TYPE string,
*           END OF ty_pedido.
*
*    DATA ls_pedido TYPE ty_pedido.
*    DATA lt_pedido TYPE TABLE OF ty_pedido.
*    DATA lv_contador TYPE i.
*
*    DO 6 TIMES.
*      ls_pedido-id_pedido = sy-index.
*      ls_pedido-importe = sy-index * '45.30'.
*
*      CASE sy-index MOD 3.
*        WHEN 0.
*          ls_pedido-estado = 'ENVIADO'.
*        WHEN 1.
*          ls_pedido-estado = 'PENDIENTE'.
*        WHEN 2.
*          ls_pedido-estado = 'CANCELADO'.
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedido.
*    ENDDO.
*
*    LOOP AT lt_pedido INTO ls_pedido.
*      IF ls_pedido-estado = 'PENDIENTE'.
*        out->write( |ID: { ls_pedido-id_pedido } IMPORTE: { ls_pedido-importe }| ).
*        lv_contador += 1.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lv_contador ).

*
*    "Ejercicio 1 con READ TABLE
*    TYPES: BEGIN OF ty_producto,
*             nombre TYPE string,
*             precio TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_producto.
*
*    DATA: ls_producto TYPE ty_producto,
*          lt_producto TYPE TABLE OF ty_producto.
*
*    ls_producto-nombre = 'Producto A'.
*    ls_producto-precio = '56.99'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto B'.
*    ls_producto-precio = '66.87'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto C'.
*    ls_producto-precio = '75.99'.
*    APPEND ls_producto TO lt_producto.
*
*    ls_producto-nombre = 'Producto D'.
*    ls_producto-precio = '99.99'.
*    APPEND ls_producto TO lt_producto.
*
*    READ TABLE lt_producto INTO ls_producto INDEX 2.
*    IF sy-subrc = 0.
*      out->write( |Nombre: { ls_producto-nombre } Precio: { ls_producto-precio }| ).
*    ELSE.
*      out->write( 'No se ha encontrado el producto' ).
*    ENDIF.
*
*
*    "Ejercicio 2
*    TYPES: BEGIN OF ty_empleado,
*             id_empleado  TYPE i,
*             nombre       TYPE string,
*             departamento TYPE string,
*           END OF ty_empleado.
*
*    DATA: ls_empleado TYPE ty_empleado,
*          lt_empleado TYPE TABLE OF ty_empleado.
*
*    ls_empleado-id_empleado = 1.
*    ls_empleado-nombre = 'Pedro'.
*    ls_empleado-departamento = 'VENTAS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 2.
*    ls_empleado-nombre = 'Juan'.
*    ls_empleado-departamento = 'VENTAS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 3.
*    ls_empleado-nombre = 'Judas'.
*    ls_empleado-departamento = 'IT'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 4.
*    ls_empleado-nombre = 'Oscar'.
*    ls_empleado-departamento = 'RECURSOS HUMANOS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    ls_empleado-id_empleado = 5.
*    ls_empleado-nombre = 'Gabri'.
*    ls_empleado-departamento = 'RECURSOS HUMANOS'.
*    APPEND ls_empleado TO lt_empleado.
*
*    READ TABLE lt_empleado INTO ls_empleado WITH KEY id_empleado = 3.
*    IF sy-subrc = 0.
*      out->write( |Nombre: { ls_empleado-nombre } Departamento: { ls_empleado-departamento }| ).
*    ELSE.
*      out->write( |No existe ese empleado| ).
*    ENDIF.
*
*
*    "Ejercicio 3
*    TYPES: BEGIN OF ty_pedido,
*             id_pedido TYPE i,
*             importe   TYPE p LENGTH 8 DECIMALS 2,
*             estado    TYPE string,
*           END OF ty_pedido.
*
*    DATA: ls_pedido     TYPE ty_pedido,
*          lt_pedido     TYPE TABLE OF ty_pedido,
*          lv_resto      TYPE i,
*          lv_id_buscado TYPE i VALUE 4.
*
*    DO 6 TIMES.
*      ls_pedido-id_pedido = sy-index.
*      ls_pedido-importe = sy-index * '50.25'.
*      lv_resto = sy-index MOD 2.
*
*      CASE lv_resto.
*        WHEN 0.
*          ls_pedido-estado = 'ENVIADO'.
*        WHEN 1.
*          ls_pedido-estado = 'PENDIENTE'.
*      ENDCASE.
*
*      APPEND ls_pedido TO lt_pedido.
*
*    ENDDO.
*
*    READ TABLE lt_pedido INTO ls_pedido WITH KEY id_pedido = lv_id_buscado estado = 'PENDIENTE'.
*
*    IF sy-subrc = 0.
*      out->write( |Importe: { ls_pedido-importe }| ).
*    ELSE.
*      out->write( |No hay pedidos en estado PENDIENTE| ).
*    ENDIF.

    "Ejercicio 1
    TYPES: BEGIN OF ty_videojuego,
             titulo TYPE String,
             precio TYPE p LENGTH 5 DECIMALS 2,
           END OF ty_videojuego.

    DATA ls_videojuego TYPE ty_videojuego.
    DATA lt_videojuego TYPE TABLE OF ty_videojuego.

    ls_videojuego-titulo = 'Spyro'.
    ls_videojuego-precio = '40.00'.
    APPEND ls_videojuego TO lt_videojuego.

    ls_videojuego-titulo = 'Spyro 2'.
    ls_videojuego-precio = '40.00'.
    APPEND ls_videojuego TO lt_videojuego.

    ls_videojuego-titulo = 'Spyro 3'.
    ls_videojuego-precio = '40.00'.
    APPEND ls_videojuego TO lt_videojuego.

    LOOP AT lt_videojuego ASSIGNING FIELD-SYMBOL(<fs_videojuego>).
      <fs_videojuego>-precio =  <fs_videojuego>-precio * '0.8'.
      out->write( | El juego { <fs_videojuego>-titulo } cuesta { <fs_videojuego>-precio }| ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
