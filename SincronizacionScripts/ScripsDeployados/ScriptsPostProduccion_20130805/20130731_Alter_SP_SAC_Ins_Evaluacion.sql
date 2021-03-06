/****** Object:  StoredProcedure [dbo].[SACC_Ins_Evaluacion]    Script Date: 08/12/2013 22:13:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Ins_Evaluacion]
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion varchar(30),
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
	select @@ROWCOUNT
END		
