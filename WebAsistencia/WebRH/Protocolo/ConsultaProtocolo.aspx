﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultaProtocolo.aspx.cs" Inherits="FormularioProtocolo_ConsultaProtocolo" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Áreas</title>
        <%= Referencias.Css("../")%>
        <%= Referencias.Javascript("../")%>
        <link id="link1" rel="stylesheet" href="ConsultaProtocolo.css" type="text/css" runat="server" />
        <link id="link5" rel="stylesheet" href="VistaDeArea.css" type="text/css" runat="server" />
    </head>
    <body>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True"></asp:ScriptManager>
            <uc2:BarraMenu ID="BarraMenu" runat="server" UrlEstilos="../Estilos/" UrlImagenes="../Imagenes/" UrlPassword="../" />
            <div id="ContenedorPrincipal" class="contenedor_principal contenedor_principal_consulta_protocolo">            
                <legend>
                    Listado de Áreas del Ministerio de Desarrollo Social de Nación                     
                    <input style="height:35px;" type="text" id="search" class="search" placeholder="Buscar"/>     
                </legend>  
                <div id="ContenedorPlanilla" runat="server">
 
                </div>
                <asp:HiddenField ID="texto_mensaje_exito" runat="server" />
                <asp:HiddenField ID="texto_mensaje_error" runat="server" />
                <asp:HiddenField ID="areasJSON" runat="server" EnableViewState="true"/>
                <asp:HiddenField ID="txtIdArea" runat="server" />
                <asp:HiddenField ID="idArea" runat="server" />
            </div>
            <div id="plantillas">
                <div id="plantilla_vista_area" class="vista_area">
                    <div class="contenido">
                        <div><div class="titulo">Responsable:</div> <div id="responsable" class="valor"></div></div>
                        <div><div class="titulo">Dirección:</div> <div id="direccion" class="valor"></div></div>
                        <div><div class="titulo">Teléfono:</div> <div id="telefono" class="valor"></div></div>
                        <div><div class="titulo">Fax:</div> <div id="fax" class="valor"></div></div>
                        <div><div class="titulo">Mail:</div> <div id="mail" class="valor"></div></div>
                        <div id="asistentes"></div>
                    </div>
                </div>
                <div id="plantilla_vista_asistente" class="vista_asistente">
                    <div><div id="cargo" class="titulo"></div> <div id="resumen" class="valor"></div></div>                 
                </div>
            </div>
        </form>
    </body>

    <script type="text/javascript" src="AdministradorDeAreas.js"></script>
    <script type="text/javascript" src="../Scripts/Area.js"></script>
    <script type="text/javascript" src="VistaDeArea.js"></script>
    <script type="text/javascript" src="VistaDeAsistente.js"></script>
    <script type="text/javascript" src="../SACC/Scripts/AdministradorDeMensajes.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var admin = new AdministradorDeAreas();

            //Estilos para ver coloreada la grilla en Internet Explorer
            $("tbody tr:even").css('background-color', '#E6E6FA');
            $("tbody tr:odd").css('background-color', '#9CB3D6 ');
        });
    </script>
</html>
