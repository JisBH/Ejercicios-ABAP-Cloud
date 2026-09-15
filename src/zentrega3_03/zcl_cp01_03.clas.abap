CLASS zcl_cp01_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp01_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_vuelos,
             aerolinea     TYPE c LENGTH 2,
             num_vuelo     TYPE int4,
             origen        TYPE c LENGTH 3,
             destino       TYPE c LENGTH 3,
             precio        TYPE p DECIMALS 2 LENGTH 8,
             plazas_libres TYPE i,
           END OF ty_vuelos,

           BEGIN OF ty_vuelos_categoria,
             aerolinea     TYPE string,
             num_vuelo     TYPE int4,
             origen        TYPE string,
             destino       TYPE string,
             precio        TYPE p DECIMALS 2 LENGTH 8,
             plazas_libres TYPE i,
             categoria     TYPE string,
           END OF ty_vuelos_categoria,

           BEGIN OF ty_transformacion,
             codigo   TYPE string,
             destino  TYPE string,
             longitud TYPE i,
           END OF ty_transformacion.

    DATA lt_vuelos TYPE STANDARD TABLE OF ty_vuelos WITH EMPTY KEY.
    DATA lt_vuelos_categoria TYPE STANDARD TABLE OF ty_vuelos_categoria WITH EMPTY KEY.
    DATA lt_vuelos_filtrados TYPE STANDARD TABLE OF ty_vuelos_categoria WITH EMPTY KEY.
    DATA lt_vuelos_transformados TYPE STANDARD TABLE OF ty_transformacion WITH EMPTY KEY.

    lt_vuelos = VALUE #(
        ( aerolinea = 'LH' num_vuelo = 0400 origen = 'FRA' destino = 'JFK' precio = '899.00' plazas_libres = 15 )
        ( aerolinea = 'AA' num_vuelo = 0017 origen = 'JFK' destino = 'SFO' precio = '450.50' plazas_libres = 0  )
        ( aerolinea = 'IB' num_vuelo = 3740 origen = 'MAD' destino = 'BCN' precio = '120.00' plazas_libres = 42 )
        ( aerolinea = 'LH' num_vuelo = 0455 origen = 'FRA' destino = 'MAD' precio = '310.75' plazas_libres = 8  )
        ( aerolinea = 'AA' num_vuelo = 0064 origen = 'SFO' destino = 'JFK' precio = '510.00' plazas_libres = 3  )
        ( aerolinea = 'IB' num_vuelo = 3950 origen = 'BCN' destino = 'LHR' precio = '275.30' plazas_libres = 0  )
        ( aerolinea = 'LH' num_vuelo = 2030 origen = 'MUC' destino = 'FRA' precio = '95.00'  plazas_libres = 60 )
        ( aerolinea = 'SQ' num_vuelo = 0026 origen = 'SIN' destino = 'FRA' precio = '1250.00' plazas_libres = 5 )
     ).

    " Tarea 1.1 Clasificación por precio
    out->write( |Clasificación por precio:| ).

    lt_vuelos_categoria = VALUE #(
      FOR ls_vuelo IN lt_vuelos
      (
        VALUE #(
          BASE CORRESPONDING #( ls_vuelo )
          categoria = COND string(
                        WHEN ls_vuelo-precio > 1000 THEN 'First Class'
                        WHEN ls_vuelo-precio >= 500  THEN 'Premium'
                        WHEN ls_vuelo-precio >= 150 THEN 'Estándar'
                        ELSE 'Económico' )
        )
      )
    ).

    out->write( lt_vuelos_categoria ).


    " Tarea 1.2 Filtrado con operadores lógicos
    out->write( |\nFiltrado con operadores lógicos:| ).

    lt_vuelos_filtrados = VALUE #(
        FOR ls_vuelos IN lt_vuelos_categoria
        WHERE ( plazas_libres > 0 AND ( origen = 'FRA' OR destino = 'FRA' ) AND precio <= 1000 )

        ( ls_vuelos )
     ).

    out->write( lt_vuelos_filtrados ).


    " Tarea 1.3 Transformación de cadenas
    out->write( |\nTransformación de cadenas:| ).

    lt_vuelos_transformados = VALUE #(
        FOR ls_vuelos IN lt_vuelos_categoria
         LET codigo_calculado = ls_vuelos-aerolinea && '-' && ls_vuelos-num_vuelo IN
            ( codigo = codigo_calculado
              destino = to_lower( ls_vuelos-destino )
              longitud = strlen( codigo_calculado )
            )
        ).

    out->write( lt_vuelos_transformados ).


    " Tarea 1.4 – Resumen con funciones numéricas
    out->write( |\nResumen con funciones numéricas:| ).

    SELECT
    FROM @lt_vuelos_categoria AS Vuelos
    FIELDS MAX( precio ) AS Precio_Maximo, AVG( precio ) AS Precio_Medio,
        SUM( plazas_libres ) AS total_plazas_libres
    INTO @DATA(lv_resultado).

    out->write( |Precio máximo: { lv_resultado-precio_maximo }| ).
    out->write( |Precio medio: { round( val = lv_resultado-precio_medio dec = 2 ) }| ).
    out->write( |Total de plazas libres: { lv_resultado-total_plazas_libres }| ).


  ENDMETHOD.
ENDCLASS.
