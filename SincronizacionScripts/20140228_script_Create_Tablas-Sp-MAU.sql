

GO
/****** Object:  Table [dbo].[MAU_Accesos_A_URL]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAU_Accesos_A_URL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](256) NULL,
	[idBaja] [int] NULL,
	[fechaBaja] [datetime] NULL,
 CONSTRAINT [PK_MAU_Accesos_A_Ulr] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MAU_Accesos_A_URL] ON
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (1, N'/webrh/SACC/Inicio.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (2, N'/webrh/MODI/Modi.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (3, N'/webrh/MenuPrincipal/Menu.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (4, N'/webrh/SeleccionDeArea.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (5, N'/webrh/SiCoI/AltaDeDocumento.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (6, N'/webrh/MAU/AdministradorDeUsuarios.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (7, N'/webrh/SACC/FormABMAlumnos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (8, N'/webrh/SACC/FormPlanillaDeReportesAlumnos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (9, N'/webrh/SACC/FormABMEspaciosFisicos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (10, N'/webrh/SACC/FormPlanillaObservaciones.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (11, N'/webrh/SACC/FormABMMaterias.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (12, N'/webrh/SACC/FormABMDocentes.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (13, N'/webrh/SACC/FormABMCursos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (14, N'/webrh/SACC/FormAsignarAlumnos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (15, N'/webrh/SACC/FormPlanillaDeEvaluaciones.aspx?accion=c', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (16, N'/webrh/SACC/FormPlanillaAsistenciaAlumnos.aspx', NULL, NULL)
INSERT [dbo].[MAU_Accesos_A_URL] ([id],  [url], [idBaja], [fechaBaja]) VALUES (17, N'/webrh/SACC/FormPlanillaDeEvaluaciones.aspx?accion=a', NULL, NULL)
SET IDENTITY_INSERT [dbo].[MAU_Accesos_A_URL] OFF
/****** Object:  Table [dbo].[MAU_Funcionalidades]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAU_Funcionalidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[IdBaja] [int] NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_MAU_Funcionalidades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MAU_Funcionalidades] ON
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (1, N'ingreso_a_macc', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (2, N'ingreso_a_modi', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (3, N'ingreso_a_menu_principal', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (4, N'ingreso_a_administracion_de_areas', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (6, N'ingreso_a_mesa_de_entradas', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (7, N'ingreso_a_administracion_de_usuarios', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (8, N'administracion_macc', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (10, N'administracion_macc_cenard', NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades] ([Id], [Nombre], [IdBaja], [FechaBaja]) VALUES (11, N'gestion_de_viaticos', NULL, NULL)
SET IDENTITY_INSERT [dbo].[MAU_Funcionalidades] OFF
/****** Object:  Table [dbo].[MAU_Funcionalidades_Por_Usuario]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAU_Funcionalidades_Por_Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdFuncionalidad] [int] NOT NULL,
	[IdBaja] [int] NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [PK_MAU_Funcionalidades_Por_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)) ON [PRIMARY]
GO
--INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([Id], [IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (96, 306, 11, NULL, NULL)
/****** Object:  Table [dbo].[MAU_Menues]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAU_Menues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu] [varchar](255) NULL,
	[idbaja] [int] NULL,
	[fecha] [datetime] NULL,
	[Padre] [int] NULL,
 CONSTRAINT [PK_MAU_Menues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MAU_Menues] ON
INSERT [dbo].[MAU_Menues] ([id], [menu], [idbaja], [fecha], [Padre]) VALUES (1, N'PRINCIPAL', NULL, NULL, NULL)
INSERT [dbo].[MAU_Menues] ([id], [menu], [idbaja], [fecha], [Padre]) VALUES (2, N'MACC_IZQ', NULL, NULL, NULL)
INSERT [dbo].[MAU_Menues] ([id], [menu], [idbaja], [fecha], [Padre]) VALUES (3, N'MACC_DER', NULL, NULL, NULL)
INSERT [dbo].[MAU_Menues] ([id], [menu], [idbaja], [fecha], [Padre]) VALUES (4, N'MACC_CALIFICACIONES', NULL, NULL, 2)
INSERT [dbo].[MAU_Menues] ([id], [menu], [idbaja], [fecha], [Padre]) VALUES (5, N'MACC_PARAMETRIA', NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[MAU_Menues] OFF
/****** Object:  Table [dbo].[MAU_Items_De_Menu]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAU_Items_De_Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](256) NULL,
	[descripcion] [varchar](256) NULL,
	[idAccesoAUrl] [int] NOT NULL,
	[orden] [int] NULL,
	[idBaja] [int] NULL,
	[fechaBaja] [datetime] NULL,
	[padre] [int] NULL,
 CONSTRAINT [PK_MAU_Items_De_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MAU_Items_De_Menu] ON
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (1, N'MACC', N'Módulo de apoyo para la creación de capacidades', 1, 0, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (2, N'MODI', N'Módulo para digitalizar legajos', 2, 1, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (3, N'Administración de Areas', N'Módulo para administrar áreas', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (4, N'SICOI', N'Módulo para gestión de tickets', 5, 3, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (5, N'MAU', N'Módulo para gestión de usuarios', 6, 4, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (6, N'Inscripción', N'Inscripción', 14, 1, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (7, N'Planilla de Asistencias', N'Planilla de Asistencias', 16, 2, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (9, N'Carga de Notas', N'Carga de Notas', 15, 1, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (10, N'Boletín', N'Calificaciones', 17, 2, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (11, N'Reportes', N'Reportes', 8, 1, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (12, N'Observaciones', N'Observaciones', 10, 2, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (13, N'Alumnos', N'Alumnos', 7, 1, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (14, N'Espacios Físicos', N'Espacios Físicos', 9, 2, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (15, N'Materias', N'Materias', 11, 3, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (16, N'Docentes', N'Docentes', 12, 4, NULL, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu] ([id], [nombre], [descripcion], [idAccesoAUrl], [orden], [idBaja], [fechaBaja], [padre]) VALUES (17, N'Cursos', N'Cursos', 13, 5, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MAU_Items_De_Menu] OFF
/****** Object:  Table [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAccesoAUrl] [int] NOT NULL,
	[IdFuncionalidad] [int] NOT NULL,
 CONSTRAINT [PK_MAU_Url_Por_Funcionalidad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ON
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (1, 1, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (2, 2, 2)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (3, 3, 3)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (4, 4, 4)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (5, 5, 6)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (6, 6, 7)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (7, 7, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (8, 8, 8)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (9, 9, 8)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (10, 10, 8)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (11, 11, 8)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (12, 12, 8)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (13, 13, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (14, 14, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (15, 15, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (16, 16, 1)
INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] ([Id], [IdAccesoAUrl], [IdFuncionalidad]) VALUES (17, 17, 1)
SET IDENTITY_INSERT [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] OFF
/****** Object:  StoredProcedure [dbo].[MAU_GetAccesosAUrl]    Script Date: 02/28/2014 21:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAU_GetAccesosAUrl]
	@id_url int = null,
	@id_funcionalidad int = null
AS
BEGIN  

  SELECT DISTINCT
		 [MU].[id]
        ,[MF].id idFuncionalidad
        ,[MU].[url]
  FROM [dbo].[MAU_Accesos_A_URL] MU
  LEFT JOIN [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] MUF ON
		 MU.[Id] = MUF.[IdAccesoAUrl]
  LEFT JOIN [dbo].[MAU_Funcionalidades] MF ON
	     MF.[id] = MUF.[IdFuncionalidad]
  WHERE (MU.Id = @id_url or @id_url is null) AND
		(MF.Id = @id_funcionalidad or @id_funcionalidad is null) AND
		MU.idBaja is null AND
		MF.idBaja is null		
END
GO
/****** Object:  ForeignKey [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL]    Script Date: 02/28/2014 21:37:24 ******/
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL] FOREIGN KEY([IdAccesoAUrl])
REFERENCES [dbo].[MAU_Accesos_A_URL] ([id])
GO
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] CHECK CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL]
GO
/****** Object:  ForeignKey [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades]    Script Date: 02/28/2014 21:37:24 ******/
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades] FOREIGN KEY([IdFuncionalidad])
REFERENCES [dbo].[MAU_Funcionalidades] ([Id])
GO
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] CHECK CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades]
GO



