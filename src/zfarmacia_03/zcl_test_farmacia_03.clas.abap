CLASS zcl_test_farmacia_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_farmacia_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "FASE 1
    TYPES: BEGIN OF ty_medicamento_datos,
             id                   TYPE i,
             nombre               TYPE string,
             laboratorio          TYPE string,
             precio               TYPE zdecimals2,
             stock                TYPE i,
             tipo                 TYPE string,
             requiere_receta      TYPE abap_bool,
             principio_activo     TYPE string,
             coste_interno        TYPE zdecimals2,
             porcentaje_descuento TYPE i,
             nombre_comercial     TYPE string,
             recargo_marca        TYPE i,
           END OF ty_medicamento_datos,

           tt_medicamentos TYPE STANDARD TABLE OF ty_medicamento_datos WITH EMPTY KEY.

    DATA(lt_medicamentos) = VALUE tt_medicamentos(
         ( id = 1 nombre = 'Paracetamol' laboratorio = 'Cinfa' precio = '2.50' stock = 40 tipo = 'G'
         requiere_receta = abap_false principio_activo = 'Paracetamol' coste_interno = '1.20'
         porcentaje_descuento = 10 nombre_comercial = '' recargo_marca = 0 )

         ( id = 2 nombre = 'Ibuprofeno' laboratorio = 'Kern Pharma' precio = '3.80' stock = 15 tipo = 'G'
         requiere_receta = abap_false principio_activo = 'Ibuprofeno' coste_interno = '1.80'
         porcentaje_descuento = 5 nombre_comercial = '' recargo_marca = 0 )

         ( id = 3 nombre = 'Omeprazol' laboratorio = 'Cinfa' precio = '5.10' stock = 25 tipo = 'G'
         requiere_receta = abap_false principio_activo = 'Omeprazol' coste_interno = '2.50'
         porcentaje_descuento = 20 nombre_comercial = '' recargo_marca = 0 )

         ( id = 4 nombre = 'Amoxicilina' laboratorio = 'GSK' precio = '6.20' stock = 8 tipo = 'M'
         requiere_receta = abap_true principio_activo = 'Amoxicilina + clavulánico' coste_interno = '3.10'
         porcentaje_descuento = 0 nombre_comercial = 'Augmentine' recargo_marca = 10 )

         ( id = 5 nombre = 'Acenocumarol' laboratorio = 'Viatris' precio = '4.90' stock = 3 tipo = 'M'
         requiere_receta = abap_true principio_activo = 'Acenocumarol' coste_interno = '2.20'
         porcentaje_descuento = 0 nombre_comercial = 'Sintrom' recargo_marca = 20 )

         ( id = 6 nombre = 'Salbutamol' laboratorio = 'GSK' precio = '6.00' stock = 0 tipo = 'M'
         requiere_receta = abap_true principio_activo = 'Salbutamol' coste_interno = '3.50'
         porcentaje_descuento = 0 nombre_comercial = 'Ventolin' recargo_marca = 15 )
    ).

    "FASE 2
    TYPES: BEGIN OF ty_fase2,
             nombre         TYPE string,
             stock          TYPE i,
             estado         TYPE string,
             tipo           TYPE string,
             disponibilidad TYPE abap_bool,
           END OF ty_fase2.

    DATA lt_fase2 TYPE TABLE OF ty_fase2.
    lt_fase2 = VALUE #(
        FOR ls_medicamento IN lt_medicamentos
            ( nombre = ls_medicamento-nombre
              stock = ls_medicamento-stock

              estado = COND string(
                WHEN ls_medicamento-stock >= 30 THEN 'STOCK ALTO'
                WHEN ls_medicamento-stock >= 10 THEN 'STOCK MEDIO'
                WHEN ls_medicamento-stock >= 1 THEN 'STOCK BAJO'
                ELSE 'SIN STOCK' )

              tipo = SWITCH string(
                  ls_medicamento-tipo
                  WHEN 'G' THEN 'General'
                  WHEN 'M' THEN 'Marca'
                  WHEN 'H' THEN 'Hospitalario'
                  ELSE 'Desconocido'   )

              disponibilidad =  xsdbool( ls_medicamento-stock > 0 AND ls_medicamento-precio > 0 )
            )
        ).

    out->write( lt_fase2 ).

    out->write( lt_medicamentos ).

