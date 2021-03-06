USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[LIC_GEN_Ins_LogErroresCalculoLicencias]    Script Date: 12/16/2014 20:52:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LIC_GEN_Ins_LogErroresCalculoLicencias]      
 @documento int,
 @apellido [varchar](100),
 @nombre [varchar](100),
 @anio_maximo_imputable smallint,
 @anio_minimo_imputable smallint,
 @fecha_desde smalldatetime,
 @fecha_hasta smalldatetime,
 @cantidad_de_dias smallint,
 @fecha_calculo smalldatetime

AS
   
BEGIN   

INSERT INTO dbo.LIC_LogErroresCalculoLicencia 
   ( 
     [documento],
	 [apellido],
	 [nombre],
	 [anio_maximo_imputable],
	 [anio_minimo_imputable],
	 [fecha_desde_solicitada],
	 [fecha_hasta_solicitada],
	 [cantidad_de_dias_imputables],
	 [fecha_de_calculo]
	) 
 
VALUES 
	( 
	@documento,
	@apellido,
	@nombre,
	@anio_maximo_imputable,
	@anio_minimo_imputable,
	@fecha_desde,
	@fecha_hasta,
	@cantidad_de_dias,
	@fecha_calculo
	)

END


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

