/****** Object:  StoredProcedure [dbo].[VIA_GetAreaPreviaDe]    Script Date: 08/30/2012 22:10:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Belén Jorge y Javi
-- Create date: 12/07/2012
-- Description:	Devuelve el área por la que pasó un viático antes del área actual
-- =============================================
ALTER PROCEDURE [dbo].[VIA_GetAreaPreviaDe]
@Id_Viatico int 
AS
BEGIN
	DECLARE @idAreaActual AS INT
	SELECT		@idAreaActual = id_area_destino
		FROM	VIA_Transiciones_De_Viaticos
		WHERE	id_viatico = @Id_Viatico AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Transiciones_De_Viaticos
							WHERE	id_viatico = @Id_Viatico)
									
									
	DECLARE @idAreaPrevia AS INT
	SELECT		@idAreaPrevia = id_area_origen
		FROM	VIA_Transiciones_De_Viaticos
		WHERE	id_viatico = @Id_Viatico AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Transiciones_De_Viaticos
							WHERE	id_viatico = @Id_Viatico AND
									id_accion = 1 AND
									id_area_destino = @idAreaActual )

	SELECT	TOP 1
				codigo,
				id_area,
				descripcion
		FROM	tabla_areas_estructura
		WHERE	baja = 0 AND
				id_area = @idAreaPrevia
END