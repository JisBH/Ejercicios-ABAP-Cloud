CLASS zcl_instrucciones_nuevas_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_instrucciones_nuevas_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  DATA(lv_precio) = 35.
*  DATA(lv_entradas) = 4.
*  FINAL(lv_importe) = lv_precio * lv_entradas.
*
*  out->write( lv_importe ).
*  out->write( lv_precio ).
*  out->write( lv_entradas ).
*
*  " lv_importe = 200. No se puede porque es final

*    "Ej 2
*    TYPES: BEGIN OF ty_juego,
*             titulo     TYPE string,
*             plataforma TYPE string,
*             precio     TYPE p LENGTH 9 DECIMALS 2,
*           END OF ty_juego.
*
*    DATA lt_juegos TYPE TABLE OF ty_juego.
*
*    lt_juegos = VALUE #(
*    ( titulo = 'Minecraft' plataforma = 'PC' precio = '10.99' )
*    ).

    "Ej 3
*    TYPES: BEGIN OF ty_pos_pedido,
*             producto TYPE string,
*             cantidad TYPE i,
*             precio   TYPE p LENGTH 9 DECIMALS 2,
*           END OF ty_pos_pedido,
*
*           BEGIN OF ty_pedido,
*             id_pedido  TYPE i,
*             cliente    TYPE string,
*             ciudad     TYPE string,
*             urgente    TYPE abap_bool,
*             posiciones TYPE TABLE OF ty_pos_pedido WITH EMPTY KEY,
*           END OF ty_pedido.
*
*    DATA lt_pedidos TYPE TABLE OF ty_pedido.
*
*    lt_pedidos = VALUE #(
*        ( id_pedido = 1
*          cliente = 'Empresa Norte'
*          ciudad = 'Sevilla'
*          urgente = abap_true
*
*          posiciones = VALUE #(
*            ( producto = 'Portatil'
*              cantidad = 2
*              precio = '850'
*            )
*            ( producto = 'Raton'
*              cantidad = 5
*              precio = '25'
*            )
*            ( producto = 'Monitor'
*              cantidad = 2
*              precio = '220'
*            )
*          )
*
*        )
*
*     ).

    "Ej 4 El COND lo que hace es devolver un valor. El IF y el CASE se usan cuando quieres hacer operaciones
    "o quieres asignar un valor a una variable pero no devolver el valor como tal
*DATA(lv_importe) = 750.
*DATA(lv_descuento) = COND #(
*    when lv_importe >= 1000 then 20
*    when lv_importe >= 500 then 10
*    when lv_importe >= 200 then 5
*    else 0
*).
*
*out->write( lv_descuento ).


*"Ejercicio 5 SWITCH
*DATA(lv_estado) = 'E'.
*"DATA(lv_estado2) = 'Enviado'.
*
*DATA(lv_descripcion) = SWITCH string(
*    lv_estado
*    when 'P' then 'Pendiente'
*    when 'E' then 'Enviado'
*    when 'R' then 'Recibido'
*    when 'C' then 'Cancelado'
*    else 'Estado Desconocido'
*
*).
*out->write( lv_descripcion ).
*
*DATA(lv_prioridad) = SWITCH i(
*    lv_descripcion
*    when 'Pendiente' then 1
*    when 'Enviado' then 2
*    when 'Recibido' then 3
*    when 'Cancelado' then 4
*    else 0
*
*).
*out->write( lv_prioridad ).


*"Ejercicio 6 CONV (casting)
*DATA(lv_precio_texto)   = '125'.
*DATA(lv_cantidad_texto) = '4'.
*DATA(lv_precio_entero) = CONV i( lv_precio_texto ).
*DATA(lv_cantidad_entero) = CONV i( lv_cantidad_texto ).
*DATA(lv_importe) = lv_precio_entero * lv_cantidad_entero.
*
*out->write( |Precio original texto { lv_precio_texto }| ).
*out->write( |Precio convertido a entero { lv_precio_entero }| ).
*out->write( |Cantidad original texto { lv_cantidad_texto }| ).
*out->write( |Cantidad convertida a entero { lv_cantidad_entero }| ).
*out->write( |Importe total { lv_importe }\n| ).
*
*"Reto adicional
*DATA(lv_descuento_texto) = '10'.
*DATA lv_importe_con_descuento type p length 9 decimals 2.
*DATA lv_descuento_entero type p length 9 decimals 2.
*lv_descuento_entero = CONV #( lv_descuento_texto ).
*lv_importe_con_descuento = lv_importe * lv_descuento_entero.
*
*out->write( |Importe bruto { lv_importe }| ).
*out->write( |Descuento aplicado { lv_descuento_entero }| ).
*out->write( |Importe con descuento { lv_importe_con_descuento }\n| ).
*
*"Segundo reto
*DATA(lv_edad_texto) = '17'.
*DATA(lv_edad_entero) = CONV i( lv_edad_texto ).
*
*DATA(lv_resultado) = COND string(
*    when lv_edad_entero >= 18 then 'Mayor de edad'
*    else 'Menor de edad'
*    ).
*out->write( lv_resultado ).


    "Ejercicio 7 Corresponding

*    TYPES: BEGIN OF ty_empleado,
*             id           TYPE i,
*             nombre       TYPE string,
*             email        TYPE string,
*             telefono     TYPE string,
*             departamento TYPE string,
*             salario      TYPE i,
*           END OF ty_empleado,
*
*           BEGIN OF ty_contacto,
*             id       TYPE i,
*             nombre   TYPE string,
*             email    TYPE string,
*             telefono TYPE string,
*           END OF ty_contacto,
*
*           tt_contacto TYPE STANDARD TABLE OF ty_contacto WITH DEFAULT KEY.
*
*
*    DATA lt_empleados TYPE TABLE OF ty_empleado.
*    DATA lt_contactos TYPE TABLE OF ty_contacto.
*
*    lt_empleados = VALUE #(
*    ( id = 1
*      nombre = 'Ana Garcia'
*      email = 'ana@empresa.es'
*      telefono = '111111111'
*      departamento = 'Desarrollo'
*      salario = 28000 )
*
*      ( id = 2
*      nombre = 'Carlos Perez'
*      email = 'carlos@empresa.es'
*      telefono = '222222222'
*      departamento = 'Ventas'
*      salario = 32000 )
*
*      ( id = 3
*      nombre = 'Marta Lopez'
*      email = 'marta@empresa.es'
*      telefono = '333333333'
*      departamento = 'Administracion'
*      salario = 26000 )
*    ).
*
*    " DATA(lt_contactos) = CORRESPONDING tt_contacto( lt_empleados ).
*    lt_contactos = CORRESPONDING #( lt_empleados ).
*
*    out->write( lt_empleados ).
*    out->write( '---------------------------------------------------------------------------------------' ).
*    out->write( '---------------------------------------------------------------------------------------' ).
*    out->write( lt_contactos ).

    "Ejercicio 8

*" 1. Definición de tipos de estructura
*    TYPES: BEGIN OF ty_usuario,
*             id_usuario      TYPE i,
*             nombre_completo TYPE string,
*             correo          TYPE string,
*             telefono        TYPE string,
*             password        TYPE string,
*             salario         TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_usuario.
*
*    TYPES: BEGIN OF ty_ficha_publica,
*             id       TYPE i,
*             nombre   TYPE string,
*             email    TYPE string,
*             telefono TYPE string,
*             salario  TYPE p LENGTH 8 DECIMALS 2,
*           END OF ty_ficha_publica.
*
*    " 2. Creación del usuario mediante VALUE
*    DATA(ls_usuario) = VALUE ty_usuario(
*      id_usuario      = 101
*      nombre_completo = 'Laura Sanchez'
*      correo          = 'laura.sanchez@empresa.es'
*      telefono        = '+34 600 123 456'
*      password        = 'MiClaveSecreta123'
*      salario         = '35000.00'
*    ).
*
*    " 3. Conversión usando CORRESPONDING + MAPPING + EXCEPT
*    DATA(ls_ficha_publica) = CORRESPONDING ty_ficha_publica(
*      ls_usuario
*      MAPPING
*        id     = id_usuario
*        nombre = nombre_completo
*        email  = correo
*      EXCEPT
*        salario
*    ).
*
*    " 4. Mostrar ambas estructuras por consola
*    out->write( '--- Datos completos del usuario (Original) ---' ).
*    out->write( ls_usuario ).
*
*    out->write( '--- Ficha pública (Transformada) ---' ).
*    out->write( ls_ficha_publica ).

    "Ejercicio 9 BASE

