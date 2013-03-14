set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Ins_Inscripcion]
(	
	@idCurso  [smallint],
	@idAlumno  [int],	
	@IdUsuario [smallint],
	@Fecha [smalldatetime],
	@IdBaja [int] = null	
) 

AS

BEGIN
    
INSERT [dbo].[SAC_Inscripcion]       
 
values
(	
	@idCurso,
	@idAlumno,
	@IdUsuario,
	GETDATE(),
	@IdBaja
) 

END   
