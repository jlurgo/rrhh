SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Horarios]

AS

BEGIN

	SELECT
		id,
		idCurso,
		NroDiaSemana,
		Desde,
		Hasta,
		HorasCatedra
	FROM
		dbo.sac_horarios

--WHERE al.Baja = 0

END