********** FASE 3

    DATA lv_cantidad_s TYPE string.
    DATA lv_precio_s TYPE string.

    lv_cantidad_s = '12'.
    lv_precio_s = '3.50'.

    DATA lv_resultado TYPE zdecimals2.
    lv_resultado = CONV zdecimals2( lv_cantidad_s ) * CONV zdecimals2( lv_precio_s ).
    out->write( lv_resultado ).

    out->write( 'De entero a decimal ' && CONV zdecimals2( 25 ) ).
    out->write( 'De decimal a entero ' && CONV i( '25.80' ) ).
    out->write( 'ROUND ' && CONV string( round( val = '25.80' dec = 0 ) ) ).
    out->write( 'TRUNC ' && CONV string( trunc( '25.80' ) ) ).
    out->write( 'CEIL ' && CONV string( ceil( '25.80' ) ) ).
    out->write( 'FLOOR ' && CONV string( floor( '25.80' ) ) ).

    out->write( 'ROUND ' && CONV string( round( val = '-25.80' dec = 0 ) ) ).
    out->write( 'TRUNC ' && CONV string( trunc( '-25.80' ) ) ).
    out->write( 'CEIL ' && CONV string( ceil( '-25.80' ) ) ).
    out->write( 'FLOOR ' && CONV string( floor( '-25.80' ) ) ).

********** FASE 4

    out->write( 'EXACT ' && CONV string( EXACT i( '25.00' ) ) ).

    TRY.
        out->write( 'EXACT ' && CONV string( EXACT i( '25.75' ) ) ).
      CATCH cx_sy_conversion_error.
        out->write( 'NO SE PUEDE CONVERTIR 25,75 SIN PERDER INFORMACIÓN' ).
    ENDTRY.

********** FASE 5

    TRY.
        out->write( lt_medicamentos[ id = 3 ] ).
        out->write( lt_medicamentos[ id = 4 ]-nombre ).
        out->write( lt_medicamentos[ id = 2 ]-precio ).
        out->write( lt_medicamentos[ 1 ] ).
        out->write( lt_medicamentos[ 99 ] ).

      CATCH cx_sy_itab_line_not_found.
        out->write( 'MEDICAMENTO NO ENCONTRADO' ).
    ENDTRY.

********** FASE 6

    IF line_exists( lt_medicamentos[ id = 5 ] ).
      out->write( 'Existe' ).
    ELSE .
      out->write( 'NO Existe' ).
    ENDIF.

    out->write( COND string(
        WHEN line_exists( lt_medicamentos[ id = 99 ] ) THEN 'Existe'
        ELSE 'NO Existe'
        ) ).

    out->write( VALUE ty_medicamento_datos( lt_medicamentos[ id = 99 ] OPTIONAL ) ).
    out->write( VALUE ty_medicamento_datos( lt_medicamentos[ id = 99 ]
        DEFAULT VALUE ty_medicamento_datos(
            nombre = 'MEDICAMENTO NO ENCONTRADO' ) ) ).

    out->write( line_index( lt_medicamentos[ id = 3 ] ) ).
    out->write( line_index( lt_medicamentos[ id = 99 ] ) ).

********** FASE 7

    TYPES: BEGIN OF ty_medicamento_publico,
             id          TYPE i,
             nombre      TYPE string,
             laboratorio TYPE string,
             precio      TYPE zdecimals2,
             stock       TYPE i,
           END OF ty_medicamento_publico.

    TYPES tty_medicamentos_publicos TYPE TABLE OF ty_medicamento_publico WITH EMPTY KEY.

    DATA(lt_medicamentos_publicos) = CORRESPONDING tty_medicamentos_publicos( lt_medicamentos ).
    out->write( lt_medicamentos_publicos ).

    TYPES: BEGIN OF tY_MEDICAMENTO_EXTERNO,
             codigo      TYPE i,
             descripcion TYPE string,
             fabricante  TYPE string,
             precio      TYPE zdecimals2,
             unidades    TYPE i,
           END OF tY_MEDICAMENTO_EXTERNO.

    TYPES ttY_MEDICAMENTOS_EXTERNOS TYPE TABLE OF tY_MEDICAMENTO_EXTERNO WITH EMPTY KEY.
    DATA(lt_MEDICAMENTOS_EXTERNOS) = CORRESPONDING ttY_MEDICAMENTOS_EXTERNOS(
        lt_medicamentos
        MAPPING
            Codigo = id
            descripcion = nombre
            fabricante = laboratorio
            unidades = stock
        ).

    out->write( lt_MEDICAMENTOS_EXTERNOS ).


    TYPES: BEGIN OF ty_medicamento_auditoria,
             id            TYPE i,
             nombre        TYPE string,
             precio        TYPE zdecimals2,
             coste_interno TYPE zdecimals2,
           END OF ty_medicamento_auditoria.

    TYPES tty_medicamentos_auditoria TYPE TABLE OF ty_medicamento_auditoria WITH EMPTY KEY.

    DATA(lt_medicamentos_auditoria) = CORRESPONDING tty_medicamentos_auditoria(
            lt_medicamentos
            EXCEPT
            coste_interno ).
    out->write( lt_medicamentos_auditoria ).


