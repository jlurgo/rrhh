set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[CV_Ins_AntecedentesAcademicos]  
(  
 @Titulo varchar(100) = null,  
 @Nivel int = null,  
 @Anios int = null,  
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
  (Titulo,Nivel, Anios, Establecimiento, Especialidad, FechaIngreso, FechaEgreso, Localidad, Pais,Usuario,FechaOperacion,Baja,IdPersona )  
 VALUES   
  (@Titulo,@Nivel, @Anios, @Establecimiento,@Especialidad,@FechaIngreso, @FechaEgreso,@Localidad,@Pais,@Usuario,GETDATE(),@Baja,@idPersona )  
   
 SELECT SCOPE_IDENTITY()  
   
END





