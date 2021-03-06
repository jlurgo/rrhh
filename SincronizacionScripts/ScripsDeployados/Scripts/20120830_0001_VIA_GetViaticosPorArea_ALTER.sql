/****** Object:  StoredProcedure [dbo].[VIA_GetViaticosPorArea]    Script Date: 08/30/2012 22:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Belén y Jorge 
-- ALTER  date: 06/07/2012
-- Description:	Trae todos los Viáticos acorde a un área ingresada
-- Description:	Todavía no está definida correctamente la Tabla dbo.VIA_ComisionesDeServicio
-- =============================================

ALTER PROCEDURE [dbo].[VIA_GetViaticosPorArea]
@Id_Area int 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT		Historial.id_viatico AS id_Comision
	FROM		 Historial 
				INNER JOIN			
				(SELECT		id_viatico,
							MAX(fecha) as maxFecha
				FROM VIA_Transiciones_De_Viaticos	
				GROUP BY id_viatico) maxFechas
			ON	Historial.Id_viatico = maxFechas.id_viatico AND
				Historial.Fecha = maxFechas.maxfecha
	WHERE	Historial.id_area_destino= @Id_Area
END
