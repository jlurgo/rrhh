set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
/****** Objeto:  StoredProcedure [dbo].[SACC_GetTodosLosAlumnos]    Fecha de la secuencia de comandos: 02/27/2013 21:37:47 ******/

CREATE PROCEDURE [dbo].[SACC_GetModalidades]

AS

BEGIN

select
IdModalidad,
Descripcion					ModalidadDescripcion


From dbo.SAC_Modalidad


END


