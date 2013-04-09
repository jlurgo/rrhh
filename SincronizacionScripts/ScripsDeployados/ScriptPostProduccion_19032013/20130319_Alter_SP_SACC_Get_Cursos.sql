USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Get_Cursos]    Script Date: 04/08/2013 20:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Cursos]

AS
BEGIN

	SELECT
		id,
		IdMateria,
		IdDocente,
		Fecha,
		HoraCatedra
		idBaja,
		IdEspacioFisico
	FROM
		dbo.sac_cursos

	WHERE idBaja is null
	
END
