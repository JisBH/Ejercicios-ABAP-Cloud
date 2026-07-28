CLASS zcl_prueba_main_avion_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_prueba_main_avion_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Declara el objeto / la instacia
    DATA lo_avion TYPE REF TO zcl_prueba_avion_03.

    " Crea la instancia -> Llama al constructor
    CREATE OBJECT lo_avion EXPORTING i_asientos_max = 100.
    DATA(lo_avion_2) = NEW zcl_prueba_avion_03( i_asientos_max = 100 ).
    DATA(lo_avion_3) = NEW zcl_prueba_avion_03( 100 ).

    DO 17 TIMES.
      lo_avion->embarcar_pasajero( ).
    ENDDO.

    DATA(lv_ocupacion) = lo_avion->get_ocupacion( ).

    " Pinta por pantalla
    out->write( |El avión tiene { lv_ocupacion } asientos ocupados| ).

  ENDMETHOD.
ENDCLASS.
