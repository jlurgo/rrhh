USE [DB_RRHH]
GO
/****** Object:  Table [dbo].[MODI_Imagenes]    Script Date: 05/29/2014 20:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MODI_Imagenes](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[id_interna] [int] NOT NULL,
	[nro_folio] [int] NULL,
	[nombre_imagen] [varchar](50) NOT NULL,
	[bytes_imagen] [image] NULL,
	[id_usuario_ultima_modificacion] [int] NULL,
	[fecha_ultima_modificacion] [datetime] NULL
PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
