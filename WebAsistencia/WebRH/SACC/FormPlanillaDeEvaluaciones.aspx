﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormPlanillaDeEvaluaciones.aspx.cs" Inherits="SACC_FormPlanillaDeEvaluaciones" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<%@ Register Src="BarraDeNavegacion.ascx" TagName="BarraNavegacion" TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Planilla De Evaluaciones</title>
    <%= Referencias.Css("../")%>
    <link id="link3" rel="stylesheet" href="Estilos/EstilosSACC.css" type="text/css" runat="server" /> 
    <script type="text/javascript" src="../Scripts/bootstrap/js/jquery.js"> </script>

    <style type="text/css">
        
    .encabezado_fecha
    {
        text-align:center;        
        visibility:visible;
        background-color: transparent !important;
        color: White !important;
        border: none !important;
        cursor:default !important;
        width: 80px;
        margin-top:6px;
    }
    .nota_no_valida, .fecha_no_valida
    {
        background-color: #FF3300 !important;
    }
    .text_2caracteres
    {
        max-width: 20px;
        margin-left: 3px;
        border-width: 1px;
        border-style: solid;
        border-color: rgb(67, 58, 116)!important;
    }
    .text_10caracteres
    {
        max-width: 100px;
        margin-left: 17px;
        border-width: 2px;
        border-style: solid;
        border-color: rgb(67, 58, 116)!important;
        margin-top:8px;
        
    }
    
    .text_2caracteres:hover, .text_10caracteres:hover 
    {     
        border-color: rgb(255, 187, 187)!important;
    }
    </style>
</head>
<body class="marca_de_agua">
    <form id="form1" runat="server">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold;'>M.A.C.C</span> <br/> Módulo de Administración <br/> de Creación de Capacidades" UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <uc3:BarraNavegacion ID="BarraNavegacion" runat="server" />
        <fieldset>
            <legend class="subtitulos">Evaluaciones</legend>
            <div id="DivContenedor" runat="server" class="div_izquierdo2" style="margin:10px; z-index:999;  ">
                <label class="label_evaluaciones">Curso:</label>
                <select id="CmbCurso" onchange="javascript:cargar_instancias(this.value);" runat="server">
                    <option value="0">Seleccione</option>
                </select>
                <input type="checkbox" onchange="javascript:FiltrarCursos()" id="filtrar_cursos_vigentes" /><label> Vigentes</label>
                <br />
                <div id="ContenedorInstancia">
                </div>                       
            <div>
            <div id="ContenedorPlanilla" style="display:inline-block"></div>
            <br />
            <input type="button" class="btn btn-primary " id="BtnGuardarEvaluaciones" onclick="javascript:admin_planilla.guardarPlanilla();" value="Guardar Cambios" style="display:none;" />
            <input type="button" class="btn btn-primary " id="BtnImprimir" onclick="javascript:admin_planilla.imprimirPlanilla();" value="Imprimir" style="display:none;" />
            <input type="hidden" class="btn btn-primary " id="accion" value="" runat="server" />
            <input type="hidden" class="btn btn-primary " id="cursosJSON" value="" runat="server" />
            </div>
            </div>
        </fieldset>
    </form>

   <%= Referencias.Javascript("../") %>
    <script type="text/javascript" src="Scripts/PlanillaEvaluaciones.js"></script>
    <script type="text/javascript" src="Scripts/AdministradorPlanillaEvaluaciones.js"></script>
</body>
<script type="text/javascript">
    
    $(document).ready(function () {
        admin_planilla = new AdministradorDeEvaluaciones();
        GetCursos();

        //Estilos para ver coloreada la grilla en Internet Explorer
        $("tbody tr:even").css('background-color', '#E6E6FA');
        $("tbody tr:odd").css('background-color', '#9CB3D6 ');
    });

    /**************************************************************************************************
    Pad a string to pad_length fillig it with pad_char.
    By default the function performs a left pad, unless pad_right is set to true.

    If the value of pad_length is negative, less than, or equal to the length of the input string, no padding takes place.
    **************************************************************************************************/
    String.prototype.pad = function (pad_char, pad_length, pad_right) {
        var result = this;
        if ((typeof pad_char === 'string') && (pad_char.length === 1) && (pad_length > this.length)) {
            var padding = new Array(pad_length - this.length + 1).join(pad_char); //thanks to http://stackoverflow.com/questions/202605/repeat-string-javascript/2433358#2433358
            result = (pad_right ? result + padding : padding + result);
        }
        return result;
    }
</script>
</html>
