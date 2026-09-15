@AccessControl.authorizationCheck: #MANDATORY
@EndUserText.label: 'Pedidos protegidos mediante DCL'

define view entity ZI_PEDIDO_DCL_03
  as select from zpedido_dcl_03
{
    key pedido_id   as PedidoId,
        descripcion as Descripcion,
        zona        as Zona
}
