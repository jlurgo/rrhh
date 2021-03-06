USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[CV_Publicaciones]    Fecha de la secuencia de comandos: 07/30/2014 22:07:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CV_Publicaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CantidadHojas] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DatosEditorial] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisponeCopia] [int] NOT NULL,
	[DisponeAdjunto] [int] NOT NULL,
	[Titulo] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FechaPublicacion] [datetime] NULL,
	[Usuario] [int] NOT NULL,
	[FechaOperacion] [datetime] NOT NULL,
	[Baja] [int] NULL,
	[IdPersona] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CV_Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_PublicacionesDatosPersonales] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[DatosPersonales] ([Id])
GO
ALTER TABLE [dbo].[CV_Publicaciones] CHECK CONSTRAINT [FK_PublicacionesDatosPersonales]