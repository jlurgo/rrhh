USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_EstadosDeCursada]    Fecha de la secuencia de comandos: 08/06/2013 20:35:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAC_EstadosDeCursada](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[idUsuario] [smallint] NULL,
	[fecha] [datetime] NULL,
	[idBaja] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF