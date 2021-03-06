USE [DB_RRHH]
GO
/****** Objeto:  StoredProcedure [dbo].[LIC_GEN_GetAusenciasEntreFechas]    Fecha de la secuencia de comandos: 04/28/2014 21:24:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_GetAusenciasEntreFechas]  
@fecha_desde datetime, 
@fecha_hasta datetime
 
AS

BEGIN   

SELECT	dp.NroDocumento, 
		lic_sol.Id_Interna, 
		lic_sol.Concepto, 
		con_lic.Descripcion,  
		lic_sol.Desde, 
		lic_sol.Hasta
  FROM dbo.Licencias_Solicitadas lic_sol
  LEFT JOIN dbo.LegajosPersonas lp
  ON lp.legajo = lic_sol.Id_Interna
  LEFT JOIN dbo.DatosPersonales dp
  ON dp.Id = lp.idPersona 
  LEFT JOIN dbo.Tabla_Conceptos_Licencias con_lic
  ON con_lic.Id_Concepto = lic_sol.Concepto

  WHERE (@fecha_desde IS NULL OR lic_sol.Desde > @fecha_desde OR (lic_sol.Desde < @fecha_desde AND lic_sol.Hasta > @fecha_desde))
  
END






set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON





