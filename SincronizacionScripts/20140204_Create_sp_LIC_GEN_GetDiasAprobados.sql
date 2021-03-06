USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_GetDiasAprobados]    Script Date: 02/04/2014 21:19:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_GetDiasAprobados]      
 @nro_documento int = null,
 @periodo smallint = null,
 @id_concepto_licencia smallint = null 
 
AS
   
BEGIN   

SELECT	dp.NroDocumento, dp.Apellido, dp.Nombre, 
		lic_sol.Id_Interna, lic_sol.Concepto, lic_sol.Periodo, lic_sol.Desde, lic_sol.Hasta, lic_sol.Dias_A_Tomar
  FROM dbo.Licencias_Solicitadas lic_sol
  LEFT JOIN dbo.LegajosPersonas lp
  ON lp.legajo = lic_sol.Id_Interna
  LEFT JOIN dbo.DatosPersonales dp
  ON dp.Id = lp.idPersona 

  WHERE (@nro_documento IS NULL OR dp.NroDocumento = @nro_documento) AND
		(@periodo IS NULL OR lic_sol.Periodo = @periodo) AND
		(@id_concepto_licencia IS NULL OR lic_sol.Concepto = @id_concepto_licencia)
  
END