CLASS LHC_ZR_DBEMBARAZO_03 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrDbembarazo03
        RESULT result,
      calcularFechaParto FOR DETERMINE ON MODIFY
            keys FOR ZrDbembarazo03~calcularFechaParto.
ENDCLASS.

CLASS LHC_ZR_DBEMBARAZO_03 IMPLEMENTATION.

  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD calcularFechaParto.
    " 1. Leemos los registros que han disparado la determinación
    READ ENTITIES OF ZR_DBEMBARAZO_03 IN LOCAL MODE
      ENTITY ZrDbembarazo03
        FIELDS ( FechaUltimaRegla )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_embarazos).

    DATA: lt_update TYPE TABLE FOR UPDATE ZR_DBEMBARAZO_03.

    " 2. Procesamos cada paciente
    LOOP AT lt_embarazos INTO DATA(ls_embarazo) WHERE FechaUltimaRegla IS NOT INITIAL.

      " Hacemos el calculo de la fecha aumentando en 9 meses
      ls_embarazo-FechaProbableParto = ls_embarazo-FechaUltimaRegla + 270.

      " 3. Preparamos el registro para actualizar la entidad
                      " Identificador único para RAP
      APPEND VALUE #( %tky                 = ls_embarazo-%tky
                      FechaProbableParto   = ls_embarazo-FechaProbableParto
                      " Indicar que quiero modificar este campo
                      %control-FechaProbableParto = if_abap_behv=>mk-on ) TO lt_update.
    ENDLOOP.

    " 4. Modificamos la entidad (en memoria / draft) con el nuevo valor
    IF lt_update IS NOT INITIAL.
      MODIFY ENTITIES OF ZR_DBEMBARAZO_03 IN LOCAL MODE
        ENTITY ZrDbembarazo03
          UPDATE FIELDS ( FechaProbableParto )
          WITH lt_update
        REPORTED DATA(ls_reported).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
