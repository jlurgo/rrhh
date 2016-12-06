﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DatosAbiertos.aspx.cs" Inherits="DatosAbiertos_DatosAbiertos" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Datos Abiertos</title>
    <link rel="stylesheet" type="text/css" href="DatosAbiertos.css" />
    <%= Referencias.Css("../")%>
    <%= Referencias.Javascript("../")%>
</head>
    <body>
        <form id="form1" runat="server">
            <uc2:BarraMenu ID="BarraMenu" runat="server" Feature="<span style='font-size:18px; font-weight: bold;'>Datos Abiertos</span> <br/> <span style='font-size:12px;'> Administración de Usuarios </span>" UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" UrlPassword="../" />        
            <div id="pagina">
                <div id="titulo">Mapa del estado</div>
                <div id="presentacion">Desde esta página podrá descargar el mapa del MDS</div>
                <a href="#" id="btn_mapa_del_estado_xls"> 
                    <img src="xls.png" height=50px width=50px />
                    <div>Mapa del MDS</div>
                </a>
            </div>
        </form>
    </body>
    <script type="text/javascript" src="../Scripts/ConversorDeFechas.js" ></script>
    <script type="text/javascript" src="../Scripts/ExportarAExcel.js" ></script>
    <script type="text/javascript" src="../Scripts/Spin.js" ></script>
    <script type="text/javascript" src="DatosAbiertos.js"></script>

</html>