USE [DB_RRHH]
GO
/****** Objeto:  StoredProcedure [dbo].[SACC_Get_Materias]    Fecha de la secuencia de comandos: 03/11/2013 21:20:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Get_Inscripciones]

AS

BEGIN

select
insc.id							Id,	
insc.IdCurso					IdCurso,
insc.IdAlumno					IdAlumno,
insc.Fecha						Fecha

From dbo.SAC_Inscripciones insc

where insc.idBaja is null

END