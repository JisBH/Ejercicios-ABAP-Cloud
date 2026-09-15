CLASS zcl_cp03_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp03_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lo_manager TYPE REF TO zif_flight_manager_03.
    lo_manager = NEW zcl_flight_manager_03( ).


    " Añade al menos 5 vuelos
    out->write( |\n--- AÑADIR VUELOS ---| ).
    TRY.
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'IB' num_vuelo = 1 precio = '150.50' ) ).
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'LH' num_vuelo = 2 precio = '200.00' ) ).
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'IB' num_vuelo = 3 precio = '85.99' ) ).
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'AF' num_vuelo = 4 precio = '320.00' ) ).
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'RY' num_vuelo = 5 precio = '45.00' ) ).
        out->write( '5 vuelos añadidos con éxito.' ).

      CATCH zcx_flight_error_03 INTO DATA(lx_error_add).
        out->write( lx_error_add->get_text( ) ).
    ENDTRY.


    " Intenta añadir un vuelo con precio negativo
    out->write( |\n--- ERROR PRECIO NEGATIVO ---| ).
    TRY.
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'IB' num_vuelo = 6 precio = '-50.00' ) ).

      CATCH zcx_flight_error_03 INTO DATA(lx_error_neg).
        out->write( |Excepción capturada correctamente: { lx_error_neg->get_text( ) }| ).
    ENDTRY.


    " Intenta añadir un vuelo duplicado → captura la excepción
    out->write( |\n--- ERROR VUELO DUPLICADO ---| ).
    TRY.
        lo_manager->add_flight( VALUE zif_flight_manager_03=>ty_vuelos( aerolinea = 'IB' num_vuelo = 3 precio = '150.50' ) ).

      CATCH zcx_flight_error_03 INTO DATA(lx_error_dup).
        out->write( |Excepción capturada correctamente: { lx_error_dup->get_text( ) }| ).
    ENDTRY.


    " Muestra los vuelos de una aerolínea concreta
    out->write( |\n--- VUELOS DE IBERIA (IB) ---| ).
    lo_manager->get_flights_by_airline( EXPORTING i_cod = 'IB' IMPORTING o_lt_vuelos = DATA(lt_vuelos_ib) ).
    out->write( lt_vuelos_ib ).


    " Muestra el vuelo más barato
    out->write( |\n--- VUELO MÁS BARATO ---| ).
    DATA(lt_vuelo_barato) = lo_manager->get_cheapest_flight( ).
    out->write( lt_vuelo_barato ).


    " Muestra la facturación total
    out->write( |\n--- FACTURACIÓN TOTAL ---| ).
    DATA(lv_total) = lo_manager->get_total_revenue( ).
    out->write( |La facturación total es: { lv_total }| ).

  ENDMETHOD.
ENDCLASS.
