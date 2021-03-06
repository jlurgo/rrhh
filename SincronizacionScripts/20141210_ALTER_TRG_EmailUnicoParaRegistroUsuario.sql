set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TRG_EmailUnicoParaRegistroUsuario]
ON [dbo].[GEN_Emails]
AFTER INSERT, UPDATE
AS 
BEGIN
	IF ((SELECT TOP 1 Tipo_Contacto FROM INSERTED) = 5)
		BEGIN
			IF ((select count(*) from dbo.GEN_Emails Where Tipo_Contacto = 5 and Email = (SELECT TOP 1 Email FROM INSERTED))> 1)
				BEGIN
					ROLLBACK TRANSACTION
					RAISERROR('No es posible registrarse con un mail existente', 16, 1)
				END
	
	END
END

