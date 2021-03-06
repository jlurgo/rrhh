USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_ActividadesDeCapacitacion]    Script Date: 07/23/2014 21:15:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[CV_Ins_ActividadesDeCapacitacion]
@Titulo varchar(100) = null,
@Establecimiento varchar(100) = null,
@Especialidad varchar(100) = null,
@Duracion varchar(50) = null,
@FechaIngreso datetime = null,
@FechaEgreso datetime= null,
@Localidad varchar(100)= null,
@Pais int= null,
@Usuario int,
--@FechaOperacion datetime = null,
@Baja int= null,
@Documento int = null,
@IdPersona int =null


AS

Begin

/* COMENTADO por el agreado de "@IdPersona int =null" y "SELECT SCOPE_IDENTITY()"
*********************************************************************************
declare @IdPersona int    
 select @IdPersona = Id from dbo.DatosPersonales where NroDocumento = @Documento    

*/

INSERT INTO [dbo].[CV_ActividadesDeCapacitacion]
           ([Titulo]
           ,[Establecimiento]
           ,[Especialidad]
           ,[Duracion]
           ,[FechaIngreso]
           ,[FechaEgreso]
           ,[Localidad]
           ,[Pais]
           ,[Usuario]
           ,[FechaOperacion]
           ,[Baja]
           ,[IdPersona]
           )
     VALUES
           (
           @Titulo,
			@Establecimiento,
			@Especialidad,
			@Duracion,
			@FechaIngreso,
			@FechaEgreso,
			@Localidad,
			@Pais,
			@Usuario,
			getdate(),
			@Baja,
			@IdPersona
			)

SELECT SCOPE_IDENTITY()

END









