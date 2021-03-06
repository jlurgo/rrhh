CREATE PROCEDURE [dbo].CV_Upd_Del_CapacidadesPersonales
(
	@Id int,
	@Tipo int = null,
	@Detalle varchar(1000) = null,
	@Usuario int,
	@Baja int = null
)

AS

BEGIN

	declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp   

	UPDATE [dbo].[CV_CapacidadesPersonales]
	SET Tipo = ISNULL(@Tipo, Tipo),
		Detalle = ISNULL(@Detalle, Detalle),
		Usuario = @Usuario,	
		FechaOperacion = GETDATE(),
		Baja = ISNULL(@Baja, Baja)
	WHERE Id = @Id
	
END

