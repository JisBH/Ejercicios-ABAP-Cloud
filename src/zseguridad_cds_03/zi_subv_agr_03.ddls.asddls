
@AccessControl.authorizationCheck: #MANDATORY
@EndUserText.label: 'CDS de subvenciones'

define view entity ZI_SUBV_AGR_03
  as select from zsubv_agr_03
{
  key id_subvencion as Id,
      agricultor,
      comarca,
      importe,
      estado
}
