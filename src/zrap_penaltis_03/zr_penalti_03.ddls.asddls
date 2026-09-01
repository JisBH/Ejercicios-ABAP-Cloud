@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPENALTI_03'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PENALTI_03
  as select from zpenalti_03
{
  key num_lanzamiento as NumLanzamiento,
  lanzador as Lanzador,
  direccion_disparo as DireccionDisparo,
  portero as Portero,
  direccion_portero as DireccionPortero,
  resultado as Resultado,
  
  case resultado
        when 'Gol' then 3
        else 1
        end                 as Color,
  
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
