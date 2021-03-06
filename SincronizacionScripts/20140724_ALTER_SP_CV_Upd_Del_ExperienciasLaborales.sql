set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[CV_Upd_Del_ExperienciasLaborales]
@IdExperiencia int = null,
@Actividad varchar(100)=null,
@MotivoDesvinculacion varchar(100)=null,
@NombreEmpleador varchar(100)=null,
@PersonasACargo int=null,
@PuestoOcupado varchar(100)=null,
@TipoEmpresa varchar(100)=null,
@FechaInicio datetime=null,
@FechaFin datetime=null,
@Localidad varchar(100)=null,
@Pais int=null,
@Usuario int=null,
@FechaOperacion datetime=null,
@Baja int=null

AS

Begin

declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp  

UPDATE dbo.CV_ExperienciasLaborales
   SET Actividad = isnull(@Actividad,Actividad),
      MotivoDesvinculacion = isnull(@MotivoDesvinculacion,MotivoDesvinculacion),
      NombreEmpleador = isnull(@NombreEmpleador,NombreEmpleador),
      PersonasACargo = isnull(@PersonasACargo,PersonasACargo),
      PuestoOcupado = isnull(@PuestoOcupado,PuestoOcupado),
      TipoEmpresa = isnull(@TipoEmpresa,TipoEmpresa),
      FechaInicio = isnull(@FechaInicio,FechaInicio), 
      FechaFin = isnull(@FechaFin,FechaFin),
      Localidad = isnull(@Localidad,Localidad), 
      Pais = isnull(@Pais, Pais),
      Usuario = isnull(@Usuario,Usuario),
      FechaOperacion = getdate(),
      Baja = isnull(@Baja,Baja)
WHERE id=@IdExperiencia


END


