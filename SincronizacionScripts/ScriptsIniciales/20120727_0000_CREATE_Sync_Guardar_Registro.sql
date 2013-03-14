CREATE PROCEDURE [dbo].[Sync_Guardar_Registro]
		@nombreScript	varchar(256),
		@creador		varchar(256)
AS
Declare @a int
BEGIN
	
	SELECT @a = COUNT(*) FROM dbo.Sync_Registro
	  WHERE 
	        nombrescript = @nombreScript
	    --AND creador = @creador 
	if (@a = 0 )
	begin
		INSERT INTO dbo.Sync_Registro
		(nombreScript, creador, fecha)
		VALUES
		(@nombreScript, @creador, GETDATE())
	end
END
