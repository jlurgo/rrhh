USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Upd_Del_Evaluacion]    Script Date: 07/30/2013 19:11:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Upd_Del_Evaluacion]
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion char(30),
					@fecha_evaluacion datetime = null,
					@fecha datetime = null,
					@id_usuario int
										
AS


BEGIN
		UPDATE [dbo].[SAC_Evaluaciones] 
			SET 
			[idInstanciaEvaluacion] = @id_instancia_evaluacion,
			[idAlumno] = @id_alumno,
			[idCurso] = @id_curso,			
			[Calificacion] = @calificacion,
			[idUsuario] = @id_usuario,
			[fechaEvaluacion] = @fecha_evaluacion,
			[fecha] = @fecha
								
			WHERE 
			[idAlumno] = @id_alumno AND
			[idCurso] = @id_curso AND
			[idInstanciaEvaluacion] = @id_instancia_evaluacion
END
