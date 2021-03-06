USE [DB_RRHH]
GO
/****** Objeto:  Table [dbo].[SAC_Edificios]    Fecha de la secuencia de comandos: 03/22/2013 21:22:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAC_Edificios](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Calle] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Numero] [smallint] NULL,
	[Piso] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Depatamento] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CodigoPostal] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Localidad] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Provincia] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[idusuario] [smallint] NOT NULL,
	[Fecha] [smalldatetime] NOT NULL,
	[idBaja] [int] NULL,
 CONSTRAINT [PK_SAC_Edificios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF