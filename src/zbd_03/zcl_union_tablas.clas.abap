CLASS zcl_union_tablas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_union_tablas IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    SELECT SINGLE agency_id FROM /dmo/travel_m
*    WHERE travel_id = '00000001'
*    INTO @DATA(lv_id_agencia).
*
*    IF sy-subrc = 0.
*
*      SELECT SINGLE name FROM /dmo/agency
*      WHERE agency_id = @lv_id_agencia
*      INTO @DATA(lv_nombre_agencia).
*
*      IF sy-subrc = 0.
*
*        out->write( |Nombre de la agencia { lv_nombre_agencia }| ).
*
*      ELSE.
*        out->write( 'Lectura de tabla agencia erronea' ).
*      ENDIF.
*
*    ELSE.
*      out->write( 'Lectura de tabla viaje erronea' ).
*    ENDIF.


*    TYPES: BEGIN OF ty_salida,
*             first_name    TYPE /dmo/customer-first_name,
*             last_name     TYPE /dmo/customer-last_name,
*             travel_id     TYPE /dmo/travel-travel_id,
*             begin_date    TYPE /dmo/travel-begin_date,
*             total_price   TYPE /dmo/travel-total_price,
*             currency_code TYPE /dmo/travel-currency_code,
*           END OF ty_salida.
*
*    DATA: ls_salida TYPE ty_salida,
*          lt_salida TYPE TABLE OF ty_salida.
*
*    SELECT customer_id, travel_id, begin_date, total_price, currency_code
*    FROM /dmo/travel INTO TABLE @DATA(lt_travel).
*
*    SELECT customer_id, first_name, last_name
*    FROM /dmo/customer INTO TABLE @DATA(lt_customer).
*
*    LOOP AT lt_travel INTO DATA(ls_travel).
*      READ TABLE lt_customer INTO DATA(ls_customer) WITH KEY customer_id = ls_travel-customer_id.
*      IF sy-subrc = 0.
*        ls_salida-first_name = ls_customer-first_name.
*        ls_salida-last_name = ls_customer-last_name.
*        ls_salida-travel_id = ls_travel-travel_id.
*        ls_salida-begin_date = ls_travel-begin_date.
*        ls_salida-total_price = ls_travel-total_price.
*        ls_salida-currency_code = ls_travel-currency_code.
*
**       Lo mismo que lo de arriba, para que funcione los campos de ls_salida tienen que llamarse igual
**       y ser del mismo tipo que los otros lt
**       MOVE-CORRESPONDING ls_customer TO ls_salida.
**       MOVE-CORRESPONDING ls_travel TO ls_salida.
*        APPEND ls_salida TO lt_salida.
*
*      ENDIF.
*    ENDLOOP.
*
*    IF sy-subrc = 0.
*      out->write( lt_salida ).
*    ELSE.
*      out->write( 'Error en el loop' ).
*    ENDIF.



    "Ejercicio 1 con JOIN

*    SELECT
*    FROM /dmo/flight AS f INNER JOIN /dmo/carrier AS c ON f~carrier_id = c~carrier_id
*    FIELDS
*        c~name,
*        f~connection_id,
*        f~flight_date,
*        f~price,
*        f~currency_code,
*        f~plane_type_id
*
*    WHERE f~price > 5000
*    ORDER BY f~price DESCENDING
*    INTO TABLE @DATA(lt_resultado).
*
*    IF sy-subrc = 0.
*        out->write( lt_resultado ).
*    ELSE.
*        out->write( 'FALLO en la consulta' ).
*    ENDIF.


    "Ejercicio 2 con JOIN

*    SELECT
*    FROM /dmo/booking AS b INNER JOIN /dmo/customer AS c ON b~customer_id = c~customer_id
*    FIELDS
*        c~first_name,
*        c~last_name,
*        b~travel_id,
*        b~booking_id,
*        b~booking_date
*
*    INTO TABLE @DATA(lt_resultado2).
*
*    IF sy-subrc = 0.
*      out->write( lt_resultado2 ).
*    ELSE.
*      out->write( 'FALLO en la consulta' ).
*    ENDIF.


    "Ejercicio 3 con JOIN

*    SELECT FROM /dmo/booking AS b
*    INNER JOIN /dmo/flight AS f
*        ON b~carrier_id = f~carrier_id
*            and b~connection_id = f~connection_id
*            and b~flight_date = f~flight_date
*    INNER JOIN /dmo/carrier AS c
*        ON f~carrier_id = c~carrier_id
*
*    FIELDS  c~name,
*            f~connection_id,
*            f~flight_date,
*            f~plane_type_id,
*            b~booking_id
*            INTO TABLE @DATA(lt_salida_3).
*    IF sy-subrc = 0.
*      out->write( lt_salida_3 ).
*    ENDIF.


    "Ejercicio 4 con JOIN

*    SELECT FROM /dmo/agency AS a
*
*    INNER JOIN /dmo/travel AS t
*        ON a~agency_id = t~agency_id
*
*    INNER JOIN /dmo/booking AS b
*        ON t~travel_id = b~travel_id
*
*    FIELDS
*       a~name
*
*    WHERE b~customer_id = '000555' AND b~connection_id = '0322'
*    INTO TABLE @DATA(lt_resultado4).
*
*    IF sy-subrc = 0.
*      out->write( lt_resultado4 ).
*    ENDIF.


    "Ejercicio 5 con JOIN

    SELECT FROM /dmo/travel AS t
    INNER JOIN /dmo/agency AS a
        ON a~agency_id = t~agency_id
    FIELDS
        a~name,
        t~status,
        t~travel_id,
        t~begin_date

   INTO TABLE @DATA(lt_resultado5).

   IF sy-subrc = 0.
      out->write( lt_resultado5 ).
    ENDIF.

    "Ejercicio 6 con JOIN

*    SELECT FROM /dmo/airport AS a
*
*    FIELDS


  ENDMETHOD.

ENDCLASS.

