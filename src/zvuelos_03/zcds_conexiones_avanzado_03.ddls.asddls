@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS avanzado de conexiones'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_conexiones_avanzado_03
  with parameters
    p_distancia : abap.dec(9,2)
  as select from /dmo/connection as co
    inner join   /dmo/carrier    as ca on co.carrier_id = ca.carrier_id
{
  avg( co.distance as abap.dec(12,2)) as media_distancia,
  count(*)                            as num_conexiones,

  case
  when avg( co.distance as abap.dec(12,2)) < 1000 then 'Corta'
  when avg( co.distance as abap.dec(12,2)) <= 5000 then 'Media'
  else 'Larga'
  end                                 as tipo_ruta
}
where
  co.distance > $parameters.p_distancia
group by
  co.airport_from_id
