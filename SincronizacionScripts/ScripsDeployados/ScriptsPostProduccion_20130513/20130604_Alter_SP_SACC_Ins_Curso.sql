set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Ins_Curso]
(	
	@id_espacioFisico  [smallint],
	@id_materia   [smallint],
	@id_docente   [int],
	@fecha_inicio [datetime],
	@fecha_fin    [datetime],
	@fecha		  [datetime],
	@baja		  [int] = null,
	@Observaciones [nvarchar](500) = ' '
	
) 

AS
    
INSERT INTO [dbo].[SAC_Cursos]
	(IdMateria, IdDocente, Fecha, idBaja,  IdEspacioFisico, FechaInicio, FechaFin, Observaciones)
VALUES
	(@id_materia, @id_docente, @fecha, @baja,  @id_espacioFisico, @fecha_inicio, @fecha_fin, @Observaciones)
	
SELECT SCOPE_IDENTITY()	


