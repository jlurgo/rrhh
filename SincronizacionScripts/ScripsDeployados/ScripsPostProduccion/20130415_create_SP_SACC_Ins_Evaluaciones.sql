set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Ins_Evaluaciones]
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion char(30),
					@fecha_evaluacion datetime,
					@id_usuario int,
					@fecha datetime = null,
					@baja int = null
AS

BEGIN
	
	INSERT INTO [dbo].[SAC_Evaluaciones]
			   ([idAlumno]
			   ,[idCurso]
			   ,[idInstanciaEvaluacion]
			   ,[Calificacion]
			   ,[fechaEvaluacion]
			   ,[idUsuario]
			   ,[fecha]
			   ,[idBaja]
			   )
		 VALUES
			   (@id_alumno,
				@id_curso,
				@id_instancia_evaluacion,
				@calificacion,
				@fecha_evaluacion,
				@id_usuario,
				@fecha,
				@baja)
END		

