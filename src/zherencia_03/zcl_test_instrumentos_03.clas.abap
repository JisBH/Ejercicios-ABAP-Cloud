CLASS zcl_test_instrumentos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    METHODS:
      mostrar_mensaje IMPORTING i_resultado TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA lr_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.


CLASS zcl_test_instrumentos_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    me->lr_out = out.

    "Paso 1
    DATA(lo_guitarra) = NEW zcl_guitarra_03( i_marca_guitarra = 'Yamaha' i_num_cuerdas = 6 ).

    "Paso 2
    DATA(lo_piano) = NEW zcl_piano_03( i_marca_piano = 'Roland' i_electrico = abap_true ).

    "Paso 3, debe fallar porque no exite la cuerda 8
    DATA(lv_exito) = lo_guitarra->afinar_cuerda( EXPORTING i_num_cuerdas = 8 ).
    mostrar_mensaje( EXPORTING i_resultado = lv_exito ).

    "Paso 4, debe funcionar
    lv_exito = lo_guitarra->afinar_cuerda( EXPORTING i_num_cuerdas = 3 ).
    mostrar_mensaje( EXPORTING i_resultado = lv_exito ).

    "Paso 5 debe fallar porque tiene 0 horas de uso
    lv_exito = lo_piano->pedalear(  ).
    mostrar_mensaje( EXPORTING i_resultado = lv_exito ).

    "Paso 6
    lo_piano->registrar_practica( i_horas = 2 ).

    "Paso 7 debe funcionar
    lv_exito = lo_piano->pedalear(  ).
    mostrar_mensaje( EXPORTING i_resultado = lv_exito ).

    "Paso 8
    lo_guitarra->registrar_practica( i_horas = 1 ).

    "Paso 9
    DATA(num_horas) = lo_guitarra->consultar_horas_uso(  ).
    out->write( |Num horas guitarra: { num_horas }| ).
    num_horas = lo_piano->consultar_horas_uso(  ).
    out->write( |Num horas piano: { num_horas }| ).
  ENDMETHOD.


  METHOD mostrar_mensaje.
    IF i_resultado.
      me->lr_out->write( 'El metodo ha funcionado' ).
    ELSE.
      me->lr_out->write( 'El metodo ha fallado' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
