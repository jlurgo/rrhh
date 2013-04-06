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
isnull(ed.Depatamento,'')		Departamento




From dbo.SAC_Edificios ed

where ed.idBaja is null

END



