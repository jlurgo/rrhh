set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CV_Upd_Domicilio]
(
	@idDomicilio [int],
	@DomicilioCalle [varchar](50),
	@DomicilioNumero [int] ,
	@DomicilioPiso [varchar](50) = null,
	@DomicilioDepto [varchar](50) = null,
	@DomicilioCp [smallint] = null,
	@DomicilioLocalidad [int] ,
	@DomicilioProvincia [smallint],
	@DomicilioTipo [smallint],
	@DomicilioTelefono varchar(20) = null,
    @DomicilioCorreo_Electronico varchar(50) = null,
    @Usuario smallint = null,
    @Correo_Electronico_MDS varchar(50) = null,
    @DomicilioTelefono2 varchar(50) = null
)

AS

BEGIN
	
	--SET @Id_Contacto del registro (se guarda para borrar/insertarlo nuevamente)
	                                                                                                                                                                                                                                                                                                                                                                                      
	declare @Id_Contacto int
	set @Id_Contacto = (SELECT Id_Contacto FROM [DB_RRHH].[dbo].[GEN_Domicilios] where ID_Domicilio = @idDomicilio)
	
	--Insert el domicilio  en Gen_Domicilios y capturar el id
	UPDATE [dbo].[GEN_Domicilios]
		SET Calle = @DomicilioCalle,
			Número = @DomicilioNumero,
			Piso = @DomicilioPiso,
			Dpto = @DomicilioDepto,
			Codigo_Postal = @DomicilioCp,
			Localidad = @DomicilioLocalidad,
			Provincia = @DomicilioProvincia
		WHERE ID_Domicilio = @idDomicilio


	--**** DELETE **** del registro en GEN_Telefonos y GEN_Emails para luego reinsertarlo (NO USAR UPDATE)
			
	DELETE FROM dbo.GEN_Telefonos where Id_Contacto = @Id_Contacto
	DELETE FROM dbo.GEN_Emails where Id_Contacto = @Id_Contacto

	--*** INSERT *** del TELEFONO1 Y 2 en el nuevo registro con el mismo ID_CONTACTO para mantener relación en GEN_Domicilios
IF(@DomicilioTelefono is not null)	
	BEGIN
	INSERT INTO [dbo].[GEN_Telefonos]
		(Id_Contacto, Tipo_Contacto ,Telefono)
	VALUES 
		(@Id_Contacto, '1',@DomicilioTelefono)
	END

IF(@DomicilioTelefono2 is not null)	
	BEGIN
	INSERT INTO [dbo].[GEN_Telefonos]
		(Id_Contacto,Tipo_Contacto , Telefono)
	VALUES 
		(@Id_Contacto, '2',@DomicilioTelefono2)
	END

--*** INSERT *** del Email/Email_MDS en el nuevo registro con el mismo ID_CONTACTO para mantener relación en GEN_Domicilios
IF(@DomicilioCorreo_Electronico is not null)
	BEGIN	

    INSERT INTO [dbo].[GEN_Emails]
		(Id_Contacto, Tipo_Contacto , Email)
	VALUES 
		(@Id_Contacto, '6',@DomicilioCorreo_Electronico)
	END
--Belén: Tuve que agregar esto porque el campo no puede ser nulo en la tabla y 
--       en la pantalla de CV no existe em campo mail del ministerio.
--       Lo mismo me pasó con Teléfono 2 (celular) que no era obligatorio 
IF(@Correo_Electronico_MDS is not null)
	BEGIN
		INSERT INTO [dbo].[GEN_Emails]
			(Id_Contacto, Tipo_Contacto , Email)
		VALUES 
			(@Id_Contacto, '4', @Correo_Electronico_MDS)
	END	
		
END




