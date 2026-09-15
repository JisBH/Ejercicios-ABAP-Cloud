CLASS lhc_zr_z0303travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrZ0303travel
        RESULT result,

      setInitialStatus FOR DETERMINE ON SAVE
       keys FOR ZrZ0303travel~setInitialStatus.
ENDCLASS.

CLASS lhc_zr_z0303travel IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD setInitialStatus.

    " Modificamos los viajes
    MODIFY ENTITIES OF zr_z0303travel IN LOCAL MODE
      ENTITY ZrZ0303travel
        UPDATE FIELDS ( Status )
        WITH VALUE #(
          FOR key IN keys
          (
            %tky = key-%tky
            Status = 'N'
          )
        ).

  ENDMETHOD.

ENDCLASS.
