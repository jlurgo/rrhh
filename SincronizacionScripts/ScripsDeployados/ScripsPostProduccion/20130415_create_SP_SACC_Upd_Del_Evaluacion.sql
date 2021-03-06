set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Upd_Del_Evaluacion]
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion char(30),
					@id_usuario int,
					@fecha datetime = null,
					@baja int = null
AS


BEGIN
		UPDATE [dbo].[SAC_Evaluaciones] 
			SET [Calificacion] = @calificacion,
				[fecha] = @fecha,
				[idBaja] = @baja,
				[idUsuario] = @id_usuario
			WHERE 
			[idAlumno] = @id_alumno AND
			[idCurso] = @id_curso AND
			[idInstanciaEvaluacion] = @id_instancia_evaluacion
END