/****** Object:  Table [dbo].[MAU_Items_De_Menu_Por_Menu]    Script Date: 02/28/2014 20:24:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAU_Items_De_Menu_Por_Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_itemDeMenu] [int] NOT NULL,
	[id_menu] [int] NOT NULL,
	[idBaja] [int] NULL,
	[fechaBaja] [datetime] NULL,
 CONSTRAINT [PK_MAU_Items_De_Menu_Por_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ON
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (1, 1, 1, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (2, 2, 1, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (3, 3, 1, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (4, 4, 1, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (5, 5, 1, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (6, 6, 2, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (7, 7, 2, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (9, 9, 4, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (10, 10, 4, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (11, 11, 3, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (12, 12, 3, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (13, 13, 5, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (14, 14, 5, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (15, 15, 5, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (16, 16, 5, NULL, NULL)
INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] ([id], [id_itemDeMenu], [id_menu], [idBaja], [fechaBaja]) VALUES (17, 17, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MAU_Items_De_Menu_Por_Menu] OFF
/****** Object:  StoredProcedure [dbo].[MAU_AsignarAreaAUsuario]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure[dbo].[MAU_AsignarAreaAUsuario]
	@id_usuario int,
	@id_area int
AS

BEGIN
	INSERT INTO RH_Usuarios_Areas_Web (id_usuario, id_area, baja)
	values(@id_usuario, @id_area, 0)
end
GO
/****** Object:  StoredProcedure [dbo].[MAU_DesAsignarAreaAUsuario]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure[dbo].[MAU_DesAsignarAreaAUsuario]
	@id_usuario int,
	@id_area int
AS

BEGIN
	DELETE	RH_Usuarios_Areas_Web
	WHERE	id_usuario = @id_usuario AND
			id_area = @id_area
end
GO

/****** Object:  StoredProcedure [dbo].[MAU_GetFuncionalidades]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAU_GetFuncionalidades] 
	@id_usuario int = null,
	@id_funcionalidad int = null
AS
BEGIN  
  SELECT DISTINCT
		 MF.[Id]
        ,MF.[Nombre]
  FROM [dbo].[MAU_Funcionalidades] MF
  LEFT JOIN  [dbo].[MAU_Funcionalidades_Por_Usuario] MFU ON
		MFU.[IdFuncionalidad] = MF.[ID]
  WHERE (MFU.IdUsuario = @id_usuario or @id_usuario is null) AND
		(MF.Id = @id_funcionalidad or @id_funcionalidad is null) AND
		MF.[IdBaja] is null AND MFU.[IdBaja] is null
END
GO
/****** Object:  StoredProcedure [dbo].[MAU_GetFuncionalidadesDeUsuarios]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAU_GetFuncionalidadesDeUsuarios] 
AS
BEGIN  
  SELECT DISTINCT 
		idFuncionalidad id_funcionalidad,
		idUsuario id_usuario
  FROM [dbo].[MAU_Funcionalidades] MF
  INNER JOIN  [dbo].[MAU_Funcionalidades_Por_Usuario] MFU ON
		MFU.[IdFuncionalidad] = MF.[ID]
  WHERE MF.[IdBaja] is null AND MFU.[IdBaja] is null
END
GO
/****** Object:  StoredProcedure [dbo].[Mau_ConcederFuncionalidadA]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Mau_ConcederFuncionalidadA]
@Id_usuario int,
@Id_funcionalidad int
as


insert into dbo.mau_funcionalidades_por_usuario(IdUsuario,IdFuncionalidad)
values(@Id_usuario,@Id_funcionalidad)
GO
/****** Object:  StoredProcedure [dbo].[Mau_DenegarFuncionalidadA]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Mau_DenegarFuncionalidadA]
@Id_usuario int,
@Id_funcionalidad int
as

delete from dbo.mau_funcionalidades_por_usuario
where IdUsuario =@Id_usuario
and IdFuncionalidad = @Id_funcionalidad
GO
/****** Object:  StoredProcedure [dbo].[MAU_CrearUsuario]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[MAU_CrearUsuario]
@id_persona int,
@alias char(15),
@clave_encriptada varchar(60)
as

BEGIN TRAN --creando_usuario
declare @id_usuario int 
select @id_usuario = max(id)+1 FROM dbo.RH_Usuarios

insert into dbo.RH_Usuarios(Id, Nombre, Password, Vence_Passw, Baja, Actualizar_Passw, Administrador, IdPersona)
values(@id_usuario, @alias,@clave_encriptada, '2015-12-12 00:00:00',0, 1, 0, @id_persona)

COMMIT TRAN --creando_usuario

SELECT @Id_Usuario as Id_Usuario
GO
/****** Object:  StoredProcedure [dbo].[MAU_GuardarUsuario]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAU_GuardarUsuario]
    @id int,
	@alias char(15) = NULL,
	@clave_encriptada varchar(60) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.RH_Usuarios
    SET Nombre=ISNULL(@alias,Nombre), 
        Password=ISNULL(@clave_encriptada,Password)
    WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[MAU_GetMenues]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MAU_GetMenues]
	@id_menu int = null
AS
BEGIN  

  SELECT MM.[id]				IdMenu
        ,MM.[menu]				NombreMenu
        ,MM.[padre]				Padre
        ,MIM.[id]				IdItemMenu
        ,MIM.[nombre]			NombreItemMenu
        ,MIM.[descripcion]		DescripcionItemMenu
        ,MIM.[idAccesoAUrl]		IdAccesoAUrl
        ,MIM.[orden]			OrdenItemMenu
  FROM [dbo].[MAU_Menues] MM
  LEFT JOIN [dbo].[MAU_Items_De_Menu_Por_Menu] MIMM ON
	     MM.Id = MIMM.Id_Menu
  LEFT JOIN [dbo].[MAU_Items_De_Menu] MIM ON
	     MIM.Id = MIMM.Id_ItemDeMenu
  WHERE (MM.id = @id_menu or @id_menu is null) AND	   
		 MM.idBaja is null AND MIM.idBaja is null	
END
GO
/****** Object:  StoredProcedure [dbo].[Mau_Loguear_ingreso]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Mau_Loguear_ingreso]
@Id_usuario int
as
--NO BORRAR--  
--GER 27/02/2014: Se agrego para tener un LOG de los usuarios que entran en la pagina  
  
 INSERT INTO dbo.Log_WEB values (@Id_usuario, getdate())    

--NO BORRAR--
GO
/****** Object:  StoredProcedure [dbo].[MAU_GetPermisosSobreAreas]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure[dbo].[MAU_GetPermisosSobreAreas]
AS

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp

BEGIN
	SELECT distinct
		ta.id_area,
		UAW.Id_Usuario
	
	FROM	dbo.tabla_areas_estructura							ta
			LEFT JOIN RH_Usuarios_Areas_Web						UAW ON
			ta.id_area = UAW.Id_Area
	
	WHERE	ta.baja = 0	AND
			UAW.id_usuario IS NOT NULL	
end
GO
/****** Object:  StoredProcedure [dbo].[Web_GetUsuario]    Script Date: 02/28/2014 20:24:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure[dbo].[Web_GetUsuario]      
	@id int = null,
	@id_persona int = null,
	@alias varchar(15) = null 
as      

declare @NombreSp varchar(60) 
set @NombreSp = (select OBJECT_NAME(@@PROCID))
exec dbo.Audit @NombreSp
      
SELECT 
	us.id				Id,
	us.nombre			Alias,      
	us.password			Clave_Encriptada,
	us.IdPersona		Id_Persona,
    us.baja             Baja
FROM   dbo.RH_usuarios		us	 
				
where            
  (us.id = @id OR @id is null) AND 
  (us.Nombre = @alias OR @alias is null) AND 
  (us.IdPersona = @id_persona OR @id_persona is null)
GO
/****** Object:  ForeignKey [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL]    Script Date: 02/28/2014 20:24:42 ******/
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL] FOREIGN KEY([IdAccesoAUrl])
REFERENCES [dbo].[MAU_Accesos_A_URL] ([id])
GO
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] CHECK CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Accesos_A_URL]
GO
/****** Object:  ForeignKey [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades]    Script Date: 02/28/2014 20:24:42 ******/
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad]  WITH CHECK ADD  CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades] FOREIGN KEY([IdFuncionalidad])
REFERENCES [dbo].[MAU_Funcionalidades] ([Id])
GO
ALTER TABLE [dbo].[MAU_Accesos_A_Url_Por_Funcionalidad] CHECK CONSTRAINT [FK_MAU_Accesos_A_Url_Por_Funcionalidad_MAU_Funcionalidades]
GO
/****** Object:  ForeignKey [FK_MAU_Items_De_Menu_Por_Menu_MAU_Menues]    Script Date: 02/28/2014 20:24:42 ******/
ALTER TABLE [dbo].[MAU_Items_De_Menu_Por_Menu]  WITH CHECK ADD  CONSTRAINT [FK_MAU_Items_De_Menu_Por_Menu_MAU_Menues] FOREIGN KEY([id_menu])
REFERENCES [dbo].[MAU_Menues] ([id])
GO
ALTER TABLE [dbo].[MAU_Items_De_Menu_Por_Menu] CHECK CONSTRAINT [FK_MAU_Items_De_Menu_Por_Menu_MAU_Menues]

