@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZDBEMBARAZO_03'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_DBEMBARAZO_03
  as select from ZDBEMBARAZO_03
{
  key id_seguimiento as IdSeguimiento,
  nombre_paciente as NombrePaciente,
  fecha_ultima_regla as FechaUltimaRegla,
  fecha_probable_parto as FechaProbableParto,
  semana_gestacion as SemanaGestacion,
  grupo_sanguineo as GrupoSanguineo,
  factor_rh as FactorRh,
  nivel_riesgo as NivelRiesgo,
  estado as Estado,
  peso_actual as PesoActual,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  unidad_peso as UnidadPeso,
  proxima_revision as ProximaRevision,
  observaciones as Observaciones,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
