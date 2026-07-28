CLASS zcl_extintor_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING i_valor TYPE i,
      usar,
      consultar_carga RETURNING VALUE(rv_carga) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carga TYPE i.
ENDCLASS.



CLASS zcl_extintor_03 IMPLEMENTATION.

  METHOD constructor.
    me->carga = i_valor.
  ENDMETHOD.

  METHOD consultar_carga.
    rv_carga = me->carga.
  ENDMETHOD.

  METHOD usar.
    IF me->carga >= 35.
      me->carga -= 35.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
