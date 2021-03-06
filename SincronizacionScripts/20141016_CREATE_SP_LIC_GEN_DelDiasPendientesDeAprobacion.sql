USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_DelDiasPendientesDeAprobacion]    Script Date: 10/16/2014 21:17:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_DelDiasPendientesDeAprobacion]      
 @documento int = null,
 @desde smalldatetime = null, 
 @hasta smalldatetime = null 
 
AS
   
BEGIN   

UPDATE 	dbo.ASIS_Solicitudes_Licencia_Web
SET baja = 1

WHERE Id_Interna = (SELECT lp.legajo 
							from dbo.LegajosPersonas lp 
							LEFT JOIN dbo.DatosPersonales dp
							ON dp.Id = lp.idPersona 
							where dp.NroDocumento = @documento)  
	  and desde = @desde 
	  and hasta = @hasta


END


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

