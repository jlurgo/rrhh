set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_Get_Edificios]

AS

BEGIN

select
ed.id							Id,	
ed.Nombre						Nombre,
ed.Calle						Calle,
ed.Numero						Numero,
isnull(ed.Piso,'')				Piso,
isnull(ed.Depatamento,'')		Departamento,
ed.Id_Area						IdArea,
ta.descripcion					NombreArea




From dbo.SAC_Edificios ed
left join dbo.Tabla_Areas ta on
ed.Id_Area = ta.id

where ed.idBaja is null

END




