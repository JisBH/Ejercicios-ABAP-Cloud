@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS básico de vuelos'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_vuelos_basico_03 as select from /dmo/carrier as c
{
c.carrier_id,
c.name,
c.currency_code
    
}
