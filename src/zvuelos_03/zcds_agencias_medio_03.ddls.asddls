@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS medio de agencias'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_agencias_medio_03
  with parameters
    p_pais : abap.char(3)
  as select from /dmo/travel  as t
    inner join   /dmo/booking as b on t.travel_id = b.travel_id
    inner join   /dmo/agency  as a on a.agency_id = t.agency_id
{
  count (*)                                as num_total_reservas,
  @Semantics.amount.currencyCode: 'currency_code'
  avg( b.flight_price as abap.curr(16,2) ) as media,
  @Semantics.amount.currencyCode: 'currency_code'
  sum( b.flight_price )                    as suma_precio,
  b.currency_code                          as currency_code,
  a.country_code                           as pais
}
where
  a.country_code = $parameters.p_pais
group by
  a.name,
  b.currency_code,
  a.country_code
