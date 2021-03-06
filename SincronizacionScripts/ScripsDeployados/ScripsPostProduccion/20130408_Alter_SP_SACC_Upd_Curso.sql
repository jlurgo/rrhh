set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Upd_Del_Curso]
(	
	@id_curso	[smallint],
	@id_materia [smallint],
	@id_docente [int],
	@fecha		[datetime],
	@baja		[int] = null,
	@id_espacioFisico    [smallint]
) 

AS
    
UPDATE [dbo].[SAC_Cursos]
	SET 		
		IdMateria = @id_materia,
		IdDocente = @id_docente,
		Fecha = @fecha,
		idBaja = @baja,
		IdEspacioFisico = @id_espacioFisico
	WHERE Id = @id_curso
