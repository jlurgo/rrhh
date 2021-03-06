set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SACC_Upd_Del_EspacioFisico]
(	
	@IdEspacioFisico  [smallint] = 0,
	@Aula  [varchar](50),
	@IdEdificio  [smallint],
	@Capacidad  [smallint],		
	@IdUsuario [smallint],
	@Fecha [smalldatetime],
	@IdBaja [int] = null	
) 

AS

BEGIN
    
UPDATE [dbo].[SAC_Espacios_Fisicos]       
      
SET  	     
	[Aula]  = @Aula,  
	[idEdificio] = @IdEdificio, 
    [Capacidad] = @Capacidad,
	[idusuario]  = @IdUsuario,      
	[Fecha]  = GETDATE(),
	[idBaja] = @IdBaja
      
WHERE       
	[id]  = @IdEspacioFisico  

END
