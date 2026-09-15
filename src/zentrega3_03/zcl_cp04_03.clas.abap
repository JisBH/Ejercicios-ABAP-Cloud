CLASS zcl_cp04_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp04_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

* ANÁLISIS DEL MODELO ACTUAL (ESTRUCTURA TY_RESERVA)

*   Absolutamente todos los campos están usando tipos elementales
*   genéricos de ABAP (i, c, int4, string, d, p). No hay
*   ninguna referencia al Diccionario de Datos (DDIC).
*
*   Beneficios de usar Elementos de Datos (DDIC) por campo:

*    - AEROLINEA: ayuda de búsqueda y validación de integridad
*                 contra una tabla de valores.

*    - NUM_VUELO: textos y posible ayuda de búsqueda vinculada a la aerolínea.

*    - PASAJERO: sustituir "string" por un CHAR limitado en
*                DDIC, aportando etiquetas como "Nombre del Pasajero".

*    - FECHA: usar un tipo fecha del DDIC, el sistema proporciona
*             automáticamente el calendario desplegable en las pantallas.

*    - PRECIO: beneficio de formato numérico de moneda y vinculación a un
*              campo de clave de moneda (CUKY).

*    - ESTADO: el mayor beneficio sería conectarlo a un Dominio con
*              "Valores Fijos" (ej: 'C' Confirmada, 'P' Pendiente, 'X' Cancelada),
*              lo que crea un menú desplegable automático en la interfaz.



    DATA(lt_reservas) = VALUE ZTT_BOOKINGS_03(

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


    " Tarea 2.2 Modificaciones
    out->write( |\nTarea 2.2 Modificaciones:| ).
    lt_reservas[ id_reserva = 3 ]-precio = '480.00'.

    LOOP AT lt_reservas ASSIGNING FIELD-SYMBOL(<ls_reservas>) WHERE aerolinea = 'LH'.
      <ls_reservas>-precio *= '0.9'.
    ENDLOOP.

    out->write( lt_reservas ).


    " Tarea 2.3 Cancelaciones y borrados
    out->write( |\nTarea 2.3 Cancelaciones y borrados:| ).

    lt_reservas[ id_reserva = 4 ]-estado = 'C'.
    DELETE lt_reservas WHERE estado = 'C'.

    out->write( lt_reservas ).


    " Tarea 2.4 Búsquedas
    out->write( |\nTarea 2.4 Búsquedas:| ).

    READ TABLE lt_reservas WITH KEY pasajero = 'Lisa Tan' TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      out->write( 'Se ha encontrado una reserva para Lisa Tan.' ).
    ELSE.
      out->write( 'No existe reserva para Lisa Tan.' ).
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


*   TAREA 4.6: REFLEXIÓN

* 1. ¿Qué ventajas tiene usar tipos del diccionario frente a tipos locales?
*     - Cualquier programa, clase o interfaz del sistema puede usarlos.

*     - Si mañana el ID de reserva pasa de 4 a 6 caracteres, se cambia en el diccionario y todo el sistema
*      (tablas, clases, programas) se actualiza automáticamente.
*
* 2. ¿En qué escenarios seguirías usando TYPES locales?
*    - Para variables o tablas puramente temporales y de cálculo interno
*      dentro de un método (que no se devuelven ni se reciben como parámetro).

*    - Para evitar "ensuciar" el Diccionario de Datos global con estructuras
*      que solo tienen sentido para la lógica interna de una clase concreta.

*    - Principio de encapsulación: ocultar estructuras de datos al resto
*      del sistema si no necesitan conocerlas.
*
* 3. Relación entre Elementos de datos y Dominios (Clásico vs Cloud):
*    - En ABAP Clásico, la arquitectura es de dos niveles:
*       Dominio: Define las características TÉCNICAS (ej. CHAR, 1 byte)
*       y restricciones de valor (ej. valores fijos 'A' y 'C').
*       Elemento de Datos: Define la SEMÁNTICA (etiquetas de texto,
*       documentación) y apunta a un Dominio (o a un tipo base).

*    - En ABAP Cloud: Los Dominios y Elementos de Datos siguen siendo la base del diccionario.
*      Sin embargo, en el desarrollo moderno Cloud (RAP/CDS), gran parte
*      de la "semántica" (textos y ayudas de búsqueda) se puede definir
*      directamente mediante anotaciones en las vistas CDS, haciendo que a
*      veces los Dominios clásicos pasen a un segundo plano, aunque
*      técnicamente siguen ahí.

  ENDMETHOD.
ENDCLASS.
