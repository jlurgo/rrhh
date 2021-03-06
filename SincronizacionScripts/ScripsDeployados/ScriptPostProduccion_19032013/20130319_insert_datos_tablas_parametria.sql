USE [DB_RRHH]
GO
/****** Object:  Table [dbo].[SAC_Modalidad]    Script Date: 03/19/2013 23:19:29 ******/
INSERT [dbo].[SAC_Modalidad] ([IdModalidad], [Descripcion]) VALUES (1, CONVERT(TEXT, N'Fines Puro'))
INSERT [dbo].[SAC_Modalidad] ([IdModalidad], [Descripcion]) VALUES (2, CONVERT(TEXT, N'Fines CENS'))
/****** Object:  Table [dbo].[SAC_Ciclos]    Script Date: 03/19/2013 23:19:29 ******/
SET IDENTITY_INSERT [dbo].[SAC_Ciclos] ON
INSERT [dbo].[SAC_Ciclos] ([id], [Nombre], [idusuario], [Fecha], [idBaja]) VALUES (1, CONVERT(TEXT, N'Sin ciclo'), 292, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_Ciclos] ([id], [Nombre], [idusuario], [Fecha], [idBaja]) VALUES (2, CONVERT(TEXT, N'1er ciclo'), 292, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_Ciclos] ([id], [Nombre], [idusuario], [Fecha], [idBaja]) VALUES (3, CONVERT(TEXT, N'2do ciclo'), 292, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_Ciclos] ([id], [Nombre], [idusuario], [Fecha], [idBaja]) VALUES (4, CONVERT(TEXT, N'3er ciclo'), 292, CAST(0xA1860000 AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[SAC_Ciclos] OFF
/****** Object:  Table [dbo].[SAC_TipoAsistencia]    Script Date: 03/19/2013 23:19:29 ******/
SET IDENTITY_INSERT [dbo].[SAC_TipoAsistencia] ON
INSERT [dbo].[SAC_TipoAsistencia] ([id], [Nombre], [valor], [idusuario], [Fecha], [idBaja]) VALUES (1, CONVERT(TEXT, N'Asistencia Una Hora'), 1, 0, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_TipoAsistencia] ([id], [Nombre], [valor], [idusuario], [Fecha], [idBaja]) VALUES (2, CONVERT(TEXT, N'Asistencia Dos Horas'), 2, 0, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_TipoAsistencia] ([id], [Nombre], [valor], [idusuario], [Fecha], [idBaja]) VALUES (3, CONVERT(TEXT, N'Asistencia Tres Horas'), 3, 0, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_TipoAsistencia] ([id], [Nombre], [valor], [idusuario], [Fecha], [idBaja]) VALUES (4, CONVERT(TEXT, N'Asistencia Indeterminada'), 0, 0, CAST(0xA1860000 AS SmallDateTime), NULL)
INSERT [dbo].[SAC_TipoAsistencia] ([id], [Nombre], [valor], [idusuario], [Fecha], [idBaja]) VALUES (5, CONVERT(TEXT, N'Dia No cursado'), 4, 0, CAST(0xA1860000 AS SmallDateTime), NULL)
SET IDENTITY_INSERT [dbo].[SAC_TipoAsistencia] OFF
