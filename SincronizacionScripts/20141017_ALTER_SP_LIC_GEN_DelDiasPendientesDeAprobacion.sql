USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_DelDiasPendientesDeAprobacion]    Script Date: 10/17/2014 21:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[LIC_GEN_DelDiasPendientesDeAprobacion]      
 @id int = null

AS
   
BEGIN   

UPDATE 	dbo.ASIS_Solicitudes_Licencia_Web
SET baja = 1

WHERE Id = @id  
	 


END


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

