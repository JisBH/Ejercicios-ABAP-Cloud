@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS básico de clientes'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_clientes_basico_03
  as select from /dmo/customer as c
    inner join   I_CountryText as t on c.country_code = t.Country
{
  key c.customer_id,
      concat_with_space( c.first_name, c.last_name,1 ) as nombre,
      c.city                                           as ciudad,
      c.country_code                                   as codPais,
      t.CountryName                                    as nombrePais
}
where
  t.Language = 'S'
