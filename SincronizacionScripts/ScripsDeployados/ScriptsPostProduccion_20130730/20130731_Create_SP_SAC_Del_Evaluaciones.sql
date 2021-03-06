USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[SACC_Del_Asistencias]    Script Date: 07/31/2013 20:27:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SACC_Del_Evaluaciones]
(	
	@id_alumno [int] = 0,
	@id_curso [int] = 0,
	@id_instancia_evaluacion [int] = 0
) 

AS
    
DELETE 
	[dbo].[SAC_Evaluaciones] 
WHERE 
	[idAlumno] = @id_alumno AND
	[idCurso] = @id_curso AND
	[idInstanciaEvaluacion] = @id_instancia_evaluacion
