USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[WEB_GetLocalidades]    Script Date: 06/24/2014 20:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WEB_GetLocalidades] 
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

select 
	loc.idLocalidad		Id, 
	loc.nombrelocalidad Descripcion,
	loc.id_provincia	IdProvincia
from	dbo.LocalidadesAFIP loc 
where loc.baja = 0