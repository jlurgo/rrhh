set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Cursos]

AS
BEGIN

	SELECT
		id,
		IdAula,
		IdMateria,
		IdDocente,
		Fecha,
		idBaja,
		IdEspacioFisico
	FROM
		dbo.sac_cursos

	WHERE idBaja is null
	
END