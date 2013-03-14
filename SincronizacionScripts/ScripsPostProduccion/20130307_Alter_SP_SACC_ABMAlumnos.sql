set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SACC_ABM_Alumno]
(	@IdPersona  [int],
	@IdModalidad  [int],
	@IdUsuario  [varchar](30),
	@Fecha [datetime],
	@Baja [bit] = 0	

	) 

AS
  

IF EXISTS (SELECT * FROM dbo.SAC_Alumnos WHERE IdPersona = @IdPersona)
BEGIN
    
UPDATE [dbo].[SAC_Alumnos]       
      
SET  
	[IdPersona]  = @IdPersona,      
	[IdModalidad]  = @IdModalidad,      
	[IdUsuario]  = @IdUsuario,      
	[Fecha]  = GETDATE(),
	[Baja] = @Baja
      
WHERE       
	[IdPersona]  = @IdPersona  

END
ELSE
BEGIN 
INSERT INTO dbo.SAC_Alumnos
values
(	@IdPersona,
	@IdModalidad,
	@IdUsuario,
	GETDATE(),
	@Baja
) 

END     
