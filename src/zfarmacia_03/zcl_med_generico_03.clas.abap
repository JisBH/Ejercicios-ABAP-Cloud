CLASS zcl_med_generico_03 DEFINITION
  PUBLIC
  INHERITING FROM zcl_medicamento_03
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: porcentaje_descuento TYPE i.
    METHODS:
      constructor IMPORTING
                    i_id                   TYPE i
                    i_nombre               TYPE string
                    i_laboratorio          TYPE string
                    i_precio               TYPE zdecimals2
                    i_stock                TYPE i
                    i_requiere_receta      TYPE abap_bool
                    i_principio_activo     TYPE string
                    i_porcentaje_descuento TYPE i,

      calcular_precio_final REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_med_generico_03 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_id = i_id i_nombre = i_nombre i_laboratorio = i_laboratorio
                        i_precio = i_precio i_stock = i_stock i_requiere_receta = i_requiere_receta
                        i_principio_activo = i_principio_activo ).
    porcentaje_descuento = i_porcentaje_descuento.
  ENDMETHOD.

  METHOD calcular_precio_final.
    rv_precio = super->calcular_precio_final( ) * ( 1 - porcentaje_descuento / 100 ).
  ENDMETHOD.



ENDCLASS.
