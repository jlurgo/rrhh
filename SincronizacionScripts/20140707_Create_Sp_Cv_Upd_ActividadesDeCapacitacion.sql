USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[Cv_Upd_Del_ActividadesDeCapacitacion]    Script Date: 07/23/2014 21:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Cv_Upd_Del_ActividadesDeCapacitacion]
@IdActividadDeCapacitacion int=NULL,
@Titulo varchar(100)=NULL,
@Establecimiento varchar(100)=NULL,
@Especialidad varchar(100)=NULL,
@Duracion varchar(50)=NULL,
@FechaIngreso datetime=NULL,
@FechaEgreso datetime=NULL,
@Localidad varchar(100)=NULL,
@Pais int=NULL,
@Usuario int,
--@FechaOperacion datetime=NULL,
@Baja int=NULL

AS


BEGIN

declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp  


UPDATE dbo.CV_ActividadesDeCapacitacion
   SET Titulo = isnull(@Titulo,Titulo),
      Establecimiento = isnull(@Establecimiento,Establecimiento), 
      Especialidad = isnull(@Especialidad,Especialidad),
      Duracion = isnull(@Duracion,Duracion), 
      FechaIngreso = isnull(@FechaIngreso,FechaIngreso),
      FechaEgreso = isnull(@FechaEgreso,FechaEgreso),
      Localidad = isnull(@Localidad,Localidad), 
      Pais = isnull(@Pais,Pais),
      Usuario = isnull(@Usuario,Usuario),
      FechaOperacion = getdate(),
      Baja = isnull(@Baja,Baja)
      WHERE Id=@IdActividadDeCapacitacion


END



