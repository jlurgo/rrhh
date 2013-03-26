SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SACC_Ins_Horario]
(	
	@nro_dia_semana  [smallint],
	@id_curso [smallint],
	@desde  [varchar](4),	
	@hasta [varchar](4),
	@horas_catedra smallint
) 

AS

INSERT INTO dbo.SAC_Horarios (NroDiaSemana, idCurso, Desde, Hasta)
values
(	
	@nro_dia_semana,
	@id_curso,
	@desde,
	@hasta
)
SELECT SCOPE_IDENTITY()