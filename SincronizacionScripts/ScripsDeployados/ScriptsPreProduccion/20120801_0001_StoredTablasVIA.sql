/****** Object:  Table [dbo].[VIA_Zonas]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Zonas](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[NombreZona] [nvarchar](100) NOT NULL,
	[Desde] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VIA_GuardarHistorialComisionServicio]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GuardarHistorialComisionServicio]
@id int,
@id_viatico int,
@id_area int,
@accion varchar(50),
@comentario varchar(512)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	insert into dbo.VIA_Prototipo_Historial_Comision_De_Servicio
		(id,
		id_viatico,
		id_area,
		accion,
		fecha,
		comentario)
	values
		(@id,
		 @id_viatico,
		 @id_area,
		 @accion,
		 getdate(),
		 @comentario)
END
GO
/****** Object:  Table [dbo].[VIA_Prototipo_Historial_Comision_De_Servicio]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[VIA_Prototipo_Historial_Comision_De_Servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_viatico] [int] NOT NULL,
	[id_area_origen] [int] NOT NULL,
	[id_area_destino] [int] NOT NULL,
	[accion] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[comentario] [varchar](512) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIA_Tipo_Viatico]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Tipo_Viatico](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[TipoViatico] [nvarchar](100) NULL,
	[Desde] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIA_Valor_ViaticoXZona]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Valor_ViaticoXZona](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[IdTipoViatico] [smallint] NULL,
	[IdZona] [smallint] NULL,
	[Valor] [smallmoney] NULL,
	[Desde] [smalldatetime] NULL,
	[IdActo] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetMediosDeTransporte]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: German 
-- ALTER  date: 22/04/2009
-- Description:	Trae todas los medios de transporte
-- =============================================

ALTER PROCEDURE [dbo].[VIA_GetMediosDeTransporte]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		Id, Nombre
	FROM
		dbo.VIA_MediosDeTransporte
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetZonas]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[VIA_GetZonas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		Id, NombreZona
	FROM
		dbo.VIA_Zonas
	ORDER BY 
		NombreZona
END
GO
/****** Object:  Table [dbo].[VIA_Rel_Zona_Prov]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Rel_Zona_Prov](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Cod_AFIP_Prov] [smallint] NULL,
	[IdZona] [smallint] NULL,
	[Desde] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetMediosDePago]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetMediosDePago]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		VIA_MediosDePago.Id, VIA_MediosDePago.Nombre
	FROM
		dbo.VIA_MediosDePago
	
	
END
GO
/****** Object:  Table [dbo].[VIA_MediosDePago]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_MediosDePago](
	[Id] [smallint] NOT NULL,
	[Nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIA_MediosDeTransporte]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_MediosDeTransporte](
	[Id] [smallint] NOT NULL,
	[Nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VIA_AltaEstadia]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_AltaEstadia]
@IdComisionDeServicio int,
@Desde smalldatetime,
@Hasta smalldatetime,
@IdProvincia smallint,
@Eventuales smallmoney,
@AdicionalParaPasajes smallmoney,
@CalculadoPorCategoria smallmoney,
@Motivo nvarchar(100),
@baja bit,
@usuario smallint

AS

BEGIN

insert into dbo.VIA_Estadias (IdComision, FechaDesde, FechaHasta, Provincia, Eventual, AdicPorPasaje, CalculadoPorCategoria, Motivo, Baja, Usuario)
values (@IdComisionDeServicio,@Desde,@Hasta,@IdProvincia,@Eventuales,@AdicionalParaPasajes,@CalculadoPorCategoria,@Motivo ,@baja,@usuario )

select SCOPE_IDENTITY() 

END
GO
/****** Object:  StoredProcedure [dbo].[VIA_AltaPasaje]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_AltaPasaje]
@IdComisionDeServicio int,
@Origen int,
@Destino int,
@Precio smallmoney,
@Fecha smalldatetime,
@MedioDeTransporte smallint,
@MedioDePago smallint,
@Baja bit,
@usuario smallint

AS

BEGIN

insert into dbo.VIA_Pasajes (IdComision, LocalidadOrigen, LocalidadDestino, Precio, Fecha, MedioDeTransporte, MedioDePago, Baja, Usuario)
values (@IdComisionDeServicio,@Origen,@Destino,@Precio,@Fecha,@MedioDeTransporte, @MedioDePago ,@Baja,@usuario )

select SCOPE_IDENTITY() 

END
GO
/****** Object:  Table [dbo].[VIA_SaltosPreferenciales]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_SaltosPreferenciales](
	[Id_area_origen] [int] NOT NULL,
	[Id_area_destino] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIA_ComisionesDeServicio]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_ComisionesDeServicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAreaCreadora] [int] NOT NULL,
	[DocumentoAgente] [int] NOT NULL,
	[estado] [nvarchar](50) NOT NULL,
	[Baja] [bit] NOT NULL,
	[Usuario] [smallint] NOT NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIA_TipoPlanta_TipoViatico]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VIA_TipoPlanta_TipoViatico](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[IdTipoPlanta] [smallint] NULL,
	[IdTipoViatico] [smallint] NULL,
	[IdNivel] [varchar](50) NULL,
	[IdGrado] [varchar](50) NULL,
	[Desde] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VIA_Estadias]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Estadias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdComision] [int] NOT NULL,
	[FechaDesde] [smalldatetime] NOT NULL,
	[FechaHasta] [smalldatetime] NOT NULL,
	[Provincia] [smallint] NOT NULL,
	[Eventual] [smallmoney] NOT NULL,
	[AdicPorPasaje] [smallmoney] NOT NULL,
	[CalculadoPorCategoria] [smallmoney] NOT NULL,
	[Motivo] [nvarchar](100) NULL,
	[Baja] [bit] NOT NULL,
	[Usuario] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VIA_Pasajes]    Script Date: 07/24/2012 21:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VIA_Pasajes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdComision] [int] NOT NULL,
	[LocalidadOrigen] [int] NOT NULL,
	[LocalidadDestino] [int] NOT NULL,
	[Precio] [smallmoney] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[MedioDeTransporte] [smallint] NOT NULL,
	[MedioDePago] [smallint] NOT NULL,
	[Baja] [bit] NOT NULL,
	[Usuario] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetZonaDeLaProvincia]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetZonaDeLaProvincia]
	-- Add the parameters for the stored procedure here
	@idProvincia smallint
AS
BEGIN
	SELECT 
		zon.Id, zon.NombreZona, zon.Desde
	FROM
		dbo.VIA_Rel_Zona_Prov relZonaProv
	INNER JOIN dbo.VIA_Zonas zon
		ON zon.Id = relZonaProv.IdZona
	WHERE
		relZonaProv.Cod_AFIP_Prov = @idProvincia
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetAreaPreviaDe]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Belén Jorge y Javi
-- Create date: 12/07/2012
-- Description:	Devuelve el área por la que pasó un viático antes del área actual
-- =============================================
CREATE PROCEDURE [dbo].[VIA_GetAreaPreviaDe]
@Id_Viatico int 
AS
BEGIN
	DECLARE @idAreaActual AS INT
	SELECT		@idAreaActual = id_area_destino
		FROM	VIA_Prototipo_Historial_Comision_De_Servicio
		WHERE	id_viatico = @Id_Viatico AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Prototipo_Historial_Comision_De_Servicio
							WHERE	id_viatico = @Id_Viatico)
									
									
	DECLARE @idAreaPrevia AS INT
	SELECT		@idAreaPrevia = id_area_origen
		FROM	VIA_Prototipo_Historial_Comision_De_Servicio
		WHERE	id_viatico = @Id_Viatico AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Prototipo_Historial_Comision_De_Servicio
							WHERE	id_viatico = @Id_Viatico AND
									accion = 'Aprobar' AND
									id_area_destino = @idAreaActual )

	SELECT	TOP 1
				codigo,
				id_area,
				descripcion
		FROM	tabla_areas_estructura
		WHERE	baja = 0 AND
				id_area = @idAreaPrevia
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetSaltosPreferenciales]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIA_GetSaltosPreferenciales]
	-- Add the parameters for the stored procedure here
	@Id_area int
AS
BEGIN

	SELECT DISTINCT
		'falta codigo' AS codigo,
		AE.id_area,
		AE.descripcion
	FROM
		dbo.tabla_areas_estructura AE INNER JOIN dbo.VIA_SaltosPreferenciales SP 
				ON AE.id_area = SP.id_area_destino
				
	WHERE
		baja = 0 and
		SP.id_area_origen = @Id_area

END
GO
/****** Object:  StoredProcedure [dbo].[VIA_AltaComisionDeServicio]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_AltaComisionDeServicio]
@idAreaCreadora int,
@documentoAgente int,
@estado nvarchar(50),
@baja bit,
@usuario smallint,
@idPrimerArea smallint
AS

BEGIN

declare @idComision smallint

insert into dbo.VIA_ComisionesDeServicio (IdAreaCreadora, DocumentoAgente, estado, Baja, Usuario)
values (@idAreaCreadora,@documentoAgente,@estado,@baja,@usuario )

set @idComision = (select SCOPE_IDENTITY())


	INSERT INTO [DB_RRHH].[dbo].[VIA_Prototipo_Historial_Comision_De_Servicio]
		SELECT		@idComision as id_viatico
				   ,@idAreaCreadora as id_area_origen
				   ,@idPrimerArea as id_area_destino
				   ,'Creacion'	as accion
				   ,GETDATE() as fecha
				   ,'' as comentario

select @idComision

END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetViaticosPorArea]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Belén y Jorge 
-- ALTER  date: 06/07/2012
-- Description:	Trae todos los Viáticos acorde a un área ingresada
-- Description:	Todavía no está definida correctamente la Tabla dbo.VIA_ComisionesDeServicio
-- =============================================

CREATE PROCEDURE [dbo].[VIA_GetViaticosPorArea]
@Id_Area int 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT		Historial.id_viatico AS id_Comision
	FROM		[VIA_Prototipo_Historial_Comision_De_Servicio] Historial 
				INNER JOIN			
				(SELECT		id_viatico,
							MAX(fecha) as maxFecha
				FROM [VIA_Prototipo_Historial_Comision_De_Servicio]	
				GROUP BY id_viatico) maxFechas
			ON	Historial.Id_viatico = maxFechas.id_viatico AND
				Historial.Fecha = maxFechas.maxfecha
	WHERE	Historial.id_area_destino= @Id_Area
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_ReasignarComision]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Belén y Jorge y Javi
-- ALTER  date: 10/07/2012
-- Description:	Reasigna una comision de servicio a otra area
-- =============================================

CREATE PROCEDURE [dbo].[VIA_ReasignarComision]
@Id_Comision int,
@Id_Area_Destino int ,
@Accion varchar(50),
@Comentarios Varchar(512)

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE		@Id_Area_Origen AS INT
	
	SELECT		@Id_Area_Origen = id_area_destino
		FROM	VIA_Prototipo_Historial_Comision_De_Servicio
		WHERE	id_viatico = @Id_Comision AND
				fecha=(SELECT		MAX(fecha) 
							FROM	VIA_Prototipo_Historial_Comision_De_Servicio
							WHERE	id_viatico = @Id_Comision)	
	
	if @Id_Area_Origen is null
	begin
		set @Id_Area_Origen = @Id_Area_Destino
	end
	
	INSERT INTO [DB_RRHH].[dbo].[VIA_Prototipo_Historial_Comision_De_Servicio]
		SELECT		@Id_Comision as id_viatico
				   ,@Id_Area_Origen as id_area_origen
				   ,@Id_Area_Destino as id_area_destino
				   ,@Accion	as accion
				   ,GETDATE() as fecha
				   ,@Comentarios as comentario
			
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetProvinciasDeLaZona]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetProvinciasDeLaZona]
	-- Add the parameters for the stored procedure here
	@idZona smallint
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		prov.codAFIP, prov.nombreProvincia
	FROM
		dbo.VIA_Rel_Zona_Prov relZonaProv
	INNER JOIN dbo.Provincias prov
		ON prov.codAFIP = relZonaProv.Cod_AFIP_Prov
	WHERE
		relZonaProv.IdZona = @idZona
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetLocalidadesDeLaProvincia]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetLocalidadesDeLaProvincia]
	-- Add the parameters for the stored procedure here
	@idProvincia smallint
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		loc.idLocalidad, loc.nombrelocalidad
	FROM
		dbo.Provincias prov
	INNER JOIN dbo.LocalidadesAFIP loc
		ON prov.codAFIP = loc.id_provincia
	WHERE
		prov.codAFIP = @idProvincia
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetValorDelViatico]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetValorDelViatico]   
@idTipoViatico smallint,
@idZona smallint  

AS  

BEGIN  

	SELECT  * 
	FROM dbo.VIA_Valor_ViaticoXZona valViatico
	WHERE valViatico.idTipoViatico = @idTipoViatico AND valViatico.idZona = @idZona
 
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetAreaSuperiorA]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Belén Jorge y Javi
-- Create date: 12/07/2012
-- Description:	Devuelve el área Superio
-- =============================================
CREATE PROCEDURE [dbo].[VIA_GetAreaSuperiorA]
@Id_area int 
AS
BEGIN

DECLARE @Id_string_areas AS nvarchar(100)
DECLARE @Id_area_superior AS int
-- Selecciona todos los ID que son Área Superior
SELECT @ID_string_areas = dbo.FxIds_Dependencia(@Id_area)
-- Obtenemos el 2do ID
SELECT @Id_area_superior = dbo.fx_Split(@Id_string_areas, ';', 2)


	SELECT TOP 1
		codigo,
		id_area,
		descripcion
	FROM
		dbo.tabla_areas_estructura
	WHERE
		baja = 0 and
		id_area = @Id_area_superior

END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetViaticos]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Javier
-- ALTER  date: 19/07/2012
-- Description:	Trae todos los Viáticos
-- Description:
-- =============================================

CREATE PROCEDURE [dbo].[VIA_GetViaticos]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT		CS.[Id]						AS Id			
				,CS.[Baja]					AS Baja
				,TA.id						AS IdAreaCreadora
				,TA.descripcion				AS DescripcionAreaCreadora
				,DP.Nombre					AS Persona_Nombre
				,DP.Apellido				AS Persona_Apellido
				,DP.Nro_Documento			AS Persona_Documento
				,TAP.id						AS Persona_Area_Id
				,TAP.descripcion			AS Persona_Area_Descripcion
				,E.Id						AS Estadia_Id
				,E.FechaDesde				AS Estadia_Desde
				,E.FechaHasta				AS Estadia_Hasta
				,Pr.idProvincia				AS Estadia_Provincia_Id
				,Pr.nombreProvincia			AS Estadia_Provincia_Nombre
				,E.Eventual					AS Estadia_Eventuales
				,E.AdicPorPasaje			AS Estadia_AdicionalParaPasajes
				,E.CalculadoPorCategoria	AS Estadia_CalculadoPorCategoria
				,E.Motivo					AS Estadia_Motivo
				,P.Id						AS Pasaje_Id
				,LO.idLocalidad				AS Pasaje_LocalidadOrigen_Id
				,LO.nombrelocalidad			AS Pasaje_LocalidadOrigen_Nombre
				,LD.idLocalidad				AS Pasaje_LocalidadDestino_Id
				,LD.nombrelocalidad			AS Pasaje_LocalidadDestino_Nombre
				,P.Fecha					AS Pasaje_FechaDeViaje
				,MT.Id						AS Pasaje_MedioDeTransporte_Id
				,MT.Nombre					AS Pasaje_MedioDeTransporte_Nombre
				,MP.Id						AS Pasaje_MedioDePago_Id
				,MP.Nombre					AS Pasaje_MedioDePago_Nombre
				,P.Precio					AS Pasaje_Precio
				,H.id						AS Transicion_Id
				,TAO.id						AS Transicion_AreaOrigen_Id
				,TAO.descripcion			AS Transicion_AreaOrigen_Descripcion
				,TAD.id						AS Transicion_AreaDestino_Id
				,TAD.descripcion			AS Transicion_AreaDestino_Descripcion
				,H.accion					AS Transicion_Accion
				,H.fecha					AS Transicion_Fecha
				,H.comentario				AS Transicion_Comentario
	FROM		VIA_ComisionesDeServicio CS	
				LEFT JOIN dbo.tabla_areas TA ON  
					CS.IdAreaCreadora = TA.id
				LEFT JOIN	dbo.Datos_Personales DP ON
					CS.DocumentoAgente = DP.Nro_Documento
				LEFT JOIN dbo.vw_desglose_area DA ON  
					DP.id_interna = DA.id_interna  
				LEFT JOIN dbo.tabla_areas TAP ON  
					TAP.id = DA.id_area  
				LEFT JOIN VIA_Estadias E ON
					CS.Id = E.IdComision
				LEFT JOIN Provincias Pr ON
					E.Provincia = Pr.codAFIP
				LEFT JOIN VIA_Pasajes P ON
					CS.Id = P.IdComision
				LEFT JOIN LocalidadesAFIP LO ON
					P.LocalidadOrigen = LO.idLocalidad
				LEFT JOIN LocalidadesAFIP LD ON
					P.LocalidadDestino = LD.idLocalidad
				LEFT JOIN VIA_MediosDeTransporte MT ON
					P.MedioDeTransporte = MT.Id
				LEFT JOIN VIA_MediosDePago MP ON
					P.MedioDePago = MP.Id
				LEFT JOIN VIA_Prototipo_Historial_Comision_De_Servicio H ON
					CS.Id = H.id_viatico
				LEFT JOIN dbo.tabla_areas TAO ON  
					TAO.id = H.id_area_origen  
				LEFT JOIN dbo.tabla_areas TAD ON  
					TAD.id = H.id_area_destino  					
	ORDER BY CS.Id			
				
				
END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetAreasInferiores]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Belén Jorge y Javi
-- Create date: 12/07/2012
-- Description:	Devuelve las areas inferiores en el organigrama
-- =============================================
CREATE PROCEDURE [dbo].[VIA_GetAreasInferiores]
@Id_area int

AS
BEGIN

DECLARE @Codigo AS VARCHAR(24)
SELECT TOP 1 @Codigo= Codigo FROM tabla_areas_estructura WHERE Id_area = @Id_area

EXEC EVAL_GET_Areas_Dependencia @Codigo

END
GO
/****** Object:  StoredProcedure [dbo].[VIA_GetDatosDeContratacion]    Script Date: 07/24/2012 21:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIA_GetDatosDeContratacion]   
@nro_documento int  

AS  

BEGIN  

SELECT  
 dp.apellido Apellido,   
 dp.nombre Nombre,    
 dp.Nro_documento Nro_documento, 
 niv.Id IdNivel,  
 niv.nivel Nivel_Funcion, 
 gra.Id IdGrado, 
 gra.grado Grado_Rango,  
 pla.id IdTipoPlanta,
 pla.descripcion  TPlanta,
 tipoViatico.Id IdTipoViatico,
 tipoViatico.TipoViatico  

FROM dbo.datos_personales dp  
INNER JOIN dbo.vw_desglose_nivelGrado vwng 
	ON dp.id_interna = vwng.id_interna  
INNER JOIN dbo.tabla_niveles niv 
	ON niv.id = vwng.id_nivel  
INNER JOIN dbo.tabla_grados gra   
	ON gra.id = vwng.id_grado  
INNER JOIN dbo.vw_desglose_planta vwdp 
	ON dp.id_interna = vwdp.id_interna  
INNER JOIN dbo.tipo_de_planta pla  
	ON vwdp.id_planta = pla.id  
INNER JOIN dbo.VIA_TipoPlanta_TipoViatico relPlantaViatico
	ON pla.id = relPlantaViatico.IdTipoPlanta
INNER JOIN dbo.VIA_Tipo_Viatico tipoViatico
	ON relPlantaViatico.IdTipoViatico = tipoViatico.Id
WHERE    
 dp.Nro_documento = @nro_documento
 
 END
GO
/****** Object:  ForeignKey [ComisionDeServicio_Estadia]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_Estadias]  WITH CHECK ADD  CONSTRAINT [ComisionDeServicio_Estadia] FOREIGN KEY([IdComision])
REFERENCES [dbo].[VIA_ComisionesDeServicio] ([Id])
GO
ALTER TABLE [dbo].[VIA_Estadias] CHECK CONSTRAINT [ComisionDeServicio_Estadia]
GO
/****** Object:  ForeignKey [Provincia_Estadia]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_Estadias]  WITH CHECK ADD  CONSTRAINT [Provincia_Estadia] FOREIGN KEY([Provincia])
REFERENCES [dbo].[Provincias] ([codAFIP])
GO
ALTER TABLE [dbo].[VIA_Estadias] CHECK CONSTRAINT [Provincia_Estadia]
GO
/****** Object:  ForeignKey [ComisionDeServicio_Pasajes]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_Pasajes]  WITH CHECK ADD  CONSTRAINT [ComisionDeServicio_Pasajes] FOREIGN KEY([IdComision])
REFERENCES [dbo].[VIA_ComisionesDeServicio] ([Id])
GO
ALTER TABLE [dbo].[VIA_Pasajes] CHECK CONSTRAINT [ComisionDeServicio_Pasajes]
GO
/****** Object:  ForeignKey [MedioDePago_Pasajes]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_Pasajes]  WITH CHECK ADD  CONSTRAINT [MedioDePago_Pasajes] FOREIGN KEY([MedioDePago])
REFERENCES [dbo].[VIA_MediosDePago] ([Id])
GO
ALTER TABLE [dbo].[VIA_Pasajes] CHECK CONSTRAINT [MedioDePago_Pasajes]
GO
/****** Object:  ForeignKey [MedioDeTransporte_Pasajes]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_Pasajes]  WITH CHECK ADD  CONSTRAINT [MedioDeTransporte_Pasajes] FOREIGN KEY([MedioDeTransporte])
REFERENCES [dbo].[VIA_MediosDeTransporte] ([Id])
GO
ALTER TABLE [dbo].[VIA_Pasajes] CHECK CONSTRAINT [MedioDeTransporte_Pasajes]
GO
/****** Object:  ForeignKey [TipoPlanta_Viatico]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_TipoPlanta_TipoViatico]  WITH CHECK ADD  CONSTRAINT [TipoPlanta_Viatico] FOREIGN KEY([IdTipoPlanta])
REFERENCES [dbo].[Tipo_de_Planta] ([Id])
GO
ALTER TABLE [dbo].[VIA_TipoPlanta_TipoViatico] CHECK CONSTRAINT [TipoPlanta_Viatico]
GO
/****** Object:  ForeignKey [TipoViatico_TipoPlanta]    Script Date: 07/24/2012 21:57:13 ******/
ALTER TABLE [dbo].[VIA_TipoPlanta_TipoViatico]  WITH CHECK ADD  CONSTRAINT [TipoViatico_TipoPlanta] FOREIGN KEY([IdTipoViatico])
REFERENCES [dbo].[VIA_Tipo_Viatico] ([Id])
GO
ALTER TABLE [dbo].[VIA_TipoPlanta_TipoViatico] CHECK CONSTRAINT [TipoViatico_TipoPlanta]
GO
