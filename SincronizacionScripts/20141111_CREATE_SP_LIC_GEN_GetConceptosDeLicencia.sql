USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_GetConceptosDeLicencia]    Script Date: 11/11/2014 20:18:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_GetConceptosDeLicencia]      

AS
   
BEGIN   

SELECT	id_Concepto,
		Dias_Autorizados,
		Dias_Habiles
		--Agregar más Columnas a medida que se necesiten en
		-- RepoLicencias: DiasHabilitadosEntreFechas
		
  FROM dbo.Tabla_Conceptos_Licencias
  
END



set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

