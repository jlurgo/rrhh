USE [DB_RRHH]
GO
/****** Object:  StoredProcedure [dbo].[CV_AsociarUsuarioConMailRegistrado]    Script Date: 09/17/2014 20:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CV_AsociarUsuarioConMailRegistrado]
@Id_Usuario smallint,
@Mail_Registro varchar(50)

as

BEGIN TRAN --obtengo el nro de Contacto
DECLARE @Id_Contacto int 
SET @Id_Contacto = ((SELECT TOP 1 id FROM dbo.GEN_Max_Id_Contacto) + 1)

INSERT INTO [dbo].[GEN_Emails] (Id_Contacto, Tipo_Contacto, Email)
VALUES(@Id_Contacto, 5, @Mail_Registro)

UPDATE [dbo].[GEN_Max_Id_Contacto]           
SET  [Id]  = @Id_Contacto      
 
COMMIT TRAN 

INSERT INTO [dbo].[CV_Usuarios_EmailRegistro] (Id_Usuario, Id_Contacto)
VALUES(@Id_Usuario, @Id_Contacto)
