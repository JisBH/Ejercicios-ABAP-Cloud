CLASS zcl_test_jardineria_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_jardineria_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  " Planta con stock y riego iniciales
    DATA(lo_planta) = NEW zcl_planta_03(
      i_nombre           = 'Ficus'
      i_stock_disponible = 10
      i_nivel_riego      = 25
    ).

    TRY.
        lo_planta->vender( i_cantidad = 3 ).
        MESSAGE ID 'ZMSG_JARDINERIA_03' TYPE 'I' NUMBER 003 INTO DATA(lv_mensaje).
        out->write( lv_mensaje ).
       CATCH zcx_jardineria_03 INTO DATA(lx_ex1).
        out->write( lx_ex1->get_text( ) ).

    ENDTRY.


    " Planta para fallo por stock insuficiente
    DATA(lo_planta_sin_stock) = NEW zcl_planta_03(
      i_nombre           = 'Monstera'
      i_stock_disponible = 2
      i_nivel_riego      = 25
    ).

    TRY.
        lo_planta_sin_stock->vender( i_cantidad = 5 ).
      CATCH zcx_jardineria_03 INTO DATA(lx_ex2).
        out->write( lx_ex2->get_text( ) ).
    ENDTRY.


    " Planta para fallo por riego insuficiente (< 20)
    DATA(lo_planta_sin_riego) = NEW zcl_planta_03(
      i_nombre           = 'Cactus'
      i_stock_disponible = 10
      i_nivel_riego      = 10
    ).

    TRY.
        lo_planta_sin_riego->vender( i_cantidad = 2 ).
      CATCH zcx_jardineria_03 INTO DATA(lx_ex3).
        out->write( lx_ex3->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
