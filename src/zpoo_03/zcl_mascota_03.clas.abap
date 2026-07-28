CLASS zcl_mascota_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor,
      comer,
      jugar,
      consultar_estado EXPORTING ov_lleno   TYPE i
                                 ov_energia TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: lleno   TYPE i,
          energia TYPE i.
ENDCLASS.



CLASS zcl_mascota_03 IMPLEMENTATION.

  METHOD constructor.
    me->energia = 100.
    me->lleno = 0.
  ENDMETHOD.

  METHOD comer.
    IF lleno + 20 <= 100.
      me->lleno += 20.
    ELSE.
      me->lleno = 100.
    ENDIF.
  ENDMETHOD.

  METHOD jugar.
    IF me->energia >= 20.
      IF me->energia - 15 < 0.
        me->energia = 0.
      ELSE.
        me->energia -= 15.
      ENDIF.

      IF me->lleno - 10 < 0.
        me->lleno = 0.
      ELSE.
        me->lleno -= 10.
      ENDIF.

    ENDIF.
  ENDMETHOD.

  METHOD consultar_estado.
    ov_energia = me->energia.
    ov_lleno = me->lleno.
  ENDMETHOD.

ENDCLASS.
