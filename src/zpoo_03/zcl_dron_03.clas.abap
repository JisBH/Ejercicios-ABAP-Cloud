CLASS zcl_dron_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING i_carga_max TYPE i,

      recoger_pedido IMPORTING i_peso          TYPE i
                     RETURNING VALUE(rv_exito) TYPE abap_bool,

      volar_a_cliente RETURNING VALUE(rv_exito) TYPE abap_bool,

      recargar,

      consultar_estado EXPORTING o_bateria      TYPE i
                                 o_carga_actual TYPE i
                                 o_modo_reserva TYPE abap_bool.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA: bateria      TYPE i,
          carga_max    TYPE i,
          carga_actual TYPE i,
          modo_reserva TYPE abap_bool.
ENDCLASS.



CLASS zcl_dron_03 IMPLEMENTATION.

  METHOD constructor.
    me->carga_max = i_carga_max.
    me->bateria = 100.
    me->carga_actual = 0.
    me->modo_reserva = abap_false.
  ENDMETHOD.


  METHOD recoger_pedido.
    IF NOT me->modo_reserva.
      IF i_peso + me->carga_actual <= me->carga_max AND me->bateria >= 20.
        me->carga_actual += i_peso.
        rv_exito = abap_true.

      ELSE.
        rv_exito = abap_false.
      ENDIF.
      "Si esta en modo reserva directamente devuelvo false
    ELSE.
      rv_exito = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD volar_a_cliente.
    DATA lv_consumo TYPE i.

    " Si está en modo reserva, no vuela
    IF me->modo_reserva = abap_true.
      rv_exito = abap_false.
      RETURN.
    ENDIF.

    " Determinamos el consumo según la carga
    IF me->carga_actual > 0.
      lv_consumo = 15.
    ELSE.
      lv_consumo = 5.
    ENDIF.

    " Si hay batería suficiente, vuela
    IF me->bateria >= lv_consumo.
      me->bateria -= lv_consumo.
      rv_exito = abap_true.
      me->carga_actual = 0.

      " Si despues de volar tiene un 10% de bateria o menos activa el modo de reserva
      IF me->bateria <= 10.
        me->modo_reserva = abap_true.
      ENDIF.

    " No hay batería suficiente
    ELSE.
      rv_exito = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD recargar.
    me->bateria = 100.
    me->modo_reserva = abap_false.
  ENDMETHOD.


  METHOD consultar_estado.
    o_bateria = me->bateria.
    o_carga_actual = me->carga_actual.
    o_modo_reserva = me->modo_reserva.
  ENDMETHOD.

ENDCLASS.