********** FASE 8

    DATA(ls_medicamento_8) = lt_medicamentos[ id = 2 ].

    DATA(ls_medicamento_8b) = VALUE ty_medicamento_datos(
        BASE
            ls_medicamento_8
            stock = 35 ).

    out->write( ls_medicamento_8 ).
    out->write( ls_medicamento_8b ).


********** FASE 9

    TYPES: BEGIN OF ty_resumen_medicamento,
             id     TYPE i,
             nombre TYPE string,
             precio TYPE zdecimals2,
             stock  TYPE i,
           END OF ty_resumen_medicamento.

    TYPES tty_RESUMEN_MEDICAMENTOS TYPE TABLE OF ty_RESUMEN_MEDICAMENTO WITH EMPTY KEY.

    DATA(lt_resumen) = VALUE tty_RESUMEN_MEDICAMENTOS(
     FOR ls_medicamento IN lt_medicamentos (
        id = ls_medicamento-id
        nombre = ls_medicamento-nombre
        precio = ls_medicamento-precio
        stock = ls_medicamento-stock ) ).

    out->write( lt_resumen ).

    CLEAR lt_medicamentos_publicos[].
    lt_medicamentos_publicos = VALUE #(
         FOR ls_medicamento IN lt_medicamentos (
            CORRESPONDING #( ls_medicamento )
             ) ) .

    out->write( lt_medicamentos_publicos ).

********** FASE 10

    TYPES: BEGIN OF ty_valor_stock,
             id            TYPE i,
             nombre        TYPE string,
             subtotal      TYPE zdecimals2,
             iva           TYPE zdecimals2,
             total_con_iva TYPE zdecimals2,
           END OF ty_valor_stock.

    TYPES tty_valor_stock TYPE TABLE OF ty_valor_stock WITH EMPTY KEY.

    DATA(lt_valor_stock) = VALUE tty_valor_stock(
     FOR ls_medicamento IN lt_medicamentos

            LET
                lv_subtotal = CONV zdecimals2( ls_medicamento-precio * ls_medicamento-stock )
                lv_iva = CONV zdecimals2( lv_subtotal * '0.04' )
                lv_total = CONV zdecimals2( lv_subtotal + lv_iva )
            IN (
                id = ls_medicamento-id
                nombre = ls_medicamento-nombre
                subtotal = lv_subtotal
                iva = lv_iva
                total_con_iva = lv_total )
            ).

    out->write( lt_valor_stock ).


********** FASE 11


    TYPES tt_medicamentos_por_stock TYPE SORTED TABLE OF ty_medicamento_datos
                                    WITH NON-UNIQUE KEY stock.

    DATA lt_medicamentos_stock TYPE tt_medicamentos_por_stock.
    lt_medicamentos_stock = lt_medicamentos.

    out->write( '--- Ordenado por Stock (6, 5, 4, 2, 3, 1) ---' ).
    out->write( lt_medicamentos_stock ).



    TYPES tt_medicamentos_lab_nom TYPE SORTED TABLE OF ty_medicamento_datos
                                  WITH NON-UNIQUE KEY laboratorio nombre.

    DATA lt_medicamentos_compuesta TYPE tt_medicamentos_lab_nom.
    lt_medicamentos_compuesta = lt_medicamentos.

    out->write( '--- Ordenado por Laboratorio y Nombre ---' ).
    out->write( lt_medicamentos_compuesta ).



    TYPES tt_med_clave_secundaria TYPE STANDARD TABLE OF ty_medicamento_datos
                                  WITH EMPTY KEY
                                  WITH NON-UNIQUE SORTED KEY por_nombre COMPONENTS nombre.

    DATA lt_medicamentos_sec TYPE tt_med_clave_secundaria.
    lt_medicamentos_sec = lt_medicamentos.


    TRY.
        DATA(lv_id_buscado) = lt_medicamentos_sec[ KEY por_nombre nombre = 'Omeprazol' ]-id.
        out->write( '--- Búsqueda por clave secundaria ---' ).
        out->write( |ID: { lv_id_buscado }| ).
      CATCH cx_sy_itab_line_not_found.
        out->write( 'Medicamento no encontrado.' ).
    ENDTRY.


