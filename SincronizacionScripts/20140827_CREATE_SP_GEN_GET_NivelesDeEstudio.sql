USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[GEN_GET_NivelesDeEstudio]    Script Date: 08/27/2014 22:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE procedure 
[dbo].[GEN_GET_NivelesDeEstudio] 
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

select Id, Descripcion 
from dbo.[tabla_codigo_escolaridad_nivel]




