@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS de prueba'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PRUEBA_03 
with parameters p_fecha : abap.dats
    as select from zpedido_00  as p
    inner join   zcliente_00 as c on p.cliente_id = c.cliente_id

{
  c.nombre,
  sum( p.importe ) as suma,
  avg( p.importe as abap.dec(10,2) ) as media,
  max( p.importe ) as maximo,
  min( p.importe ) as minimo, 
  count( * ) as numero_productos,
  
  case 
  when sum( p.importe ) < 500 then 'Manta'
  when sum( p.importe ) < 1000 then 'Normal'
  else 'Premium'
  end as tipo_cliente
}

where p.fecha > $parameters.p_fecha

group by
  c.nombre
