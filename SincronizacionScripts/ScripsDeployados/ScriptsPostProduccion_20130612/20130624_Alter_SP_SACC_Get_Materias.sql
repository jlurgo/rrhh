set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Materias]

AS

BEGIN

select
mat.id							Id,	
mat.Nombre						Nombre,
mo.IdModalidad					IdModalidad,
mo.Descripcion					ModalidadDescripcion,
mat.Fecha						Fecha,
cic.id							idCiclo,
cic.Nombre						NombreCiclo,
ie.id							IdInstanciaEvaluacion,
ie.Descripcion					InstanciaDeEvaluacionDescripcion

From dbo.SAC_Materias mat
left join dbo.SAC_Modalidad as mo
on mat.idModalidad = mo.IdModalidad
left join dbo.SAC_Ciclos cic
on cic.id = mat.idCiclo

left join dbo.SAC_Modalidad_InstanciasDeEvaluaciones m_ie
on mo.idModalidad = m_ie.idModalidad
left join dbo.SAC_InstanciasDeEvaluaciones ie
on m_ie.idInstanciaEvaluacion = ie.id

where mat.idBaja is null

ORDER BY mat.id	

END