GO

alter table dbo.Rh_usuarios add IdPersona int  


go





update dbo.rh_usuarios set idPersona =627 where id=8
update dbo.rh_usuarios set idPersona =38 where id=11
update dbo.rh_usuarios set idPersona =2386 where id=26
update dbo.rh_usuarios set idPersona =2717 where id=120
update dbo.rh_usuarios set idPersona =2276 where id=129
update dbo.rh_usuarios set idPersona =2079 where id=135
update dbo.rh_usuarios set idPersona =1505 where id=136
update dbo.rh_usuarios set idPersona =4380 where id=142
update dbo.rh_usuarios set idPersona =1945 where id=146
update dbo.rh_usuarios set idPersona =487 where id=147
update dbo.rh_usuarios set idPersona =6904 where id=149
update dbo.rh_usuarios set idPersona =7102 where id=165
update dbo.rh_usuarios set idPersona =1363 where id=171
update dbo.rh_usuarios set idPersona =4468 where id=269
update dbo.rh_usuarios set idPersona =7500 where id=273
update dbo.rh_usuarios set idPersona =5139 where id=283
update dbo.rh_usuarios set idPersona =5155 where id=289
update dbo.rh_usuarios set idPersona =3808 where id=294
update dbo.rh_usuarios set idPersona =3992 where id=306
update dbo.rh_usuarios set idPersona =5521 where id=307
update dbo.rh_usuarios set idPersona =3807 where id=308
update dbo.rh_usuarios set idPersona =3496 where id=309
update dbo.rh_usuarios set idPersona =341 where id=314
update dbo.rh_usuarios set idPersona =3802 where id=318
update dbo.rh_usuarios set idPersona =5974 where id=326
update dbo.rh_usuarios set idPersona =5621 where id=336
update dbo.rh_usuarios set idPersona =7070 where id=337
update dbo.rh_usuarios set idPersona =553 where id=7
update dbo.rh_usuarios set idPersona =1631 where id=19
update dbo.rh_usuarios set idPersona =1656 where id=24
update dbo.rh_usuarios set idPersona =3287 where id=214
update dbo.rh_usuarios set idPersona =3295 where id=217
update dbo.rh_usuarios set idPersona =5189 where id=295
update dbo.rh_usuarios set idPersona =3988 where id=311
update dbo.rh_usuarios set idPersona =3806 where id=312
update dbo.rh_usuarios set idPersona =57421 where id=313
update dbo.rh_usuarios set idPersona =3821 where id=316
update dbo.rh_usuarios set idPersona =3470 where id=321

