USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Ins_Asistencia]    Script Date: 10/22/2013 20:31:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Ins_Asistencia]
					@id_alumno int,
					@id_curso smallint,
					@fecha datetime,
					@valor varchar(20),
					@id_usuario int,
					@baja int = null
AS

BEGIN
	INSERT INTO [dbo].[SAC_Asistencias]
			   ([idAlumno]
			   ,[idCurso]
			   ,[valor]
			   ,[fechaAsistencia]
			   ,[fecha]
			   ,[idUsuario]
			   ,[idBaja])
		 VALUES
			   (@id_alumno,
				@id_curso,
				@valor,
				@fecha,
				GETDATE(),
				@id_usuario,
				@baja)

	SELECT @@ROWCOUNT
END		

