INTERFACE zif_flight_manager_03
  PUBLIC .
  TYPES: ty_aerolinea TYPE c LENGTH 2,
         ty_precio    TYPE p DECIMALS 2 LENGTH 8,

         BEGIN OF ty_vuelos,
           aerolinea     TYPE c LENGTH 2,
           num_vuelo     TYPE int4,
           origen        TYPE c LENGTH 3,
           destino       TYPE c LENGTH 3,
           precio        TYPE ty_precio,
           plazas_libres TYPE i,
         END OF ty_vuelos,

         tt_vuelos TYPE SORTED TABLE OF ty_vuelos WITH NON-UNIQUE KEY aerolinea.


  METHODS:
    add_flight IMPORTING i_ls_vuelos TYPE ty_vuelos RAISING zcx_flight_error_03,
    get_flights_by_airline IMPORTING i_cod       TYPE ty_aerolinea
                           EXPORTING o_lt_vuelos TYPE tt_vuelos,
    get_cheapest_flight RETURNING VALUE(rv_ls_vuelo) TYPE tt_vuelos,
    get_total_revenue RETURNING VALUE(rv_facturacion) TYPE ty_precio.
ENDINTERFACE.
