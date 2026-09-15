CLASS zgenerador_datos_pedidos_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zgenerador_datos_pedidos_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT zpedido_dcl_03 FROM TABLE @( VALUE #(
     ( pedido_id = 'P001' descripcion = 'Ordenadores' zona = 'SUR' )
     ( pedido_id = 'P002' descripcion = 'Monitores' zona = 'NOR' )
     ( pedido_id = 'P003' descripcion = 'Teclados' zona = 'SUR' )
     ( pedido_id = 'P004' descripcion = 'Servidores' zona = 'CEN' )
     ( pedido_id = 'P005' descripcion = 'Ratones' zona = 'NOR' )
    ) ).

  ENDMETHOD.
ENDCLASS.
