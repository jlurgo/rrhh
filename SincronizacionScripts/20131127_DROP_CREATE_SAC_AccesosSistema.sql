DROP TABLE [dbo].[SAC_Accesos_Sistema]
GO

CREATE TABLE [dbo].[SAC_Accesos_Sistema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu] [varchar](64) NULL,
	[url] [varchar](128) NULL,
	[nombre_item] [varchar](128) NULL,
	[idbaja] [int] NULL,
	[fecha] [datetime] NULL,
	[orden] [smallint] NULL,
	[padre] [smallint] NULL,
	[posicion] [varchar](1) NULL,
 CONSTRAINT [PK_SAC_Accesos_Sistema] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
)
GO

SET IDENTITY_INSERT [dbo].[SAC_Accesos_Sistema] ON
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (1, N'SACC', N'FormABMMaterias.aspx', N'Materias', NULL, GETDATE(), 3, 10, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (2, N'SACC', N'FormABMCursos.aspx', N'Cursos', NULL, GETDATE(), 5, 10, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (3, N'SACC CENARD', N'FormABMCursos.aspx', N'Cursos', NULL, GETDATE(), 3, 12, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (4, N'SACC', N'FormABMAlumnos.aspx', N'Alumnos', NULL, GETDATE(), 1, 10, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (5, N'SACC', N'FormABMEspaciosFisicos.aspx', N'Espacios Físicos', NULL, GETDATE(), 2, 10, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (7, N'SACC CENARD', N'FormABMEspaciosFisicos.aspx', N'Espacios Físicos', NULL, GETDATE(), 2, 12, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (8, N'SACC', N'FormABMDocentes.aspx', N'Docentes', NULL, GETDATE(), 4, 10, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (9, N'SACC CENARD', N'FormABMAlumnos.aspx', N'Alumnos', NULL, GETDATE(), 1, 12, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (10, N'SACC', N'#', N'Parametría', NULL, GETDATE(), 3, 0, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (11, N'SACC', N'FormPlanillaDeReportesAlumnos.aspx', N'Reportes', NULL, GETDATE(), 1, 0, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (12, N'SACC CENARD', N'#', N'Parametría', NULL, GETDATE(), 1, 0, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (13, N'SACC', N'FormPlanillaObservaciones.aspx', N'Observaciones', NULL, GETDATE(), 2, 0, N'D')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (14, N'SACC', N'FormAsignarAlumnos.aspx', N'Inscripción', NULL, GETDATE(), 1, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (15, N'SACC', N'FormPlanillaAsistenciaAlumnos.aspx', N'Planilla de Asistencia', NULL, GETDATE(), 2, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (16, N'SACC', N'#', N'Evaluaciones', NULL, GETDATE(), 3, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (19, N'SACC', N'FormPlanillaDeEvaluaciones.aspx?accion=c', N'Carga de Notas', NULL, GETDATE(), 1, 16, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (20, N'SACC', N'FormPlanillaDeEvaluaciones.aspx?accion=a', N'Bolet&iacute;n', NULL, GETDATE(), 2, 16, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (21, N'SACC CENARD', N'FormAsignarAlumnos.aspx', N'Inscripción', NULL, GETDATE(), 1, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (22, N'SACC CENARD', N'FormPlanillaAsistenciaAlumnos.aspx', N'Planilla de Asistencia', NULL, GETDATE(), 2, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (23, N'SACC CENARD', N'#', N'Evaluaciones', NULL, GETDATE(), 3, 0, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (24, N'SACC CENARD', N'FormPlanillaDeEvaluaciones.aspx?accion=c', N'Carga de Notas', NULL, GETDATE(), 1, 23, N'I')
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre], [posicion]) VALUES (25, N'SACC CENARD', N'FormPlanillaDeEvaluaciones.aspx?accion=a', N'Bolet&iacute;n', NULL, GETDATE(), 2, 23, N'I')
SET IDENTITY_INSERT [dbo].[SAC_Accesos_Sistema] OFF
GO
