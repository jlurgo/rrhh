﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PanelControlDDJJ104.aspx.cs" Inherits="DDJJ104_PanelControlDDJJ104" %>
<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%= Referencias.Css("../")%>
    <%= Referencias.Javascript("../") %>
</head>
<body>
    <form id="form1" runat="server">

    <uc2:BarraMenu ID="BarraMenu1" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold;'></span>" UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />

    
    <div style="" align="center">
        <div style="display: block; width: 60%; padding: 0; margin-bottom: 27px; font-size: 19.5px;
            line-height: 36px; color: #333333; border: 0; border-bottom: 1px solid #e5e5e5;
            text-shadow: 2px 2px 5px rgba(150, 150, 150, 1); text-align: left;">
            Men&uacute; de DDJJ 104
            
            

                <asp:Button runat="server" ID="btnCertificarPersonasNoCertificadas" style="display: none; float:right;
                margin-top: 4px; margin-left: 4px; border: #0055cc;"
                    RequiereFuncionalidad="certificar_personas_no_certificadas" CssClass="btn btn-primary" 
                    Text="Certificar personas no certificadas" UseSubmitBehavior="True" 
                    onclick="btnCertificarPersonasNoCertificadas_Click" />

                <asp:Button runat="server" ID="btnPersonasNoCertificadas" style="display: none; float:right;
                margin-top: 4px; margin-left: 4px; border: #0055cc;" 
                    RequiereFuncionalidad="personas_no_certificadas" CssClass="btn btn-primary" 
                    Text="Personas no certificadas" UseSubmitBehavior="True" 
                    onclick="btnPersonasNoCertificadas_Click" />

                <asp:Button runat="server" ID="btnConsultaDDJJ" RequiereFuncionalidad="consultar_ddjj" CssClass="btn btn-primary" 
                    Text="Consultar DDJJ" UseSubmitBehavior="True" style="display: none; float:right;
                    margin-top: 4px; margin-left: 4px; border: #0055cc;"
                    onclick="btnConsultaDDJJ_Click"/> 
   

                <asp:Button runat="server" ID="btnCertificarArea" RequiereFuncionalidad="ingreso_a_ddjj104" CssClass="btn btn-primary" 
                    Text="Certificar Areas" UseSubmitBehavior="True" style="display: none; float:right;
                    margin-top: 4px; margin-left: 4px; border: #0055cc;"
                    onclick="btnCertificarArea_Click" /> 

        </div>
    </div>

    </form>
</body>
</html>
