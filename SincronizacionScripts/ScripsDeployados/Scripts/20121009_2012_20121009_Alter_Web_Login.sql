set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Web_Login]      
@usuario varchar(50),      
@password varchar(50)      
as      
      
DECLARE @usua int      
set @usua = ( select top 1 isnull(us.id,0)  
 from       
  [dbo].[RH_Usuarios_Areas_Web] aw      
 inner join dbo.RH_usuarios us on      
   us.id = aw.id_usuario      
 inner join dbo.tabla_areas ta on      
  ta.id = id_area      
 inner join dbo.web_passwords pa on      
  pa.idUsuario = us.id      
 where       
  us.Nombre = @usuario and      
  pa.password = @password  and      
--  us.password = @password  and      
  us.Baja <> 1      
)    
    
      
 select      
  us.nombre,      
  us.id id_usuario,      
  us.password,      
  ta.id id_area,      
  ta.descripcion nombre_area,
  tad.Calle,
  tad.Nro,
  tad.Piso,
  tad.Dpto,
  tad.Contacto,
  tad.Telefono,
  tad.Fax,
  dp.Fecha_Comunicacion,
  dp.Id_Domicilio,
  dp.Correo_Electronico, 
  isnull(fir.id, 0) es_firmante      
 from       
  [dbo].[RH_Usuarios_Areas_Web] aw      
 inner join dbo.RH_usuarios us on      
   us.id = aw.id_usuario      
 inner join dbo.tabla_areas ta on      
  ta.id = id_area
 left join  dbo.Tabla_Areas_Detalle  tad on
  tad.Id_Area =  ta.id         
 inner join dbo.web_passwords pa on      
  pa.idUsuario = us.id
 left join dbo.RH_Usuarios_Detalles det on
	det.Id_Usuario = aw.id_usuario
 left join dbo.Tabla_Firmantes fir on
	fir.Area = ta.id and
	fir.Nro_Documento = 
		case when det.Mail like '%[^0-9]%' 
		then null 
		else cast(det.Mail as int) end	
		--Esto es porque se uso el campo email para guardar el documento.
 left join dbo.Domicilio_Personal dp on
  dp.Nro_Doc = fir.Nro_Documento
 where       
  us.Nombre = @usuario and      
  pa.password = @password  and   
  us.password = @password  and      
  us.Baja <> 1      
       
  
IF @usua > 0  
BEGIN  
 insert into log_web values (@usua, getdate())      
END      
  


