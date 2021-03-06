USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_Idiomas]    Script Date: 07/23/2014 21:20:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER Procedure [dbo].[CV_Ins_Idiomas]
@Diploma varchar(100)=null,
@Establecimiento varchar(100)=null,
@Idioma varchar(50)=null,
@Escritura varchar(50)=null,
@Lectura varchar(50)=null,
@Oral varchar(50)=null,
@FechaObtencion datetime=null,
@FechaFin datetime=null,
@Localidad varchar(100)=null,
@Pais int=null,
@Usuario int=null,
@FechaOperacion datetime=null,
@Baja int=null,
@IdPersona int=null
AS

BEGIN

 declare @NombreSp varchar(60)   
 set @NombreSp = (select OBJECT_NAME(@@PROCID))  
 exec dbo.Audit @NombreSp 

	INSERT INTO [dbo].[CV_Idiomas]
			   ([Diploma]
			   ,[Establecimiento]
			   ,[Idioma]
			   ,[Escritura]
			   ,[Lectura]
			   ,[Oral]
			   ,[FechaObtencion]
			   ,[FechaFin]
			   ,[Localidad]
			   ,[Pais]
			   ,[Usuario]
			   ,[FechaOperacion]
			   ,[Baja]
			   ,[IdPersona])
		 VALUES
			  (@Diploma,
			   @Establecimiento,
			   @Idioma,
			   @Escritura,
			   @Lectura,
			   @Oral,
			   @FechaObtencion,
			   @FechaFin, 
			   @Localidad,
				   @Pais, 
				   @Usuario,
				   getdate(),
				   @Baja,
				   @IdPersona
				   )
	SELECT SCOPE_IDENTITY()					

END


