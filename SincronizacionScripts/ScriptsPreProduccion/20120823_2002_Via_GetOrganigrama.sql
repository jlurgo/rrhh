
ALTER PROCEDURE [dbo].[VIA_GetOrganigrama]
AS
BEGIN
    -- Insert statements for procedure here
	SELECT te.codigo, te.Id_area, te.Descripcion, te.Baja, te.Acto_Baja, te.Acto_Nro, te.Acto_Fecha, ta.Presenta_DDJJ
	FROM dbo.Tabla_Areas_Estructura te
	LEFT JOIN dbo.Tabla_Areas ta
		ON te.Id_area = ta.id
	WHERE te.baja = 0 and ta.baja = 0
END
