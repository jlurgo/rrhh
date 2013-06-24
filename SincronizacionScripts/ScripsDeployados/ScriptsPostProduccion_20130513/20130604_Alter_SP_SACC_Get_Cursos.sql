set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Cursos]

AS
BEGIN

	SELECT
		id,
		IdMateria,
		IdDocente,
		Fecha,
		FechaInicio,
		FechaFin,
		idBaja,
		IdEspacioFisico,
		Observaciones
	FROM
		dbo.sac_cursos

	WHERE idBaja is null
	
END

