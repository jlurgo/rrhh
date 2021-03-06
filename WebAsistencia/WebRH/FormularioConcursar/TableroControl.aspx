﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TableroControl.aspx.cs" Inherits="FormularioConcursar_TableroControl" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<%@ Register Src="~/FormularioConcursar/MenuConcursar.ascx" TagName="BarraMenuConcursar" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%= Referencias.Css("../") %>
    <link rel="stylesheet" href="EstilosPostular.css" />
    <script type="text/javascript" src="../Scripts/bootstrap/js/jquery.js"> </script>
</head>
<body>
    <form id="form1" runat="server">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold; padding-top:20px;'>PostulAR</span> <br/> " UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <div class="contenedor_concursar">
        <uc3:BarraMenuConcursar ID="BarraMenuConcursar1" runat="server" />
        <div id="div_tablerocontrol" class="fondo_form" style="padding: 10px;">
                <h2>Tablero de Control</h2>
            <br />
            <iframe id="txtArea1" style="display:none"></iframe>
            <div id="contenedorTabla">
             <%--<input type="text" id="filtrar_comite" class="buscador" style="width:100px;" placeholder="Filtrar Comité"/>--%>
             <input type="text" id="search" class="search" class="buscador" placeholder="Buscar"/>
             <button class="btn btn-primary" id="btnExport" style="float:right"> Exportar a Excel </button>
             <input class="" id="btnInscripciones"  type="button" style="float:right; margin:0 5px;" value="Inscripciones" /> 
             <input class="" id="btnPreinscripciones" type="button" style="float:right; margin:0 5px;" value="Pre Inscripciones" />
            
             
             <table id="tabla_postulaciones" style="width:100%;"></table>
            </div>
             <asp:HiddenField ID="tablero" runat="server" />
                
    </form>
</body>
 <script type="text/javascript" src="../Scripts/ConversorDeFechas.js" ></script>
  <script type="text/javascript" src="../Scripts/ExportarAExcel.js" ></script>
 <script type="text/javascript" src="TableroControl.js" />

<%= Referencias.Javascript("../") %>

<script type="text/javascript">
    Backend.start(function () {
        $(document).ready(function () {

            //HACIENDO EL KEYDOWN EN VEZ DEL KEY UP Y CON EL PREVENT DEFAULT EL ENTER NO ACTUALIZA TODA LA PAGINA
            var busqueda = $("#filtrar_comite");
            busqueda.keydown(function (event) {
                if (event.which == 13) {
                    PantallaEtapaDeTableroControl.FiltrarPorComite();
                    event.preventDefault();
                }
            });

            //var tablero = JSON.parse($('#tablero').val());
            //PantallaEtapaDeTableroControl.InicializarPantalla(tablero);
            PantallaEtapaDeTableroControl.traerPostulaciones(1);

            $('#btnPreinscripciones').click(function () {
                PantallaEtapaDeTableroControl.traerPostulaciones(1);
            });

            $('#btnInscripciones').click(function () {
                PantallaEtapaDeTableroControl.traerPostulaciones(2);
            });

//            $('#filtrar_comite').change(function () {
//                PantallaEtapaDeTableroControl.FiltrarPorComite();
//            });
            $('#btnExport').click(function () {
                ExportarAExcel.fnExcelReport(document.getElementById('tabla_postulaciones'));
            });
        });
    });

    

</script>

</html>
