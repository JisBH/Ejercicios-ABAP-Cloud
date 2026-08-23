@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZDBEMBARAZO_03'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_DBEMBARAZO_03
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_DBEMBARAZO_03
  association [1..1] to ZR_DBEMBARAZO_03 as _BaseEntity on $projection.IDSEGUIMIENTO = _BaseEntity.IDSEGUIMIENTO
{
  key IdSeguimiento,
  NombrePaciente,
  FechaUltimaRegla,
  FechaProbableParto,
  SemanaGestacion,
  GrupoSanguineo,
  FactorRh,
  NivelRiesgo,
  Estado,
  PesoActual,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  UnidadPeso,
  ProximaRevision,
  Observaciones,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
