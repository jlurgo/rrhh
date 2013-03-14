USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_Docentes]    Fecha de la secuencia de comandos: 03/06/2013 22:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAC_Docentes](
	[id] [smallint]IDENTITY(1,1) NOT NULL,
	[NroDocumento] [int] NOT NULL,
	[Apellido] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Nombre] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_SAC_Docentes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF