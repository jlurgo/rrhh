-- =============================================
-- Author: Javi
-- ALTER  date: 05/09/2012
-- Description:	Guarda una transicion de un viático
-- =============================================

CREATE PROCEDURE [dbo].[VIA_GuardarTransicionDeViatico]
@Id_Comision int,
@Id_Area_Origen int ,
@Id_Area_Destino int ,
@Id_Accion int,
@Fecha datetime,
@Comentario Varchar(512)

AS
BEGIN
	SET NOCOUNT ON;	
	INSERT INTO [DB_RRHH].[dbo].VIA_Transiciones_De_Viaticos
		SELECT		@Id_Comision as id_viatico
				   ,@Id_Area_Origen as id_area_origen
				   ,@Id_Area_Destino as id_area_destino
				   ,@Id_Accion	as id_accion
				   ,@Fecha as fecha
				   ,@Comentario as comentario
	SELECT @@IDENTITY	
END
