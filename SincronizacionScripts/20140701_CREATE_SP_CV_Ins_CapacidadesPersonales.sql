USE [DB_RRHH]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].CV_Ins_CapacidadesPersonales
(
	@IdPersona int,
	@Tipo int,
	@Detalle varchar(1000),
	@Usuario int
)

AS

BEGIN

	declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp   
	
	INSERT INTO [CV_CapacidadesPersonales] (IdPersona, Tipo, Detalle, Usuario, FechaOperacion)
	VALUES(@IdPersona, @Tipo, @Detalle, @Usuario, GETDATE())
	
	SELECT @@IDENTITY
END