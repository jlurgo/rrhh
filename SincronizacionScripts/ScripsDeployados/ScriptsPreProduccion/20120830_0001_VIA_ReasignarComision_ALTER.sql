/****** Object:  StoredProcedure [dbo].[VIA_ReasignarComision]    Script Date: 08/30/2012 22:01:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Belén y Jorge y Javi
-- ALTER  date: 10/07/2012
-- Description:	Reasigna una comision de servicio a otra area
-- =============================================

ALTER PROCEDURE [dbo].[VIA_ReasignarComision]
@Id_Comision int,
@Id_Area_Destino int ,
@Id_Accion int,
@Comentarios Varchar(512)

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE		@Id_Area_Origen AS INT
	
	SELECT		@Id_Area_Origen = id_area_destino
		FROM	VIA_Transiciones_De_Viaticos
		WHERE	id_viatico = @Id_Comision AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Transiciones_De_Viaticos
							WHERE	id_viatico = @Id_Comision)	
	
	if @Id_Area_Origen is null
	begin
		set @Id_Area_Origen = @Id_Area_Destino
	end
	
	INSERT INTO [DB_RRHH].[dbo].VIA_Transiciones_De_Viaticos
		SELECT		@Id_Comision as id_viatico
				   ,@Id_Area_Origen as id_area_origen
				   ,@Id_Area_Destino as id_area_destino
				   ,@Id_Accion	as id_accion
				   ,GETDATE() as fecha
				   ,@Comentarios as comentario
			
END
