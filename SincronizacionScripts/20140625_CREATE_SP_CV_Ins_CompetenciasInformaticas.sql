USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_CompetenciasInformaticas]    Script Date: 07/23/2014 21:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CV_Ins_CompetenciasInformaticas]
(
	@Diploma varchar(100) = null,
	@Establecimiento varchar(100) = null,
	@FechaObtencion[datetime] = null,
	@TipoInformatica varchar(100) = null,
	@Conocimiento varchar(100) = null,
	@Nivel varchar(50)  = null,
	@Localidad varchar(100)  = null,
	@Pais int = null,
	@Usuario[int], 
	@Baja [int]  = null,
	@Documento int = null,
	@IdPersona int =null,
	@Detalle varchar(100)  = null

)

AS

BEGIN

/* COMENTADO por el agreado de "@IdPersona int =null" y "SELECT SCOPE_IDENTITY()"
*********************************************************************************
declare @IdPersona int    
 select @IdPersona = Id from dbo.DatosPersonales where NroDocumento = @Documento    

*/	
	
	INSERT INTO [dbo].[CV_CompetenciasInformaticas]
		(Diploma, Establecimiento, FechaObtencion, TipoInformatica, Conocimiento,Nivel,Localidad, Pais,Usuario,FechaOperacion,Baja,IdPersona, Detalle )
	VALUES 
		(@Diploma, @Establecimiento,@FechaObtencion,@TipoInformatica, @Conocimiento,@Nivel,@Localidad,@Pais,@Usuario,GETDATE(),@Baja,@IdPersona, @Detalle)
	
SELECT SCOPE_IDENTITY()
END

