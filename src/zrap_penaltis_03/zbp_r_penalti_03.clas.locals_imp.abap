CLASS LHC_ZR_PENALTI_03 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrPenalti03
        RESULT result,

        nuevo_penalti FOR NUMBERING
       entities FOR CREATE ZrPenalti03,

      calcula_resultado FOR DETERMINE ON SAVE
            keys FOR ZrPenalti03~calcula_resultado.
ENDCLASS.

CLASS LHC_ZR_PENALTI_03 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.

  METHOD nuevo_penalti.

    DATA entity TYPE STRUCTURE FOR CREATE ZR_PENALTI_03.
    "---------------------------------------------------------------------------
    " 1. Separar las entidades que ya tienen número (Drafts)
    "---------------------------------------------------------------------------
    LOOP AT entities INTO entity WHERE NumLanzamiento IS NOT INITIAL.
      " Comunicamos a RAP la correspondencia mediante mapped.
      APPEND VALUE #( %cid      = entity-%cid
                      %key      = entity-%key
                      %is_draft = entity-%is_draft ) TO mapped-zrpenalti03.
    ENDLOOP.


    "---------------------------------------------------------------------------
    " 2. Localizar las partidas que todavía no tienen número
    "---------------------------------------------------------------------------
    DATA(entities_sin_id) = entities.
    DELETE entities_sin_id WHERE NumLanzamiento IS NOT INITIAL.

    IF entities_sin_id IS INITIAL.
      RETURN.
    ENDIF.


    "---------------------------------------------------------------------------
    " 3. Solicitar números al Number Range
    "---------------------------------------------------------------------------
    TRY.
        cl_numberrange_runtime=>number_get(
          EXPORTING
            nr_range_nr = '01'
            object      = 'ZPENALTI03'
            quantity    = CONV #( lines( entities_sin_id ) ) " Pide tantos números como penaltis nuevos.
          IMPORTING
            number            = DATA(numero_final)
            returncode        = DATA(codigo_retorno)
            returned_quantity = DATA(cantidad_devuelta)
        ).

      CATCH cx_number_ranges INTO DATA(error_number_range).
        " Si se produce un problema, utilizamos las estructuras reported y failed[cite: 1].
        " failed informa a RAP de que determinadas instancias no han podido ser procesadas[cite: 1].
        " reported comunica mensajes asociados a las instancias[cite: 1].
        LOOP AT entities_sin_id INTO entity.
          APPEND VALUE #( %cid = entity-%cid
                          %fail-cause = if_abap_behv=>cause-unspecific ) TO failed-zrpenalti03.
        ENDLOOP.
        RETURN.
    ENDTRY.


    "---------------------------------------------------------------------------
    " 4. Verificamos si SAP nos ha proporcionado tantos números como necesitamos[cite: 1].
    "---------------------------------------------------------------------------
    IF cantidad_devuelta <> lines( entities_sin_id ).
      LOOP AT entities_sin_id INTO entity.
        APPEND VALUE #( %cid = entity-%cid
                        %fail-cause = if_abap_behv=>cause-unspecific ) TO failed-zrpenalti03.
      ENDLOOP.
      RETURN.
    ENDIF.


    "---------------------------------------------------------------------------
    " 5. Calcular el primer número reservado[cite: 1].
    "---------------------------------------------------------------------------
    DATA(numero_actual) = CONV i( numero_final ) - CONV i( cantidad_devuelta ).


    "---------------------------------------------------------------------------
    " 6. Asignar el número a cada penalti nuevo
    "---------------------------------------------------------------------------
    LOOP AT entities_sin_id INTO entity.
      numero_actual += 1.

      " Formatear el identificador con 3 posiciones alineado a la derecha y rellenando con ceros[cite: 1].
      entity-NumLanzamiento = |{ numero_actual WIDTH = 3 ALIGN = RIGHT PAD = '0' }|.

      " Comunicar la nueva clave a RAP asociando el identificador temporal (%cid)[cite: 1].
      APPEND VALUE #( %cid      = entity-%cid
                      NumLanzamiento = entity-NumLanzamiento
                      %is_draft = entity-%is_draft ) TO mapped-zrpenalti03.
    ENDLOOP.

  ENDMETHOD.

  METHOD calcula_resultado.

  " Leemos todas las partidas recibidas
    READ ENTITIES OF zr_penalti_03 IN LOCAL MODE
      ENTITY ZrPenalti03
        FIELDS ( DireccionDisparo DireccionPortero )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lanzamientos).

    " Modificamos todas las partidas
    MODIFY ENTITIES OF zr_penalti_03 IN LOCAL MODE
      ENTITY ZrPenalti03
        UPDATE FIELDS ( Resultado )
        WITH VALUE #(
          FOR lanzamiento IN lanzamientos
          (
            %tky = lanzamiento-%tky

            Resultado =
              COND #(
                WHEN lanzamiento-DireccionDisparo = lanzamiento-DireccionPortero THEN 'Parada'
                ELSE 'Gol'
              )

          )
        ).

  ENDMETHOD.

ENDCLASS.
