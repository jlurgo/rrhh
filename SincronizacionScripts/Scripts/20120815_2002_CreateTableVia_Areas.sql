CREATE TABLE [dbo].[VIA_Areas](
	[id] [int] NOT NULL,
	[descripcion] [varchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_VIA_Areas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]