*    TYPES: begin of ty_candidato,
*        id type i,
*        nombre type string,
*        experiencia type i,
*        salario type i,
*        ciudad type string,
*    end of ty_candidato.
*
*    data ls_candidato type ty_candidato.
*
*    ls_candidato = value #(
*        id = 1
*        nombre = 'Ana'
*        experiencia = 4
*        salario = 28000
*        ciudad = 'Sevilla' ).


    "Ejercicio 10 tabla con corchetes
*    TYPES: BEGIN OF ty_producto,
*             id     TYPE i,
*             nombre TYPE string,
*             precio TYPE i,
*             stock  TYPE i,
*           END OF ty_producto.
*
*    DATA lt_producto TYPE TABLE OF ty_producto.
*
*    lt_producto = VALUE #(
*        ( id = 1 nombre = 'Monitor' precio = 250 stock = 10 )
*        ( id = 2 nombre = 'Teclado' precio = 50 stock = 20 )
*        ( id = 3 nombre = 'Ratón' precio = 25 stock = 30 )
*        ( id = 4 nombre = 'Webcam' precio = 80 stock = 15 )
*    ).
*
*    DATA(ls_producto) = lt_producto[ id = 2 ].
*    out->write( ls_producto ).
*
*    DATA(lv_nombre) = lt_producto[ id = 3 ]-nombre.
*    out->write( lv_nombre ).
*
*    DATA(lv_precio) = lt_producto[ id = 1 ]-precio.
*    out->write( lv_precio ).
*
*    ls_producto = lt_producto[ 4 ].
*    out->write( ls_producto ).
*
*    "Reto
*    out->write( 'TRY - CATCH' ).
*    TRY.
*        ls_producto = lt_producto[ id = 99 ].
*
*      CATCH cx_sy_itab_line_not_found INTO DATA(lx_error).
*        out->write( lx_error->get_text(  ) ).
*    ENDTRY.
*
*    out->write( 'LINE_EXISTS' ).
*    IF line_exists( lt_producto[ id = 99 ] ).
*      ls_producto = lt_producto[ id = 99 ].
*    ELSE.
*      out->write( 'No existe ese id' ).
*    ENDIF.
*
*
*    out->write( 'OPTIONAL' ).
*    ls_producto = VALUE #( lt_producto[ id = 99 ] OPTIONAL ).
*    out->write( ls_producto ).
*
*    out->write( 'DEFAULT' ).
*    ls_producto = VALUE #( lt_producto[ id = 99 ]
*        DEFAULT VALUE #( id = 0
*                         nombre = 'NO ENCONTRADO'
*                         precio = 0
*                         stock = 0 ) ).
*    out->write( ls_producto ).


    "Ejercicio 11 line_index( )
*    TYPES: BEGIN OF ty_candidatos,
*             id         TYPE i,
*             nombre     TYPE string,
*             puntuacion TYPE i,
*           END OF ty_candidatos.
*
*
*    DATA lt_candidatos TYPE TABLE OF ty_candidatos.
*
*    lt_candidatos = VALUE #(
*       ( id = 10 nombre = 'Ana' puntuacion = 7 )
*       ( id = 20 nombre = 'Carlos' puntuacion = 5 )
*       ( id = 30 nombre = 'Marta' puntuacion = 9 )
*       ( id = 40 nombre = 'Juan' puntuacion = 8 )
*    ).
*
*    DATA(lv_posicion) = line_index( lt_candidatos[ id = 30 ] ).
*    out->write( |Posicion del candidato de id 30: { lv_posicion }\n| ).
*
*    IF NOT line_exists( lt_candidatos[ id = 99 ] ).
*      out->write( 'Candidato no encintrado' ).
*    ENDIF.


