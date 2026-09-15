CLASS zcl_flight_manager_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_flight_manager_03 .
    METHODS:
      constructor IMPORTING i_lt_vuelos TYPE zif_flight_manager_03=>tt_vuelos OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA lt_vuelos TYPE zif_flight_manager_03=>tt_vuelos.
ENDCLASS.



CLASS zcl_flight_manager_03 IMPLEMENTATION.

  METHOD constructor.

    IF i_lt_vuelos IS NOT INITIAL.
      me->lt_vuelos = i_lt_vuelos.
    ENDIF.

  ENDMETHOD.


  METHOD zif_flight_manager_03~add_flight.

    IF i_ls_vuelos-precio >= 0 AND
    NOT line_exists( me->lt_vuelos[ aerolinea = i_ls_vuelos-aerolinea num_vuelo = i_ls_vuelos-num_vuelo ] ).
      INSERT i_ls_vuelos INTO TABLE me->lt_vuelos.
    ELSE.
      RAISE EXCEPTION TYPE zcx_flight_error_03.
    ENDIF.

  ENDMETHOD.


  METHOD zif_flight_manager_03~get_cheapest_flight.

    IF me->lt_vuelos IS INITIAL.
      RETURN.
    ENDIF.

    DATA(ls_mejor_vuelo) = REDUCE #(
      INIT ls_temp = me->lt_vuelos[ 1 ]
      FOR ls_vuelo IN me->lt_vuelos
      NEXT ls_temp = COND #( WHEN ls_vuelo-precio < ls_temp-precio
                             THEN ls_vuelo
                             ELSE ls_temp )
    ).

    rv_ls_vuelo = VALUE #( ( ls_mejor_vuelo ) ).

  ENDMETHOD.


  METHOD zif_flight_manager_03~get_flights_by_airline.

    o_lt_vuelos = FILTER #( lt_vuelos WHERE aerolinea = i_cod ).

  ENDMETHOD.


  METHOD zif_flight_manager_03~get_total_revenue.

    rv_facturacion = REDUCE #(
        INIT total TYPE zif_flight_manager_03=>ty_precio
        FOR ls_vuelo IN me->lt_vuelos
        NEXT total = total + ls_vuelo-precio
        ).

  ENDMETHOD.

ENDCLASS.
