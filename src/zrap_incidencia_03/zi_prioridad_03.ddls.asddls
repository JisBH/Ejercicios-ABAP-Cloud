@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ayuda para la prioridad'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_PRIORIDAD_03 as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
    p_domain_name : 'ZDO_PRIORIDAD'
  )
{
    @ObjectModel.text.element: ['Descripcion']
    key value_low as Prioridad,

    @Semantics.text: true
    text          as Descripcion
}
where language = $session.system_language
