set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SACC_DesinscribirAlumno]
@IdPersona int

as

delete from dbo.SAC_Alumnos where IdPersona = @idPersona

