set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Ins_EspacioFisico]
(	
	@Aula  [varchar](50),
	@idEdificio  [smallint],	
	@Capacidad  [smallint],	
	@IdUsuario [smallint],
	@Fecha [smalldatetime],
	@Baja [int] = null
) 

AS
  
BEGIN

INSERT INTO dbo.SAC_Espacios_Fisicos (Aula, idEdificio, Capacidad, idusuario, Fecha, idBaja)
values
(	
	@Aula,
	@idEdificio,
	@Capacidad,
	@IdUsuario,
	GETDATE(),
	@Baja
) 

END
