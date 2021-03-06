USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_GetPasesEntreFechas]    Script Date: 05/22/2014 19:58:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIC_GEN_GetPasesEntreFechas]  
@fecha_desde datetime, 
@fecha_hasta datetime
  --[Estado]
	--  0 pendiente
	--  1 confirmado
	--  2 rechazado
AS

BEGIN   
	
SELECT	dp.NroDocumento, 
		pases.Id_Interna,   
		pases.fecha_solicitud, 
		pases.estado,
		pases.area_nueva,
		area1.descripcion area_destino,
		pases.area_actual,
		area2.descripcion area_origen
  FROM PLA_Pases_Solicitados pases
  LEFT JOIN dbo.LegajosPersonas lp
  ON lp.legajo = pases.Id_Interna
  LEFT JOIN dbo.DatosPersonales dp
  ON dp.Id = lp.idPersona 
  LEFT JOIN [dbo].[ESTR_Areas ] area1
	ON area1.id = pases.Area_Nueva
  LEFT JOIN [dbo].[ESTR_Areas ] area2
	ON area2.id = pases.Area_Actual	

  WHERE (@fecha_desde IS NULL OR pases.fecha_solicitud > @fecha_desde OR (pases.fecha_solicitud < @fecha_desde AND pases.estado = 0))
  
END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
