set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_GetPasesEntreFechas]  
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
		area.descripcion
  FROM PLA_Pases_Solicitados pases
  LEFT JOIN dbo.LegajosPersonas lp
  ON lp.legajo = pases.Id_Interna
  LEFT JOIN dbo.DatosPersonales dp
  ON dp.Id = lp.idPersona 
  LEFT JOIN [dbo].[ESTR_Areas ] area
	ON area.id = pases.Area_Nueva

  WHERE (@fecha_desde IS NULL OR pases.fecha_solicitud > @fecha_desde OR (pases.fecha_solicitud < @fecha_desde AND pases.estado = 0))
  
END

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


select * from LEG_Desglose_area






