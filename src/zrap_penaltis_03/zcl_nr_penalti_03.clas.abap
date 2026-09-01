CLASS zcl_nr_penalti_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_nr_penalti_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_interval TYPE cl_numberrange_intervals=>nr_interval.
    DATA ls_interval TYPE cl_numberrange_intervals=>nr_nriv_line.

    " Configuración del intervalo
    ls_interval-nrrangenr = '01'.      " Nombre del intervalo
    ls_interval-fromnumber = '001'.    " Desde el 001
    ls_interval-tonumber   = '999'.    " Hasta el 999
    ls_interval-procind    = 'I'.      " Indicador de inserción
    APPEND ls_interval TO lt_interval.

    " Crear el intervalo en SAP
    TRY.
        cl_numberrange_intervals=>create(
          EXPORTING
            object    = 'ZPENALTI03' " El nombre del number range object (el contador) del Paso 1
            interval  = lt_interval
          IMPORTING
            error     = DATA(lv_error)
            error_inf = DATA(lv_error2)
        ).

        IF lv_error = abap_false.
          out->write( 'Intervalo creado correctamente para los Penaltis.' ).
        ELSE.
          out->write( 'Error al crear el intervalo.' ).
          out->write( lv_error2 ).
        ENDIF.
      CATCH cx_number_ranges INTO DATA(lx_nr).
        out->write( lx_nr->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
