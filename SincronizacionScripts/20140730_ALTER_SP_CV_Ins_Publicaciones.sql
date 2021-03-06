set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[CV_Ins_Publicaciones]
@CantidadHojas varchar(100),
@DatosEditorial varchar(100),
@DisponeCopia int,
@DisponeAdjunto int,
@Titulo varchar(100),
@FechaPublicacion datetime,
@Usuario int,
--@FechaOperacion datetime,
@Baja int=null,  
@IdPersona int =null  

as

BEGIN

INSERT INTO [dbo].[CV_Publicaciones]
           ([CantidadHojas]
           ,[DatosEditorial]
           ,[DisponeCopia]
		   ,[DisponeAdjunto]
           ,[Titulo]
           ,[FechaPublicacion]
           ,[Usuario]
           ,[FechaOperacion]
           ,[Baja]
           ,[IdPersona])
     VALUES
           (@CantidadHojas,
           @DatosEditorial,
           @DisponeCopia,
		   @DisponeAdjunto,           
		   @Titulo,
           @FechaPublicacion, 
           @Usuario,
          getdate(),
           @Baja,
           @IdPersona)

SELECT SCOPE_IDENTITY()   

END

