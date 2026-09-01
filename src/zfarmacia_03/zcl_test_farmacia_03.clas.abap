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
    LOOP AT lt_medicamentos INTO DATA(ls_medicamentos).
      DATA(lv_categoria) = COND string(
      WHEN ls_medicamentos-stock >= 30 THEN 'STOCK ALTO'
      WHEN ls_medicamentos-stock >= 10 THEN 'STOCK MEDIO'
      WHEN ls_medicamentos-stock >= 1 THEN 'STOCK BAJO'
      ELSE 'SIN STOCK' ).
      out->write( |id: { ls_medicamentos-id } categoria: { lv_categoria }| ).
    ENDLOOP.


    LOOP AT lt_medicamentos ASSIGNING FIELD-SYMBOL(<fs_medicamentos>).
      <fs_medicamentos>-tipo = SWITCH string(
      <fs_medicamentos>-tipo
      WHEN 'G' THEN 'General'
      WHEN 'M' THEN 'Marca' ).
    ENDLOOP.

    out->write( lt_medicamentos ).


  ENDMETHOD.
ENDCLASS.
