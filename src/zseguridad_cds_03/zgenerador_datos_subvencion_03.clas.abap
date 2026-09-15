CLASS zgenerador_datos_subvencion_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zgenerador_datos_subvencion_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT zsubv_agr_03 FROM TABLE @( VALUE #(
  ( id_subvencion = 'S001' agricultor = 'Antonio Ruiz' comarca = 'MAR' importe = 12000 estado = 'P' )
  ( id_subvencion = 'S002' agricultor = 'Maria Lopez' comarca = 'CAM' importe =  8500 estado = 'A' )
  ( id_subvencion = 'S003' agricultor = 'Jose Garcia' comarca = 'MAR' importe = 15000 estado = 'A' )
  ( id_subvencion = 'S004' agricultor = 'Carmen Perez' comarca = 'SIE' importe =  7000 estado = 'P' )
  ( id_subvencion = 'S005' agricultor = 'Manuel Diaz' comarca = 'CAM' importe = 11000 estado = 'R' )
  ( id_subvencion = 'S006' agricultor = 'Ana Romero' comarca = 'SIE' importe =  9500 estado = 'A' )
) ).


  ENDMETHOD.
ENDCLASS.
