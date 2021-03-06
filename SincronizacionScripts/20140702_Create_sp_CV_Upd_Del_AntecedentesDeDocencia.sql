USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Upd_Del_AntecedentesDeDocencia]    Script Date: 07/18/2014 20:34:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[CV_Upd_Del_AntecedentesDeDocencia]

@IdDocencia int,
@Asignatura varchar(100) = null,
@CaracterDesignacion varchar(100)= null,
@CargaHoraria varchar(100)= null,
@CategoriaDocente varchar(100)= null,
@DedicacionDocente varchar(100)= null,
@Establecimiento varchar(100)= null,
@NivelEducativo int= null,
@TipoActividad varchar(100)= null,
@FechaInicio datetime = null,
@FechaFinalizacion datetime,
@Localidad varchar(100)= null,
@Pais int= null,
@Usuario int,
@idBaja int = null


AS

BEGIN

	declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp  

	UPDATE [dbo].[CV_AntecedentesDeDocencia]
	SET
		Asignatura = ISNULL(@Asignatura,Asignatura),
		CaracterDesignacion = ISNULL(@CaracterDesignacion,CaracterDesignacion),
		CargaHoraria = ISNULL(@CargaHoraria,CargaHoraria),
		CategoriaDocente = ISNULL(@CategoriaDocente,CategoriaDocente),
		DedicacionDocente = ISNULL(@DedicacionDocente,DedicacionDocente),
		Establecimiento = ISNULL(@Establecimiento,Establecimiento),
		NivelEducativo = ISNULL(@NivelEducativo,NivelEducativo),
		TipoActividad = ISNULL(@TipoActividad,TipoActividad),
		FechaInicio = ISNULL(@FechaInicio,FechaInicio),
		FechaFinalizacion = ISNULL(@FechaFinalizacion,FechaFinalizacion),
		Localidad = ISNULL(@Localidad,Localidad),
		Pais = ISNULL(@Pais,Pais),
		Usuario = @Usuario,
		FechaOperacion = GetDate(),
		Baja = ISNULL(@idBaja,Baja)
	WHERE
		Id = @IdDocencia

END