********** FASE 12


*    DATA(lt_iv_stock_bajo) =
*      FILTER #(
*        lt_por_iv_stock
*        USING KEY primary_key
*        WHERE iv_stock <= 10
*      ).
*
*    DATA(lt_iv_stock_mayor_10) =
*      FILTER #(
*        lt_por_iv_stock
*        USING KEY primary_key
*        WHERE iv_stock > 10
*      ).
*
*    out->write(
*      |iv_stock <= 10: { lines( lt_iv_stock_bajo ) } medicamentos|
*    ).
*
*    LOOP AT lt_iv_stock_bajo INTO DATA(ls_bajo).
*      out->write(
*        |{ ls_bajo-iv_nombre } -> { ls_bajo-iv_stock }|
*      ).
*    ENDLOOP.
*
*    out->write(
*      |iv_stock > 10: { lines( lt_iv_stock_mayor_10 ) } medicamentos|
*    ).
*
*    LOOP AT lt_iv_stock_mayor_10 INTO DATA(ls_mayor).
*      out->write(
*        |{ ls_mayor-iv_nombre } -> { ls_mayor-iv_stock }|
*      ).
*    ENDLOOP.

********** FASE 13
    DATA(lv_total_unidades) = REDUCE i(
      INIT total = 0
      FOR ls_med IN lt_medicamentos
      NEXT total = total + ls_med-stock
    ).

    out->write( '--- Total de unidades almacenadas ---' ).
    out->write( |{ lv_total_unidades } unidades| ).


    DATA(lv_valor_total) = REDUCE zdecimals2(
      INIT valor = CONV zdecimals2( 0 )
      FOR ls_med IN lt_medicamentos
      NEXT valor = valor + ( ls_med-precio * ls_med-stock )
    ).

    out->write( '--- Valor total del inventario ---' ).
    out->write( |{ lv_valor_total } €| ).


    FINAL(lv_valor_filtrado) = REDUCE zdecimals2(
      INIT valor_filtro = CONV zdecimals2( 0 )
      FOR ls_med IN lt_medicamentos WHERE ( stock > 10 )
      NEXT valor_filtro = valor_filtro + ( ls_med-precio * ls_med-stock )
    ).

    out->write( '--- Valor de inventario (Stock > 10) ---' ).
    out->write( |{ lv_valor_filtrado } €| ).


