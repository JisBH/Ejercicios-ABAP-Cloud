@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS medio de vuelos'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_medio_03
  with parameters
    p_fecha : abap.numc( 8 )
  as select from /dmo/flight  as f
    inner join   /dmo/carrier as c on f.carrier_id = c.carrier_id

{
  @Semantics.amount.currencyCode: 'moneda'
  avg( f.price as abap.curr(16,2) ) as media_precio,
  @Semantics.amount.currencyCode: 'moneda'
  max( f.price )                    as precio_max,
  @Semantics.amount.currencyCode: 'moneda'
  min( f.price )                    as precio_min,
  count( * )                        as num_vuelos,
  f.currency_code                   as moneda
}

where
  f.flight_date > $parameters.p_fecha
group by
  c.name,
  f.currency_code
