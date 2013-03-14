-- =============================================
-- Author:		Javier
-- Create date: 05/09/2012
-- Description:	Devuelve un area
-- =============================================
CREATE PROCEDURE [dbo].[Web_GetAreaById]
				@Id_Area int
AS
BEGIN

-- esta trae repetidas y areas de baja
	SELECT 
		codigo,
		id_area,
		descripcion
	FROM
		dbo.tabla_areas_estructura
	WHERE
		baja = 0 AND
		id_area = @Id_Area
END
