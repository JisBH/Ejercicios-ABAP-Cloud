CLASS zcl_planta_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          i_nombre           TYPE string
          i_stock_disponible TYPE i
          i_nivel_riego      TYPE i,

      vender IMPORTING i_cantidad TYPE i
             RAISING   zcx_jardineria_03,

      regar.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: nombre           TYPE string,
          stock_disponible TYPE i,
          nivel_riego      TYPE i.
ENDCLASS.


CLASS zcl_planta_03 IMPLEMENTATION.


  METHOD constructor.
    nombre = i_nombre.
    stock_disponible = i_stock_disponible.
    nivel_riego = i_nivel_riego.
  ENDMETHOD.

  METHOD regar.
    nivel_riego += 1.
  ENDMETHOD.

  METHOD vender.
    IF stock_disponible < i_cantidad.
      RAISE EXCEPTION TYPE zcx_jardineria_03
       EXPORTING
          textid = VALUE #( msgid = 'ZMSG_JARDINERIA_03'
                           msgno = '001'
                           attr1 = ''
                           attr2 = ''
                           attr3 = ''
                           attr4 = '' ).

    ELSEIF nivel_riego < 20.
      RAISE EXCEPTION TYPE zcx_jardineria_03
      EXPORTING
          textid = VALUE #( msgid = 'ZMSG_JARDINERIA_03'
                           msgno = '002'
                           attr1 = ''
                           attr2 = ''
                           attr3 = ''
                           attr4 = '' ).

    ELSE.
      stock_disponible -= i_cantidad.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
