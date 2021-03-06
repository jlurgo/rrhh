USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_EventosAcademicos]    Script Date: 07/23/2014 21:19:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[CV_Ins_EventosAcademicos]  
@Denominacion varchar(100),  
@TipoDeEvento varchar(100),  
@CaracterDeParticipacion varchar(100),  
@FechaInicio datetime,  
@FechaFin datetime,  
@Duracion varchar(50),  
@Institucion varchar(100),  
@Localidad varchar(100),  
@Pais int,  
@Usuario int,  
--@FechaOperacion, datetime,>  
@Baja int=null,  
@IdPersona int =null  
  
AS  
  
BEGIN  
  
 declare @NombreSp varchar(60)     
 set @NombreSp = (select OBJECT_NAME(@@PROCID))    
 exec dbo.Audit @NombreSp      
  
/* COMENTADO por el agreado de "@IdPersona int =null" y "SELECT SCOPE_IDENTITY()"  
*********************************************************************************  
declare @IdPersona int      
 select @IdPersona = Id from dbo.DatosPersonales where NroDocumento = @Documento      
  
*/  
  
INSERT INTO [DB_RRHH].[dbo].[CV_EventosAcademicos]  
           ([IdPersona]  
           ,[Denominacion]  
           ,[TipoDeEvento]  
           ,[CaracterDeParticipacion]  
           ,[FechaInicio]  
           ,[FechaFin]  
           ,[Duracion]  
           ,[Institucion]  
           ,[Localidad]  
           ,[Pais]  
           ,[Usuario]  
           ,[FechaOperacion]  
           ,[Baja])  
     VALUES  
           (@IdPersona,  
           @Denominacion,  
           @TipoDeEvento,   
           @CaracterDeParticipacion,  
           @FechaInicio,  
           @FechaFin,  
           @Duracion,  
           @Institucion,   
           @Localidad,   
           @Pais,   
           @Usuario,   
          getdate(),  
           @Baja )  
  
SELECT SCOPE_IDENTITY()   
  
END  