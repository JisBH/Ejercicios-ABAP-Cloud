CLASS lhc_zr_incidencia_03 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrIncidencia03
        RESULT result,

      InicializarIncidencia FOR DETERMINE ON MODIFY
       keys FOR ZrIncidencia03~InicializarIncidencia,
      CerrarIncidencia FOR MODIFY
       keys FOR ACTION ZrIncidencia03~CerrarIncidencia RESULT result.
ENDCLASS.

CLASS lhc_zr_incidencia_03 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD InicializarIncidencia.
    " Leemos todas las incidencias recibidas
    READ ENTITIES OF zr_incidencia_03 IN LOCAL MODE
      ENTITY ZrIncidencia03
        FIELDS ( Estado FechaAlta )
        WITH CORRESPONDING #( keys )
      RESULT DATA(incidencias).

    " Modificamos todas las incidencias
    MODIFY ENTITIES OF zr_incidencia_03 IN LOCAL MODE
      ENTITY ZrIncidencia03
        UPDATE FIELDS ( Estado FechaAlta )
        WITH VALUE #(
          FOR incidencia IN incidencias
          (
            %tky = incidencia-%tky

            Estado =
              COND #(
                WHEN incidencia-Estado IS INITIAL
                THEN 'N'
                ELSE incidencia-Estado
              )

            FechaAlta =
              COND #(
                WHEN incidencia-FechaAlta IS INITIAL
                THEN cl_abap_context_info=>get_system_date( )
                ELSE incidencia-FechaAlta
              )
          )
        ).
  ENDMETHOD.

  METHOD CerrarIncidencia.
    MODIFY ENTITIES OF zr_incidencia_03 IN LOCAL MODE
      ENTITY ZrIncidencia03
        UPDATE FIELDS ( Estado FechaCierre )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky        = key-%tky
            Estado      = 'C'
            FechaCierre = cl_abap_context_info=>get_system_date( )
          )
        ).

    READ ENTITIES OF zr_incidencia_03 IN LOCAL MODE
      ENTITY ZrIncidencia03
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(incidencias).

    result = VALUE #(
      FOR incidencia IN incidencias
      (
        %tky   = incidencia-%tky
        %param = incidencia
      )
    ).
  ENDMETHOD.

ENDCLASS.
