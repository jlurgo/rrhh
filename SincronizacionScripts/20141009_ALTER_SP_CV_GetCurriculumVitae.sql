set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CV_GetCurriculumVitae]         
(        
 @idPersona int        
)        
AS        
BEGIN        
  SELECT         
  dp.Id IdPersona,        
  dp.Nombre,        
  dp.Apellido,        
  dp.NroDocumento,      
  dp.TipoDocumento,        
  dpAdd.IdSexo Sexo,        
  dpadd.IdEstadoCivil EstadoCivil,        
  dpadd.CUIL,        
  dpadd.LugarNacimiento,        
  dp.FechaNacimiento,        
  dpadd.IdNacionalidad Nacionalidad,        
  dom_pers.ID_Domicilio DomPers_Id,         
  dom_pers.Calle DomPers_Calle,        
  dom_pers.Número DomPers_Numero,        
  dom_pers.Piso DomPers_Piso,        
  dom_pers.Dpto DomPers_Depto,        
  dom_pers.Localidad DomPers_Localidad,        
  dom_pers.Codigo_Postal DomPers_CodigoPostal,     
  pers_tel1.Telefono DomPers_Telefono,
  pers_tel2.Telefono DomPers_Telefono2,
  pers_email.Email	 DomPers_Email,
------------------------------------------------

    isnull(dom_pers.Provincia, 0) DomPers_IdProvincia,        
        
  dom_lab.ID_Domicilio DomLab_Id,        
  dom_lab.Calle DomLab_Calle,        
  dom_lab.Número DomLab_Numero,        
  dom_lab.Piso DomLab_Piso,        
  dom_lab.Dpto DomLab_Depto,        
  dom_lab.Localidad DomLab_Localidad,        
  dom_lab.Codigo_Postal DomLab_CodigoPostal,        
  isnull(dom_lab.Provincia, 0) DomLab_IdProvincia,        
  CASE         
   WHEN TieneLegajo.idPersona is null THEN 'No tiene legajo'        
   ELSE 'Tiene legajo'        
   END AS TieneLegajo,        
  CASE          
   WHEN cvdp.IdPersona is null THEN 'No tiene curriculum'        
   ELSE 'Tiene curriculum'        
   END AS TieneCurriculum,        
           
  ant_acad.Id IdAntecedentesAcademicos,        
  ant_acad.Titulo AntecedentesAcademicosTitulo,        
  ant_acad.Nivel AntecedentesAcademicosNivel, 
  ant_acad.Anios AntecedentesAcademicosAnios,        
  ant_acad.Establecimiento AntecedentesAcademicosEstablecimiento,        
  ant_acad.Especialidad AntecedentesAcademicosEspecialidad,        
  ant_acad.FechaIngreso AntecedentesAcademicosFechaIngreso,        
  ant_acad.FechaEgreso AntecedentesAcademicosFechaEgreso,        
  ant_acad.Localidad AntecedentesAcademicosLocalidad,        
  ant_acad.Pais AntecedentesAcademicosPais,        
  ant_acad.Baja AntecedentesAcademicosBaja,        
          
  ant_doc.Id IdAntecedentesDeDocencia,        
  ant_doc.Asignatura AntecedentesDeDocenciaAsignatura,        
  ant_doc.CaracterDesignacion AntecedentesDeDocenciaCaracterDesignacion,        
  ant_doc.CargaHoraria AntecedentesDeDocenciaCargaHoraria,        
  ant_doc.CategoriaDocente AntecedentesDeDocenciaCategoriaDocente,        
  ant_doc.DedicacionDocente AntecedentesDeDocenciaDedicacionDocente,        
  ant_doc.Establecimiento AntecedentesDeDocenciaEstablecimiento,        
  ant_doc.NivelEducativo AntecedentesDeDocenciaNivelEducativo,      
  ant_doc.TipoActividad AntecedentesDeDocenciaTipoActividad,        
  ant_doc.FechaInicio AntecedentesDeDocenciaFechaInicio,        
  ant_doc.FechaFinalizacion AntecedentesDeDocenciaFechaFinalizacion,        
  ant_doc.Localidad AntecedentesDeDocenciaLocalidad,        
  ant_doc.Pais AntecedentesDeDocenciaPais,        
  ant_doc.Baja AntecedentesDeDocenciaBaja,        
        
  cap_pers.Id CapacidadesPersonalesId,        
  cap_pers.Tipo CapacidadesPersonalesTipo,        
  cap_pers.Detalle CapacidadesPersonalesDetalle,        
  cap_pers.Baja CapacidadesPersonalesBaja,        
          
  eve_acad.Id EventosAcademicosId,        
  eve_acad.Denominacion EventosAcademicosDenominacion,      
    
      
 -- eve_acad.TipoDeEvento EventosAcademicosTipoDeEvento, ----  
  eve_acad_tipo.Id EventosAcademicosTipoDeEvento,  
         
  --eve_acad.CaracterDeParticipacion EventosAcademicosCaracterDeParticipacion,    ---  
   eve_acad_carac.Id EventosAcademicosCaracterDeParticipacion,  
      
  eve_acad.FechaInicio EventosAcademicosFechaInicio,        
  eve_acad.FechaFin EventosAcademicosFechaFin,        
  eve_acad.Duracion EventosAcademicosDuracion,   
  
  eve_acad_insti.Id EventosAcademicosInstitucion,        
 -- eve_acad.Institucion EventosAcademicosInstitucion,----  
          
  eve_acad.Localidad EventosAcademicosLocalidad,        
  eve_acad.Pais EventosAcademicosPais,        
  eve_acad.Baja EventosAcademicosBaja,        
          
          
          
          
  comp_info.Id IdCompetenciaInformatica,        
  comp_info.Diploma CompetenciaDiploma,        
  comp_info.Establecimiento CompetenciaEstablecimiento,        
  comp_info.FechaObtencion CompetenciaFechaObtencion,        
  ----------    
 -- comp_info.TipoInformatica CompetenciaTipoInformatica,        
  tipo_comp_info.Id CompetenciaTipoInformatica,    
 --comp_info.Conocimiento CompetenciaConocimiento,        
  conoc_comp_info.Id CompetenciaConocimiento,     
 --comp_info.Nivel CompetenciaNivel,       
  nivel_comp_info.Id CompetenciaNivel,         
      
  ----------    
  comp_info.Localidad CompetenciaLocalidad,        
  comp_info.Pais CompetenciaPais,        
  comp_info.Baja CompetenciaBaja,        
  comp_info.Detalle Detalle,        
          
  exp_labor.Id IdExperienciaLaboral,        
  exp_labor.Actividad ExperienciaLaboralActividad,        
  exp_labor.MotivoDesvinculacion ExperienciaLaboralMotivoDesvinculacion,        
  exp_labor.NombreEmpleador ExperienciaLaboralNombreEmpleador,        
  exp_labor.PersonasACargo ExperienciaLaboralPersonasACargo,        
  exp_labor.PuestoOcupado ExperienciaLaboralPuestoOcupado,        
  exp_labor.TipoEmpresa ExperienciaLaboralTipoEmpresa,        
  exp_labor.FechaInicio ExperienciaLaboralInicio,        
  exp_labor.FechaFin ExperienciaLaboralFin,        
  exp_labor.Localidad ExperienciaLaboralLocalidad,        
  exp_labor.Pais ExperienciaLaboralPais,        
  exp_labor.Baja ExperienciaLaboralBaja,        
  exp_labor.Sector ExperienciaLaboralSector,
  exp_labor.Ambito ExperienciaAmbitoLaboral,       
          
  idioma.Id IdIdioma,        
  idioma.Diploma IdiomaDiploma,        
  idioma.Establecimiento IdiomaEstablecimiento,        
  idioma.Idioma IdiomaIdioma,        
  idioma.Escritura IdiomaEscritura,        
  idioma.Lectura IdiomaLectura,        
  idioma.Oral IdiomaOral,        
  idioma.FechaObtencion IdiomaFechaObtencion,        
  idioma.FechaFin IdiomaFechaFin,        
  idioma.Localidad IdiomaLocalidad,        
  idioma.Pais IdiomaPais,        
  idioma.Baja IdiomaBaja,        
          
  instituc.Id IdInstitucion,        
  instituc.CaracterEntidad InstitucionCaracterEntidad,        
  instituc.CargosDesempeniados InstitucionCargos,        
  instituc.CategoriaActual InstitucionCategoriaActual,        
  instituc.Fecha InstitucionFecha,        
  instituc.FechaDeAfiliacion InstitucionFechaAfiliacion,        
  instituc.FechaInicio InstitucionFechaInicio,         
  instituc.FechaFin InstitucionFechaFin,        
  instituc.Institucion InstitucionInstitucion,        
  instituc.NumeroAfiliado InstitucionAfiliados,        
  instituc.Localidad InstitucionLocalidad,        
  instituc.Pais InstitucionPais,         
  instituc.Baja InstitucionBaja,        
          
  matric.Id IdMatricula,        
  matric.ExpedidaPor MatriculaExpedidoPor,        
  matric.Numero MatriculaNumero,        
  matric.SituacionActual MatriculaSituacionActual,        
  matric.FechaInscripcion MatriculaFechaObtencion,        
  matric.Baja MatriculaBaja,        
          
  publi.Id IdPublicacion,        
  publi.CantidadHojas PublicacionHojas,        
  publi.DatosEditorial PublicacionEditorial,        
  publi.DisponeCopia PublicacionCopia,        
  publi.DisponeAdjunto PublicacionAdjunto,          
  publi.Titulo PublicacionTitulo,        
  publi.FechaPublicacion PublicacionFecha,        
  publi.Baja PublicacionBaja,        
          
  activ_capac.Id IdCertificadoCapacitacion,        
  activ_capac.Titulo CertificadoDiploma,        
  activ_capac.Establecimiento CertificadoEstablecimiento,        
  activ_capac.Especialidad CertificadoEspecialidad,        
  activ_capac.Duracion CertificadoDuracion,        
  activ_capac.FechaIngreso CertificadoFechaInicio,        
  activ_capac.FechaEgreso CertificadoFechaFinalizacion,        
  activ_capac.Localidad CertificadoLocalidad,        
  activ_capac.Pais CertificadoPais,        
  activ_capac.Baja CertificadoBaja        
          
 FROM dbo.DatosPersonales dp        
 LEFT JOIN dbo.CV_DatosPersonales cvdp        
  ON cvdp.IdPersona = dp.Id        
 LEFT JOIN dbo.DatosPersonalesAdicionales dpadd        
  ON dpadd.IdPersona = dp.Id        
        
 LEFT JOIN dbo.CV_Domicilios cv_dom_pers        
  ON cv_dom_pers.IdPersona = dp.Id        
   AND cv_dom_pers.Tipo = 1        
 LEFT JOIN dbo.GEN_Domicilios dom_pers        
  ON cv_dom_pers.Id_Domicilio = dom_pers.Id_Domicilio        
  and isnull (dom_pers.DatoDeBaja,0)=0
        
 LEFT JOIN dbo.CV_Domicilios cv_dom_lab        
  ON cv_dom_lab.IdPersona = dp.Id        
   AND cv_dom_lab.Tipo = 2        
 LEFT JOIN dbo.GEN_Domicilios dom_lab        
  ON cv_dom_lab.Id_Domicilio = dom_lab.Id_Domicilio         
    and isnull (dom_pers.DatoDeBaja,0)=0
 
 --contacto personal (inicio)
