CLASS zcl_test_colombinas_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_colombinas_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lo_caseta          TYPE REF TO zcl_atraccion_03,
          lo_atraccion_feria TYPE REF TO zcl_atraccion_03,
          lo_concierto       TYPE REF TO zcl_atraccion_03,
          lt_atracciones     TYPE TABLE OF REF TO zcl_atraccion_03.

    lo_caseta = NEW zcl_caseta_03( 'Caseta 1' ).
    lo_atraccion_feria = NEW zcl_atraccion_feria_03( i_nombre_atraccion_feria = 'Atraccion de feria 1' i_precio = '3.00' ).
    lo_concierto = NEW zcl_concierto_03( 'Concierto 1' ).

    APPEND lo_caseta TO lt_atracciones.
    APPEND lo_atraccion_feria TO lt_atracciones.
    APPEND lo_concierto TO lt_atracciones.

    LOOP AT lt_atracciones INTO DATA(lo_atraccion).
      lo_atraccion->recibir_visitante(  ).
      out->write( |Nombre de la atraccion: { lo_atraccion->consultar_nombre(  ) }| ).
      out->write( |Precio de la entrada: { lo_atraccion->calcular_precio_entrada(  ) }| ).
    ENDLOOP.

    DO 500 TIMES.
      lo_concierto->recibir_visitante(  ).
    ENDDO.

    out->write( |Precio de la entrada del concierto: { lo_concierto->calcular_precio_entrada(  ) }| ).

  ENDMETHOD.
ENDCLASS.
