GO
/****** Objeto:  StoredProcedure [dbo].[SACC_AltaAlumno]    Fecha de la secuencia de comandos: 02/27/2013 21:37:47 ******/

CREATE PROCEDURE [dbo].[SACC_AltaAlumno]
@IdPersona int,
@IdModalidad int

AS

BEGIN

insert into dbo.SACC_Alumnos (IdPersona, dModalidad)
values (@IdPersona,@IdModalidad )

END
