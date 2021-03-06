USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_Ins_AntecedentesDeDocencia]    Script Date: 07/18/2014 20:34:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[CV_Ins_AntecedentesDeDocencia]  
@Asignatura varchar(100) = null,  
@CaracterDesignacion varchar(100)= null,  
@CargaHoraria varchar(100)= null,  
@CategoriaDocente varchar(100)= null,  
@DedicacionDocente varchar(100)= null,  
@Establecimiento varchar(100)= null,  
@NivelEducativo int = null,  
@TipoActividad varchar(100)= null,  
@FechaInicio datetime = null,  
@FechaFinalizacion datetime = null,  
@Localidad varchar(100)= null,  
@Pais int= null,  
@Usuario int,  
@Baja int= null,  
@IdPersona int  
  
AS  
  
Begin  
  
 declare @NombreSp varchar(60)   
 set @NombreSp = (select OBJECT_NAME(@@PROCID))  
 exec dbo.Audit @NombreSp    
  

INSERT INTO [dbo].[CV_AntecedentesDeDocencia]  
           ([Asignatura]  
           ,[CaracterDesignacion]  
           ,[CargaHoraria]  
           ,[CategoriaDocente]  
           ,[DedicacionDocente]  
           ,[Establecimiento]  
           ,[NivelEducativo]  
           ,[TipoActividad]  
           ,[FechaInicio]  
           ,[FechaFinalizacion]  
           ,[Localidad]  
           ,[Pais]  
           ,[Usuario]  
           ,[FechaOperacion]  
           ,[Baja],  
           [IdPersona])  
     VALUES  
           (@Asignatura,  
           @CaracterDesignacion,  
           @CargaHoraria,  
           @CategoriaDocente,  
           @DedicacionDocente,  
           @Establecimiento,  
           @NivelEducativo,  
           @TipoActividad,  
           @FechaInicio,  
           @FechaFinalizacion,  
           @Localidad,  
           @Pais,  
           @Usuario,  
           GETDATE(),  
           @Baja,  
           @IdPersona)  
	SELECT SCOPE_IDENTITY()			
  
END  
  
  
  
  
  
  
  
  
  
  
  