@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS avanzado de vuelos'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_avanzado_03
  with parameters
    p_fecha : abap.dats
  as select from /dmo/booking as b
  association [1..1] to /dmo/customer as c on c.customer_id = b.customer_id

{
  @Semantics.amount.currencyCode: 'moneda'
  sum( b.flight_price ) as importe_total,
  c.first_name          as nombre,
  c.last_name           as apellido,
  count( * )            as num_reservas,
  b.currency_code       as moneda,

  case
  when sum( b.flight_price ) > 5000 then 'VIP'
  when sum( b.flight_price ) >= 1000 then 'Frecuente'
  else  'Ocasional'
  end                   as tipo_cliente
}

where
  b.booking_date > $parameters.p_fecha
group by
  c.first_name,
  c.last_name,
  b.currency_code
