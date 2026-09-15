CLASS zcl_cp02_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp02_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_reserva,
             id_reserva TYPE i,
             aerolinea  TYPE c LENGTH 2,
             num_vuelo  TYPE int4,
             pasajero   TYPE string,
             fecha      TYPE d,
             precio     TYPE p DECIMALS 2 LENGTH 8,
             estado     TYPE c LENGTH 1,
           END OF ty_reserva.

    TYPES tty_reservas TYPE HASHED TABLE OF ty_reserva WITH UNIQUE KEY id_reserva.

    DATA(lt_reservas) = VALUE tty_reservas(

      ( id_reserva = 1
        aerolinea  = 'LH'
        num_vuelo  = 0400
        pasajero   = 'Ana García'
        fecha      = '20260515'
        precio     = '899.00'
        estado     = 'A' )

      ( id_reserva = 2
        aerolinea  = 'IB'
        num_vuelo  = 3740
        pasajero   = 'Carlos López'
        fecha      = '20260515'
        precio     = '120.00'
        estado     = 'A' )

      ( id_reserva = 3
        aerolinea  = 'AA'
        num_vuelo  = 0017
        pasajero   = 'John Smith'
        fecha      = '20260520'
        precio     = '454.50'
        estado     = 'A' )

      ( id_reserva = 4
        aerolinea  = 'LH'
        num_vuelo  = 0455
        pasajero   = 'María Pérez'
        fecha      = '20260520'
        precio     = '310.75'
        estado     = 'A' )

      ( id_reserva = 5
        aerolinea  = 'IB'
        num_vuelo   = 3740
        pasajero   = 'Pedro Ruiz'
        fecha      = '20260515'
        precio     = '120.00'
        estado     = 'C' )

      ( id_reserva = 6
        aerolinea  = 'SQ'
        num_vuelo  = 0026
        pasajero   = 'Lisa Tan'
        fecha      = '20260601'
        precio     = '1250.00'
        estado     = 'A' )

      ( id_reserva = 7
        aerolinea  = 'LH'
        num_vuelo  = 0400
        pasajero   = 'Hans Müller'
        fecha      = '20260515'
        precio     = '899.00'
        estado     = 'A' )

      ( id_reserva = 8
        aerolinea  = 'AA'
        num_vuelo  = 0064
        pasajero   = 'Sarah Jones'
        fecha      = '20260525'
        precio     = '510.00'
        estado     = 'A' )

    ).

    " Tarea 2.1 Altas de reserva
    " Forma moderna, programación funcional
    out->write( |Tarea 2.1 Altas de reserva:\n| ).
    lt_reservas = VALUE #(
       BASE lt_reservas
        ( id_reserva = 9
        aerolinea  = 'IB'
        num_vuelo  = 3950
        pasajero   = 'Elena Martín'
        fecha      = '20260601'
        precio     = '275.30'
        estado     = 'A' )

        ( id_reserva = 10
        aerolinea  = 'LH'
        num_vuelo  = 2030
        pasajero   = 'Franz Weber'
        fecha      = '20260610'
        precio     = '95.00'
        estado     = 'A' )
     ).

    out->write( lt_reservas ).

    " Forma clásica, programación procedimental
*    DATA ls_reserva TYPE ty_reserva.
*    ls_reserva-id_reserva = 9.
*    ls_reserva-aerolinea = 'IB'.
*    ls_reserva-num_vuelo = 3950.
*    ls_reserva-pasajero = 'Elena Martín'.
*    ls_reserva-fecha = '20260601'.
*    ls_reserva-precio = '275.30'.
*    ls_reserva-estado = 'A'.
*
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva-id_reserva = 10.
*    ls_reserva-aerolinea = 'LH'.
*    ls_reserva-num_vuelo = 2030.
*    ls_reserva-pasajero = 'Franz Weber'.
*    ls_reserva-fecha = '20260610'.
*    ls_reserva-precio = '95.00'.
*    ls_reserva-estado = 'A'.
*
*    APPEND ls_reserva TO lt_reservas.
*
*    out->write( lt_reservas ).


    " Tarea 2.2 Modificaciones
    out->write( |\nTarea 2.2 Modificaciones:| ).
    lt_reservas[ id_reserva = 3 ]-precio = '480.00'.

    LOOP AT lt_reservas ASSIGNING FIELD-SYMBOL(<ls_reservas>) WHERE aerolinea = 'LH'.
      <ls_reservas>-precio *= '0.9'.
    ENDLOOP.

    out->write( lt_reservas ).


    " Tarea 2.3 Cancelaciones y borrados
    out->write( |\nTarea 2.3 Cancelaciones y borrados:| ).

*   READ TABLE lt_reservas INTO DATA(ls_reserva) WITH KEY id_reserva = 4.
*   ls_reserva-estado = 'C'.

    lt_reservas[ id_reserva = 4 ]-estado = 'C'.
    DELETE lt_reservas WHERE estado = 'C'.

    out->write( lt_reservas ).


    " Tarea 2.4 Búsquedas
    out->write( |\nTarea 2.4 Búsquedas:| ).

    READ TABLE lt_reservas WITH KEY pasajero = 'Lisa Tan' TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      out->write( '1. Se ha encontrado una reserva para Lisa Tan.' ).
    ELSE.
      out->write( '1. No existe reserva para Lisa Tan.' ).
    ENDIF.

    READ TABLE lt_reservas REFERENCE INTO DATA(lr_reserva) WITH KEY id_reserva = 6.
    IF sy-subrc = 0.
      out->write( |ID 6 -> Pasajero: { lr_reserva->pasajero }, Vuelo: { lr_reserva->num_vuelo }| ).
    ENDIF.

    out->write( VALUE #( lt_reservas[ id_reserva = 1 ]-pasajero OPTIONAL ) ).


    " Tarea 2.5 Agrupación y agregados
    out->write( |\nTarea 2.5 Agrupación y agregados:| ).

    SELECT aerolinea,
    COUNT( * ) AS num_reservas,
    SUM( precio ) AS precio_total,
    AVG( precio ) AS precio_medio
    FROM @lt_reservas AS reservas
    GROUP BY aerolinea
    INTO TABLE @DATA(lt_informe).

    out->write( lt_informe ).

  ENDMETHOD.
ENDCLASS.
