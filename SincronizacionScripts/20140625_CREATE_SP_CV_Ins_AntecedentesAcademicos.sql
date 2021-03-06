USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_AntecedentesAcademicos]    Script Date: 07/23/2014 21:16:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[CV_Ins_AntecedentesAcademicos]  
(  
 @Titulo varchar(100) = null,  
 @Nivel int = null,  
 @Establecimiento varchar(100) = null,  
 @Especialidad varchar(100) = null,  
 @FechaIngreso[datetime] = null,  
 @FechaEgreso[datetime] = null,  
 @Localidad varchar(100) = null,  
 @Pais int  = null,  
 @Usuario[int],   
 @Baja [int]  = null,  
 @IdPersona [int] = null 
  
)  
  
AS  
  
BEGIN  
   
 declare @NombreSp varchar(60)   
 set @NombreSp = (select OBJECT_NAME(@@PROCID))  
 exec dbo.Audit @NombreSp    
   

 INSERT INTO [dbo].[CV_AntecedentesAcademicos]  
  (Titulo,Nivel, Establecimiento, Especialidad, FechaIngreso, FechaEgreso, Localidad, Pais,Usuario,FechaOperacion,Baja,IdPersona )  
 VALUES   
  (@Titulo,@Nivel, @Establecimiento,@Especialidad,@FechaIngreso, @FechaEgreso,@Localidad,@Pais,@Usuario,GETDATE(),@Baja,@idPersona )  
   
 SELECT SCOPE_IDENTITY()  
   
END



