CREATE PROCEDURE [dbo].MODI_Agregar_Imagen_A_Un_Folio_De_Un_Legajo
	@id_interna int,
	@nombre_imagen varchar(50),
	@bytes_imagen text,
	@numero_folio int
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

BEGIN
	INSERT INTO		dbo.MODI_Imagenes
					(id_interna, 
					nombre_imagen, 
					bytes_imagen,
					nro_folio)
	VALUES			(@id_interna, 
					@nombre_imagen, 
					@bytes_imagen,
					@numero_folio)	
	
	SELECT @@IDENTITY as "id_imagen"
END

