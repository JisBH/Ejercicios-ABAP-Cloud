@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista de ayuda para los penalti'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS 
define view entity ZL_DESPLEGABLE 
   as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
    p_domain_name : 'ZDIRECCION_BALON_03'
  )
{
    @ObjectModel.text.element: ['Descripcion']
    @UI.textArrangement: #TEXT_ONLY
    key value_low as Direccion,

    @Semantics.text: true
    text          as Descripcion
}
where language = $session.system_language
