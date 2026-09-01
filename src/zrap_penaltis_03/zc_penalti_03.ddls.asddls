@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZPENALTI_03'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PENALTI_03
  provider contract transactional_query
  as projection on ZR_PENALTI_03
  association [1..1] to ZR_PENALTI_03 as _BaseEntity on $projection.NumLanzamiento = _BaseEntity.NumLanzamiento
{
  key NumLanzamiento,
  Lanzador,
  DireccionDisparo,
  Portero,
  DireccionPortero,
  Resultado,
  Color,
  
  @Semantics: {
    user.createdBy: true
  }
  CreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  CreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
