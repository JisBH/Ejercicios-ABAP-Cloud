CLASS zcl_test_candidato_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_candidato_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_datos_base,
             tipo_cand          TYPE c LENGTH 1, " I = Interno, E = Externo
             nombre             TYPE string,
             experiencia        TYPE i,
             certificaciones    TYPE i,
             salario_pretendido TYPE decfloat34,
           END OF ty_datos_base,

           tt_datos_base TYPE STANDARD TABLE OF ty_datos_base WITH DEFAULT KEY.


    DATA(lt_datos_base) = VALUE tt_datos_base(
      ( tipo_cand = 'I' nombre = 'Ana Garcia'   experiencia = 5 salario_pretendido = '38000' )
      ( tipo_cand = 'I' nombre = 'Luis Perez'   experiencia = 8 salario_pretendido = '42000' )
      ( tipo_cand = 'E' nombre = 'Eva Mendez'   experiencia = 4 salario_pretendido = '35000' certificaciones = 2 )
      ( tipo_cand = 'E' nombre = 'Max Gonzalez' experiencia = 2 salario_pretendido = '28000' certificaciones = 1 )
    ).


    TYPES tt_candidatos TYPE STANDARD TABLE OF REF TO zcl_candidato_03 WITH DEFAULT KEY.

    " Transformamos los datos base en instancias de objetos polimórficos
    DATA(lt_candidatos) = VALUE tt_candidatos(
      FOR ls_base IN lt_datos_base (
        COND #( WHEN ls_base-tipo_cand = 'I'
                THEN CAST zcl_candidato_03( NEW zcl_candidato_interno_03(
                          iv_nombre      = ls_base-nombre
                          iv_experiencia = ls_base-experiencia
                          iv_salario     = ls_base-salario_pretendido ) )
                ELSE CAST zcl_candidato_03( NEW zcl_candidato_externo_03(
                          iv_nombre      = ls_base-nombre
                          iv_experiencia = ls_base-experiencia
                          iv_salario     = ls_base-salario_pretendido
                          iv_certif      = ls_base-certificaciones ) )
        )
      )
    ).


    out->write( '--- IDONEIDAD INICIAL ---' ).
    LOOP AT lt_candidatos INTO DATA(lo_candidato).

      DATA(lv_idoneidad) = lo_candidato->calcular_idoneidad( ).
      out->write( |{ lo_candidato->get_nombre( ) }: { lv_idoneidad } / 10| ).
    ENDLOOP.



    lt_candidatos[ 1 ]->anadir_puntos_entrevista( 15 ).
    lt_candidatos[ 3 ]->anadir_puntos_entrevista( 20 ).

    out->write( |\n--- COMPARATIVA (Idoneidad final) ---| ).
    DATA(lv_ganador) = lt_candidatos[ 1 ]->comparar_con( lt_candidatos[ 3 ] ).
    out->write( |Ganador entre { lt_candidatos[ 1 ]->get_nombre( ) } y { lt_candidatos[ 3 ]->get_nombre( ) }: { lv_ganador }| ).



    TYPES: BEGIN OF ty_candidato_completo,
             nombre_completo TYPE string,
             idoneidad       TYPE i,
             banda_salarial  TYPE string,
             estado          TYPE string,
           END OF ty_candidato_completo,
           tt_candidato_completo TYPE STANDARD TABLE OF ty_candidato_completo WITH DEFAULT KEY.

    TYPES: BEGIN OF ty_ficha_candidato,
             nombre_candidato TYPE string,
             idoneidad_final  TYPE i,
             banda_salarial   TYPE string,
           END OF ty_ficha_candidato,
           tt_ficha_candidato TYPE STANDARD TABLE OF ty_ficha_candidato WITH DEFAULT KEY.


    DATA(lt_completos) = VALUE tt_candidato_completo(
      FOR lo_cand IN lt_candidatos (
        nombre_completo = lo_cand->get_nombre( )
        idoneidad       = lo_cand->obtener_idoneidad_final( )
        banda_salarial  = lo_cand->calcular_banda_salarial( )
        estado          = 'Procesado'
      )
    ).


    DATA(lt_fichas) = CORRESPONDING tt_ficha_candidato( lt_completos
      MAPPING
        nombre_candidato = nombre_completo
        idoneidad_final  = idoneidad

    ).


    SORT lt_fichas BY idoneidad_final DESCENDING.

    out->write( |\n--- RANKING FINAL DE CANDIDATOS ---| ).
    out->write( lt_fichas ).
  ENDMETHOD.
ENDCLASS.
