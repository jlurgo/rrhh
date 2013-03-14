/****** Object:  StoredProcedure [dbo].[SACC_Ins_Asistencia]    Script Date: 03/07/2013 20:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_ABM_Asistencia]
					@id_alumno int,
					@id_curso smallint,
					@fecha_asistencia datetime,
					@descripcion char(30),
					@id_usuario int,
					@fecha datetime = null,
					@baja bit = 0
AS

if not exists(select * from dbo.sac_asistencias where idAlumno = @id_alumno and idCurso = @id_curso and fechaAsistencia = @fecha_asistencia)
BEGIN

	INSERT INTO [dbo].[SAC_Asistencias]
			   ([idAlumno]
			   ,[idCurso]
			   ,[fechaAsistencia]
			   ,[descripcion]
			   ,[idUsuario]
			   ,[fecha]
			   ,[baja]
			   )
		 VALUES
			   (@id_alumno,
				@id_curso,
				@fecha_asistencia,
				@descripcion,
				@id_usuario,
				@fecha,
				@baja)
END				
ELSE
BEGIN
		UPDATE [dbo].[SAC_Asistencias] 
			SET [descripcion] = @descripcion,
				[fecha] = @fecha,
				[baja] = @baja,
				[idUsuario] = @id_usuario
			WHERE 
			[idAlumno] = @id_alumno AND
			[idCurso] = @id_curso AND
			[fechaAsistencia] = @fecha_asistencia
END