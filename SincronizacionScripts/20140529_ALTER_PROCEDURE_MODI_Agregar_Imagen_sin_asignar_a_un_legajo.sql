USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[MODI_Agregar_Imagen_Sin_Asignar_A_Un_Legajo]    Script Date: 05/29/2014 20:45:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[MODI_Agregar_Imagen_Sin_Asignar_A_Un_Legajo]
	@id_interna int,
	@nombre_imagen varchar(50),
	@bytes_imagen image
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

BEGIN
	INSERT INTO		dbo.MODI_Imagenes
					(id_interna, 
					nombre_imagen, 
					bytes_imagen)
	VALUES			(@id_interna, 
					@nombre_imagen, 
					@bytes_imagen)	
	
	SELECT @@IDENTITY as "id_imagen"
END

