CLASS zcl_test_dron_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_dron_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_dron) = NEW zcl_dron_03( i_carga_max = 200 ).
    DATA: bateria      TYPE i,
          carga_actual TYPE i,
          modo_reserva TYPE abap_bool.


    DATA(lv_exito) = lo_dron->recoger_pedido( EXPORTING i_peso = 100 ).
    IF lv_exito.
      out->write( 'El paquete se ha recogido correctamente' ).
    ELSE.
      out->write( 'Ha habido un problema recogiendo el paquete' ).
    ENDIF.


    DO 20 TIMES.

      lv_exito = lo_dron->volar_a_cliente( ).
      IF lv_exito.
        out->write( 'El paquete se ha entregado correctamente' ).
      ELSE.
        out->write( 'Ha habido un problema entregando el paquete' ).
      ENDIF.

      lo_dron->consultar_estado( IMPORTING o_bateria = bateria
                                        o_carga_actual = carga_actual
                                        o_modo_reserva = modo_reserva ).

      out->write( |Bateria: { bateria } Carga actual: { carga_actual } Modo reserva: { modo_reserva }| ).

    ENDDO.

    lo_dron->recargar( ).

  ENDMETHOD.
ENDCLASS.
