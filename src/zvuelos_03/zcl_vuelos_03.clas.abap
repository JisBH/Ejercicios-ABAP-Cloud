CLASS zcl_vuelos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vuelos_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    "Ejercicio 1
*    SELECT * FROM /dmo/flight INTO TABLE @DATA(lt_vuelos).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.
*
*
*    "Ejercicio 2
*    SELECT carrier_id, connection_id, price  FROM /dmo/flight INTO TABLE @DATA(lt_vuelos2).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos2 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 3
*    SELECT carrier_id, connection_id, flight_date, price
*    FROM /dmo/flight
*    WHERE carrier_id = 'LH' INTO TABLE @DATA(lt_vuelos3).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos3 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 4
*    SELECT carrier_id, connection_id, price  FROM /dmo/flight
*    WHERE PRICE > 5000 INTO TABLE @DATA(lt_vuelos4).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos4 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 5
*    SELECT CARRIER_ID, CONNECTION_ID, PLANE_TYPE_ID, SEATS_MAX
*    FROM /dmo/flight WHERE PLANE_TYPE_ID = 'A380-800'
*    INTO TABLE @DATA(lt_vuelos5).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos5 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


    "Ejercicio 6
*    SELECT * FROM /dmo/flight WHERE PRICE < 1000
*    INTO TABLE @DATA(lt_vuelos6).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos6 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 7
*    SELECT CARRIER_ID, CONNECTION_ID, SEATS_MAX, SEATS_OCCUPIED
*    FROM /dmo/flight WHERE SEATS_OCCUPIED > division(SEATS_MAX(9, 10, 1 ) )
*    INTO TABLE @DATA(lt_vuelos7).


*    "Ejercicio 8
*    SELECT * FROM /dmo/flight WHERE currency_code = 'EUR' OR currency_code = 'USD'
*    ORDER BY PRICE DESCENDING
*    INTO TABLE @DATA(lt_vuelos7).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos7 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 9
*    SELECT * FROM /dmo/flight
*    WHERE carrier_id IN ( 'SQ', 'UA', 'LH' )
*    AND plane_type_id = '767-200'
*    ORDER BY carrier_id ASCENDING, price DESCENDING
*    INTO TABLE @DATA(lt_vuelos8).
*
*    IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos8 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.


*    "Ejercicio 10
*    SELECT CARRIER_ID, CONNECTION_ID, FLIGHT_DATE, PRICE, SEATS_MAX
*    FROM /dmo/flight WHERE ( PRICE BETWEEN 2000 AND 6000 ) AND CARRIER_ID <> 'AA'
*    AND SEATS_MAX > 200 ORDER BY PRICE ASCENDING
*    INTO TABLE @DATA(lt_vuelos9).
*
*     IF sy-subrc = 0.
*      out->write( 'Lectura correcta' ).
*      out->write( lt_vuelos9 ).
*    ELSE.
*      out->write( 'Lectura erronea' ).
*    ENDIF.




  ENDMETHOD.
ENDCLASS.
