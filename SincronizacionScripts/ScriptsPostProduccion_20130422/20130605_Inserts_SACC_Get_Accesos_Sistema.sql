/****** Object:  Table [dbo].[SAC_Accesos_Sistema]    Script Date: 06/07/2013 21:35:06 ******/
SET IDENTITY_INSERT [dbo].[SAC_Accesos_Sistema] ON
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (1, N'SACC', N'FormABMMaterias.aspx', N'Materias', NULL, CAST(0x0000A1D200000000 AS DateTime), 3, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (2, N'SACC', N'FormABMCursos.aspx', N'Cursos', NULL, CAST(0x0000A1D200000000 AS DateTime), 5, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (3, N'SACC CENARD', N'FormABMCursos.aspx', N'Cursos', NULL, CAST(0x0000A1D200000000 AS DateTime), 1, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (4, N'SACC', N'FormABMAlumnos.aspx', N'Alumnos', NULL, CAST(0x0000A1D400000000 AS DateTime), 1, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (5, N'SACC', N'FormABMEspaciosFisicos.aspx', N'Espacios Físicos', NULL, CAST(0x0000A1D400000000 AS DateTime), 2, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (7, N'SACC CENARD', N'FormABMEspaciosFisicos.aspx', N'Espacios Físicos', NULL, CAST(0x0000A1D600000000 AS DateTime), 2, 0)
INSERT [dbo].[SAC_Accesos_Sistema] ([id], [menu], [url], [nombre_item], [idbaja], [fecha], [orden], [padre]) VALUES (8, N'SACC', N'FormABMDocentes.aspx', N'Docentes', NULL, CAST(0x0000A1D600000000 AS DateTime), 4, 0)
SET IDENTITY_INSERT [dbo].[SAC_Accesos_Sistema] OFF