go

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (11,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (120,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (129,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (135,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (136,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (142,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (146,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (147,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (149,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (165,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (171,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (174,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (185,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (269,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (273,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (283,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (289,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (294,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (306,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (307,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (308,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (309,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (314,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (318,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (326,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (332,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (336,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (337,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (19,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (24,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (214,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (312,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (321,3, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (8,11, NULL, NULL)



INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (11,4, NULL, NULL)

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (26,11, NULL, NULL)




INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (120,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (129,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (135,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (136,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (142,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (146,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (147,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (149,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (165,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (171,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (174,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (185,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (269,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (273,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (283,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (289,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (294,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (306,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (307,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (308,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (309,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (314,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (318,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (326,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (332,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (336,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (337,4, NULL, NULL)

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (7,11, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (19,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (24,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (214,4, NULL, NULL)

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (217,11, NULL, NULL)

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (295,11, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (311,11, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (312,4, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (313,11, NULL, NULL)

INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,1, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,2, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,3, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,4, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,6, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,7, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (316,11, NULL, NULL)



INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (321,4, NULL, NULL)


INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (294,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (306,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (307,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (308,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (309,8, NULL, NULL)
INSERT [dbo].[MAU_Funcionalidades_Por_Usuario] ([IdUsuario], [IdFuncionalidad], [IdBaja], [FechaBaja]) VALUES (318,8, NULL, NULL)


