USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Upd_Del_Asistencia]    Script Date: 10/22/2013 20:42:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Upd_Del_Asistencia]
					@id int,
					@id_alumno int,
					@id_curso smallint,
					@valor smallint,
					@fecha datetime,
					@id_usuario int,
					@id_baja int = null
AS


BEGIN
		UPDATE [dbo].[SAC_Asistencias]
		   SET [idAlumno] = @id_alumno
			  ,[idCurso] = @id_curso
			  ,[valor] = @valor
			  ,[fecha] = @fecha
			  ,[idUsuario] = @id_usuario
			  ,[idBaja] = @id_baja
		 WHERE [Id] = @id
		 
		select @@ROWCOUNT
END