USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_GetDiasPendientesDeAprobacion]    Script Date: 02/04/2014 21:51:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_GetDiasPendientesDeAprobacion]      
 @nro_documento int = null,
 @id_concepto_licencia smallint = null 
 
AS
   
BEGIN   

SELECT	dp.NroDocumento, 
		dp.Apellido, 
		dp.Nombre, 
		lic_ped.Id_Interna, 
		lic_ped.Concepto,  
		lic_ped.Desde, 
		lic_ped.Hasta, 
		lic_ped.fecha_solicitud
		
  FROM dbo.ASIS_Solicitudes_Licencia_Web	lic_ped
  LEFT JOIN dbo.LegajosPersonas		lp
  ON lp.legajo = lic_ped.Id_Interna
  LEFT JOIN dbo.DatosPersonales dp
  ON dp.Id = lp.idPersona 

  WHERE (@nro_documento IS NULL OR dp.NroDocumento = @nro_documento) AND
		(@id_concepto_licencia IS NULL OR lic_ped.Concepto = @id_concepto_licencia)
  
END

