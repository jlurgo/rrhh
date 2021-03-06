CREATE PROCEDURE [dbo].[SACC_Upd_Del_Evaluacion]
					@id int,
					@id_alumno int,
					@id_curso smallint,
					@id_instancia_evaluacion smallint,
					@calificacion varchar(30),
					@fecha_evaluacion datetime = null,
					@fecha datetime = null,
					@id_usuario smallint,
					@id_baja int = null
										
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
		[fecha] = @fecha,
		[idBaja] = @id_baja
							
		WHERE 
		[id] = @id
		/*[idAlumno] = @id_alumno AND
		[idCurso] = @id_curso AND
		[idInstanciaEvaluacion] = @id_instancia_evaluacion*/
	select @@ROWCOUNT
END
