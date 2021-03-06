set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Procedure[dbo].[VIA_Get_AreasParaLugaresDeTrabajo]   
-- Add the parameters for the stored procedure here  
@FechaVigencia smalldatetime  
   
AS  
  
declare @NombreSp varchar(60)   
set @NombreSp = (select OBJECT_NAME(@@PROCID))  
exec dbo.Audit @NombreSp  
  
Declare @MuestraDepto as bit  
Declare @MuestraLugaresdeTrabajo as bit  
Declare @MuestraLugaresSinTrabajadores as bit  
  
--- 0-0-0 = Areas Formales (Autoridades)  
--- 1-0-0 = Areas Formales con Departamentos  
--- 1-1-0 = Lugares de Trabajo (para tarjetas)  
--- 1-1-1 = Todas las áreas del sistema (para mesa de entradas por ejemplo)  
Set @MuestraDepto = 1  
Set @MuestraLugaresdeTrabajo = 1  
Set @MuestraLugaresSinTrabajadores = 0  
  
  
  
BEGIN  
  
select distinct  
 ta1.Id Id_Area  
 ,ta1.Nivel_Jerarquia2  
 ,tado.Orden  
 ,ta1.Descripcion Descripcion  
 ,replicate (' ', round((ta1.Nivel_Jerarquia2/20),0))+ta1.Descripcion Cadena  
 ,ta1.baja  
 ,isnull(dpers.nrodocumento, '')  
 ,isnull(dpers.Apellido, '')  Apellido  
 ,isnull(dpers.Nombre, '')  Nombre  
 ,AA_Tipos.abreviatura +' '+AA_Org.Organismo_Sigla + ' Nº ' + AA.Acto_Nro + ' ('+convert(char(10),AA.Acto_Fecha,103)+')' ActoEstr  
 ,convert(char(10),@FechaVigencia,103) FechaVigencia  
 ,ta1.Nivel_Formal  
from dbo.Tabla_Areas ta1  
  
inner join (select AAestr.* from dbo.Tabla_Areas_AA_Estr AAestr  
   inner join (select Id_Area,max(Fecha_Desde) fecha from dbo.Tabla_Areas_AA_Estr where Fecha_Desde < @FechaVigencia group by Id_Area) ultmovEstr  
   on ultmovestr.id_area = AAestr.id_area and ultmovestr.fecha = AAestr.Fecha_Desde   
   where id_accion <> 9) vigentes  
on vigentes.id_area = ta1.Id  
  
left join dbo.Tabla_Actos_Adm AA  
on AA.id = vigentes.id_Acto  
  
left join dbo.Tabla_Actos_Adm_Organismos AA_Org  
on AA_Org.Id = AA.Acto_Org  
  
left join dbo.Tabla_Tipos_Actos_Adm AA_Tipos  
on AA_Tipos.id = AA.Acto_Tipo  
  
--- join con otras tablas para traer datos de los firmantes  
left join dbo.Tabla_Firmantes tfirm  
on tfirm.Area = ta1.Id and tfirm.baja = 0  
  
left join dbo.DatosPersonales dpers  
on dpers.NroDocumento = tfirm.Nro_Documento  
  
left join dbo.Tabla_Areas_Depend_Orden tado  
on tado.id_area = ta1.Id  
  
  
where  --right((ltrim(rtrim(ta1.Descripcion))),1) <>'x' -- filtra para no traer las que terminan en x (las uso para marcar bajas pendientes)  
 --and  
  ((ta1.Nivel_Jerarquia2<800 and @MuestraDepto=0) or @MuestraDepto=1)  -- Dic2013 Acá filtro para mostrar Deptos  
 -- and ta1.baja = 0   
 and  
  ((ta1.Nivel_Formal <400 and @MuestraLugaresdeTrabajo = 0)or (ta1.Nivel_Formal <600 and @MuestraLugaresdeTrabajo = 1 and @MuestraLugaresSinTrabajadores = 0) or @MuestraLugaresSinTrabajadores = 1) -- Dic2013 Acá filtro para mostrar Lugares de Trabajo  
  
order BY tado.Orden  
  
  
  
END  