LEFT JOIN dbo.GEN_Telefonos pers_tel1
  ON dom_pers.Id_Contacto =  pers_tel1.Id_Contacto
  AND pers_tel1.Tipo_Contacto  = 1

LEFT JOIN dbo.GEN_Telefonos pers_tel2
  ON dom_pers.Id_Contacto =  pers_tel2.Id_Contacto
  AND pers_tel2.Tipo_Contacto  = 2

LEFT JOIN dbo.GEN_Emails	pers_email
  ON dom_pers.Id_Contacto =  pers_email.Id_Contacto
  AND pers_email.Tipo_Contacto = 3
--contacto personal (fin)

          
 LEFT JOIN dbo.Datos_Personales TieneLegajo        
  ON TieneLegajo.IdPersona = dp.Id        
          
 LEFT JOIN dbo.CV_AntecedentesAcademicos ant_acad        
  ON ant_acad.IdPersona = dp.Id        
  and ant_acad.Baja is null    
        
 LEFT JOIN dbo.CV_AntecedentesDeDocencia ant_doc        
  ON ant_doc.IdPersona = dp.Id        
  and ant_doc.Baja is null    
         
 LEFT JOIN dbo.CV_CapacidadesPersonales cap_pers        
  ON cap_pers.IdPersona = dp.Id        
  and cap_pers.Baja is null    
 LEFT JOIN dbo.CV_EventosAcademicos eve_acad        
  ON eve_acad.IdPersona = dp.Id        
         
 ----        
 LEFT JOIN dbo.CV_TiposDeEventoAcademico eve_acad_tipo  
 ON eve_acad_tipo.id= eve_acad.IdTipoDeEvento  
 LEFT JOIN dbo.CV_CaracterDeParticipacionEvento eve_acad_carac  
 ON eve_acad_carac.id= eve_acad.IdCaracterParticipacion  
 LEFT JOIN dbo.CV_InstitucionesEventos eve_acad_insti  
 ON eve_acad_insti.id= eve_acad.IdInstitucion  
         
         
 ----  
         
 LEFT JOIN dbo.CV_CompetenciasInformaticas comp_info        
  ON comp_info.IdPersona = dp.Id        
         
 ----    
 Left Join dbo.CV_TipoCompetenciaInformatica tipo_comp_info    
 ON comp_info.IdTipoInformatica   = tipo_comp_info.id    
 Left Join dbo.CV_ConocimientosCompetenciasInformaticas conoc_comp_info    
 ON comp_info.IdConocimiento =conoc_comp_info.id    
 Left Join dbo.CV_NivelesCompetenciasInformaticas nivel_comp_info    
 ON comp_info.IdNivel  =nivel_comp_info.id    
 and comp_info.Baja is null    
     
 ----        
               
 LEFT JOIN dbo.CV_ExperienciasLaborales exp_labor        
  ON exp_labor.IdPersona = dp.Id        
  and exp_labor.Baja is null    
 LEFT JOIN dbo.CV_Idiomas idioma        
  ON idioma.IdPersona = dp.Id        
  and idioma.Baja is null    
 LEFT JOIN dbo.CV_Instituciones instituc        
  ON instituc.IdPersona = dp.Id        
  and instituc.Baja is null    
          
 LEFT JOIN dbo.CV_Matriculas matric        
  ON matric.IdPersona = dp.Id        
  and matric.Baja is null    
          
 LEFT JOIN dbo.CV_Publicaciones publi        
  ON publi.IdPersona = dp.Id    
  and publi.Baja is null    
         
 LEFT JOIN dbo.CV_ActividadesDeCapacitacion activ_capac        
  ON activ_capac.IdPersona = dp.Id        
  and activ_capac.Baja is null    
         
 WHERE         
  dp.Id = @idPersona        
END        
        
      
  --CV_GetCurriculumVitae_test 59114  
    
    
  



