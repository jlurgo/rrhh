set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Objeto:  StoredProcedure [dbo].[SACC_GetTodosLosAlumnos]    Fecha de la secuencia de comandos: 02/27/2013 21:37:47 ******/

ALTER PROCEDURE [dbo].[SACC_GetModalidades]

AS

BEGIN

select
		mo.IdModalidad		IdModalidad,
		mo.Descripcion		ModalidadDescripcion,
		ev.id				idEstructura,
		ev.Descripcion		DescripcionEstructura,
		ie.id				idInstancia,
		ie.Descripcion		DescripcionInstancia


FROM
dbo.SAC_Modalidad mo
inner join dbo.SAC_Modalidad_EstructurasDeEvaluacion me on
mo.IdModalidad = me.IdModalidad
inner join dbo.SAC_EstructurasDeEvaluacion ev on
me.idEstructuraEvaluacion = ev.id
inner join dbo.SAC_EstructurasDeEvaluacion_InstanciasDeEvaluaciones ei on
ev.id = ei.idEstructuraEvaluacion
inner join dbo.SAC_InstanciasDeEvaluaciones ie on
ei.idInstanciaEvaluacion = ie.id


WHERE	ev.idBaja is null

END