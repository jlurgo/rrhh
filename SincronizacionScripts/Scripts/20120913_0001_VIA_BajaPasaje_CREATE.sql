
CREATE PROCEDURE [dbo].[VIA_BajaPasaje]
@IdPasaje int
AS

BEGIN

UPDATE dbo.VIA_Pasajes 
SET Baja = 1
WHERE Id = @IdPasaje

END