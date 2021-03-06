USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[MODI_Get_Imagen]    Script Date: 05/29/2014 21:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[MODI_Get_Imagen]
	@id_imagen int
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

BEGIN
	SELECT	nombre_imagen, 
			bytes_imagen	 
	FROM	dbo.MODI_Imagenes 
	WHERE id_imagen=@id_imagen
END

