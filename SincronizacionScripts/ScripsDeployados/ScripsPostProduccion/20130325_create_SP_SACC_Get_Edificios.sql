USE [DB_RRHH]
GO
/****** Objeto:  StoredProcedure [dbo].[SACC_Get_Edificios]    Fecha de la secuencia de comandos: 03/25/2013 18:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Get_Edificios]

AS

BEGIN

select
ed.id							Id,	
ed.Nombre						Nombre,
ed.Calle						Calle



From dbo.SAC_Edificios ed

where ed.idBaja is null

END