********** FASE 14
    " --- GENÉRICOS ---
    DATA(lo_gen1) = NEW zcl_med_generico_03(
      i_id                   = 1
      i_nombre               = 'Paracetamol'
      i_laboratorio          = 'Cinfa'
      i_precio               = '2.50'
      i_stock                = 40
      i_requiere_receta      = abap_false
      i_principio_activo     = 'Paracetamol'
      i_porcentaje_descuento = 10
    ).

    DATA(lo_gen2) = NEW zcl_med_generico_03(
      i_id                   = 2
      i_nombre               = 'Ibuprofeno'
      i_laboratorio          = 'Kern Pharma'
      i_precio               = '3.80'
      i_stock                = 15
      i_requiere_receta      = abap_false
      i_principio_activo     = 'Ibuprofeno'
      i_porcentaje_descuento = 5
    ).

    DATA(lo_gen3) = NEW zcl_med_generico_03(
      i_id                   = 3
      i_nombre               = 'Omeprazol'
      i_laboratorio          = 'Cinfa'
      i_precio               = '5.10'
      i_stock                = 25
      i_requiere_receta      = abap_false
      i_principio_activo     = 'Omeprazol'
      i_porcentaje_descuento = 20
    ).

    " --- MARCA ---
    DATA(lo_mar1) = NEW zcl_med_marca_03(
      i_id                   = 4
      i_nombre               = 'Amoxicilina'
      i_laboratorio          = 'GSK'
      i_precio               = '6.20'
      i_stock                = 8
      i_requiere_receta      = abap_true
      i_principio_activo     = 'Amoxicilina + clavulánico'
      i_nombre_comercial     = 'Augmentine'
      i_recargo_marca        = 10
    ).

    DATA(lo_mar2) = NEW zcl_med_marca_03(
      i_id                   = 5
      i_nombre               = 'Acenocumarol'
      i_laboratorio          = 'Viatris'
      i_precio               = '4.90'
      i_stock                = 3
      i_requiere_receta      = abap_true
      i_principio_activo     = 'Acenocumarol'
      i_nombre_comercial     = 'Sintrom'
      i_recargo_marca        = 20
    ).

    DATA(lo_mar3) = NEW zcl_med_marca_03(
      i_id                   = 6
      i_nombre               = 'Salbutamol'
      i_laboratorio          = 'GSK'
      i_precio               = '6.00'
      i_stock                = 0
      i_requiere_receta      = abap_true
      i_principio_activo     = 'Salbutamol'
      i_nombre_comercial     = 'Ventolin'
      i_recargo_marca        = 15
    ).


    TYPES tt_obj_medicamentos TYPE TABLE OF REF TO zcl_medicamento_03 WITH EMPTY KEY.

    DATA lt_obj_meds TYPE tt_obj_medicamentos.

    lt_obj_meds = VALUE #(
        ( lo_gen1 ) ( lo_gen2 ) ( lo_gen3 )
        ( lo_mar1 ) ( lo_mar2 ) ( lo_mar3 )
    ).

    out->write( '--- Tabla de objetos creada (Upcast automático) ---' ).
    out->write( |Total objetos en la tabla: { lines( lt_obj_meds ) }| ).


    DATA lo_padre TYPE REF TO zcl_medicamento_03.
    lo_padre = lt_obj_meds[ 1 ].

    out->write( '--- Comprobación de acceso a atributos desde el Padre ---' ).

    out->write( |Nombre desde el padre: { lo_padre->nombre }| ).
    out->write( |Precio desde el padre: { lo_padre->precio }| ).


********** FASE 15
    DATA(lo_med_id1) = lt_obj_meds[ 1 ].

    IF lo_med_id1 IS INSTANCE OF zcl_med_generico_03.

      DATA(lo_generico) = CAST zcl_med_generico_03( lo_med_id1 ).

      out->write( '--- Detectar un genérico ---' ).
      out->write( |porcentaje_descuento = { lo_generico->porcentaje_descuento }| ).
    ENDIF.


    DATA(lo_med_id5) = lt_obj_meds[ 5 ].

    IF lo_med_id5 IS INSTANCE OF zcl_med_marca_03.

      DATA(lo_marca) = CAST zcl_med_marca_03( lo_med_id5 ).

      out->write( '--- Detectar un medicamento de marca ---' ).
      out->write( |nombre_comercial = { lo_marca->nombre_comercial }| ).
      out->write( |recargo_marca = { lo_marca->recargo_marca }| ).
    ENDIF.


    DATA(lo_hermano_falso) = lt_obj_meds[ 1 ].

    out->write( '--- CAST incorrecto entre hermanas ---' ).
    TRY.
        DATA(lo_cast_erroneo) = CAST zcl_med_marca_03( lo_hermano_falso ).

      CATCH cx_sy_move_cast_error.
        out->write( 'NO SE PUEDE CONVERTIR UN GENÉRICO EN UN MEDICAMENTO DE MARCA' ).
    ENDTRY.


********** FASE 16

    out->write( '--- Calcular precio final (Polimorfismo puro) ---' ).

    " Recorremos la tabla de referencias tipada con la clase padre
    LOOP AT lt_obj_meds INTO DATA(lo_medicamento).

      DATA(lv_precio_final) = lo_medicamento->calcular_precio_final( ).

      out->write( |{ lo_medicamento->nombre } -> { lv_precio_final } €| ).

    ENDLOOP.


********** FASE 17

    out->write( '--- Modificación de fila mediante referencia (REF) ---' ).

    DATA(lt_copia_ref) = lt_medicamentos.

    DATA(lr_medicamento) = REF #( lt_copia_ref[ id = 2 ] ).

    lr_medicamento->stock = 99.

    out->write( lt_copia_ref ).

  ENDMETHOD.
ENDCLASS.
