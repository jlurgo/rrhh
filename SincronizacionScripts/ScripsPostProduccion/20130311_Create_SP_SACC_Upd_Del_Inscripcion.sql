USE [DB_RRHH]
GO
/****** Objeto:  StoredProcedure [dbo].[SACC_Upd_Del_Inscripcion]    Fecha de la secuencia de comandos: 03/11/2013 21:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Upd_Del_Inscripcion]
(	
	@idCurso  [smallint],
	@idAlumno  [int],	
	@IdUsuario [smallint],
	@Fecha [smalldatetime],
	@IdBaja [int] = null	
) 

AS

BEGIN
    
UPDATE [dbo].[SAC_Inscripcion]       
      
SET  	     
	[idCurso]  = @idCurso,  
	[idAlumno] = @idAlumno,    
	[idusuario]  = @IdUsuario,      
	[Fecha]  = GETDATE(),
	[idBaja] = @IdBaja
      
WHERE       
	[idCurso]  = @idCurso and
	[idAlumno] = @idAlumno  

END