*    "Ejercicio 12
* TYPES: BEGIN OF ty_candidatos,
*             id         TYPE i,
*             nombre     TYPE string,
*             puntuacion TYPE i,
*           END OF ty_candidatos,
*
*           BEGIN OF ty_candidatos_peque,
*             nombre     TYPE string,
*             puntuacion TYPE i,
*           END OF ty_candidatos_peque.
*
*
*    DATA lt_candidatos TYPE TABLE OF ty_candidatos.
*    DATA lt_seleccionados TYPE TABLE OF ty_candidatos_peque.
*
*    lt_candidatos = VALUE #(
*       ( id = 1 nombre = 'Ana' puntuacion = 8 )
*       ( id = 2 nombre = 'Carlos' puntuacion = 5 )
*       ( id = 3 nombre = 'Marta' puntuacion = 9 )
*       ( id = 4 nombre = 'Juan' puntuacion = 6 )
*       ( id = 5 nombre = 'Lucía' puntuacion = 10 )
*    ).
*
*    lt_seleccionados = VALUE #(
*      FOR ls_cand IN lt_candidatos WHERE ( puntuacion >= 8 )
*      ( nombre     = ls_cand-nombre
*        puntuacion = ls_cand-puntuacion )
*    ).
*
*    out->write( lt_seleccionados ).


    "Ejercicio 13 FALLO
*    TYPES: BEGIN OF ty_productos,
*             nombre   TYPE string,
*             precio   TYPE decfloat34,
*             cantidad TYPE i,
*           END OF ty_productos,
*
*           tt_producto TYPE STANDARD TABLE OF ty_productos WITH EMPTY KEY.
*
*    DATA(lt_producto) = VALUE tt_producto(
*    ( nombre = 'Monitor' precio = '250.00' cantidad = 2 )
*    ( nombre = 'Teclado' precio = '50.00' cantidad = 3 )
*    ( nombre = 'Ratón' precio = '25.00' cantidad = 4 )
*    ( nombre = 'Portátil' precio = '900.00' cantidad = 2 )
*    ).
*
*    TYPES: BEGIN OF ty_calculos,
*             nombre      TYPE string,
*             subtotal    TYPE decfloat34,
*             descuento   TYPE decfloat34,
*             total_final TYPE i,
*           END OF ty_calculos,
*
*           tt_calculos TYPE STANDARD TABLE OF ty_calculos WITH EMPTY KEY.
*
*   data(lt_calculos) = VALUE tt_calculos(
*      FOR ls_prod IN lt_producto let (
*
*      lv_subtotal = ls_prod-precio * ls_prod-cantidad
*      lv_descuento = 10 / 100
*      lv_total_final = lv_subtotal - ( lv_subtotal * lv_descuento )
*
*      in
*      (
*      nombre     = ls_prod-nombre
*      subtotal = lv_subtotal
*      descuento = lv_descuento
*      total_final = lv_total_final )
*      )
*    ).

    "Ejercicio 14 Referencias (punteros)
*    TYPES: BEGIN OF ty_candidato,
*             id         TYPE i,
*             nombre     TYPE string,
*             puntuacion TYPE i,
*           END OF ty_candidato.
*
*    DATA(ls_candidato) = VALUE ty_candidato(
*      id         = 1
*      nombre     = 'Ana'
*      puntuacion = 7
*    ).
*
*    DATA(lr_candidato) = REF #( ls_candidato ).
*
*    lr_candidato->puntuacion = 9.
*    out->write( 'Original' ).
*    out->write( ls_candidato ).
*
*    "Reto
*    out->write( '-----------------------------------------------------------' ).
*    DATA lt_candidatos TYPE TABLE OF ty_candidato.
*    lt_candidatos = VALUE #(
*      ( id = 2 nombre = 'Carlos' puntuacion = 6 )
*      ( id = 3 nombre = 'Marta'  puntuacion = 9 )
*      ( id = 4 nombre = 'Javier' puntuacion = 8 )
*      ( id = 5 nombre = 'Elena'  puntuacion = 10 )
*     ).
*
*    DATA(lr_candidato2) = REF #( lt_candidatos[ id = 2 ] ).
*
*    lr_candidato2->puntuacion = 50.
*    out->write( lt_candidatos ).


    "Ejercicio 15 XSDBOOL()
    DATA(lv_edad)        = 28.
    DATA(lv_experiencia) = 4.
    DATA(lv_puntuacion)  = 8.

    DATA(lv_apto) = xsdbool( lv_edad >= 18 AND lv_experiencia >= 3 AND lv_puntuacion >= 7 ).
    out->write( lv_apto ).

  ENDMETHOD.
ENDCLASS.
