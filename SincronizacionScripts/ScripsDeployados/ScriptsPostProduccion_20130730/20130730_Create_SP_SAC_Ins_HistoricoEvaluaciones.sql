USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Ins_Evaluaciones]    Script Date: 07/30/2013 19:13:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Ins_HistoricoEvaluaciones]
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion varchar(30),
					@fecha_evaluacion datetime,
					@id_usuario smallint,
					@fecha datetime = null,
					@baja int = null

AS

BEGIN
	
	INSERT INTO [dbo].[SAC_HistoricoEvaluaciones]
			   ([idInstanciaEvaluacion]
			   ,[idAlumno]
			   ,[idCurso]
			   ,[Calificacion]
			   ,[idUsuario]
			   ,[fechaEvaluacion]
			   ,[fecha]
			   ,[idBaja]
			   )
		 VALUES
			   (@id_instancia_evaluacion,
				@id_alumno,
				@id_curso,
				@calificacion,
				@id_usuario,
				@fecha_evaluacion,
				@fecha,
				@baja)
END		

