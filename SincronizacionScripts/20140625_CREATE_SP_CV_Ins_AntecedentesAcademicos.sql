CREATE PROCEDURE [dbo].[CV_Ins_AntecedentesAcademicos]
(
	@Titulo varchar(100) = null,
	@Establecimiento varchar(100) = null,
	@Especialidad varchar(100) = null,
	@FechaIngreso[datetime] = null,
	@FechaEgreso[datetime] = null,
	@Localidad varchar(100) = null,
	@Pais varchar(100)  = null,
	@Usuario[int], 
	@Baja [int]  = null,
	@idPersona [int]

)

AS

BEGIN
	
	declare @NombreSp varchar(60) 
	set @NombreSp = (select OBJECT_NAME(@@PROCID))
	exec dbo.Audit @NombreSp  
	
	INSERT INTO [dbo].[CV_AntecedentesAcademicos]
		(Titulo, Establecimiento, Especialidad, FechaIngreso, FechaEgreso, Localidad, Pais,Usuario,FechaOperacion,Baja,IdPersona )
	VALUES 
		(@Titulo, @Establecimiento,@Especialidad,@FechaIngreso, @FechaEgreso,@Localidad,@Pais,@Usuario,GETDATE(),@Baja,@idPersona )
	
	SELECT SCOPE_IDENTITY()
	
END