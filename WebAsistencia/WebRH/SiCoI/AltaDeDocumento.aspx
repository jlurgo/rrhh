﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaDeDocumento.aspx.cs"
    Inherits="AltaDeDocumento" EnableEventValidation="false" %>

<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SICOI</title>
    <link rel="stylesheet" href="../Estilos/EstilosSICOI.css" type="text/css" runat="server" />
    <link rel="stylesheet" href="../estilos/SelectorDeAreas.css" type="text/css"/>    
    <link rel="stylesheet" href="../scripts/select2-3.4.4/select2.css" type="text/css"/>

    <%= Referencias.Css("../")%>
    <%= Referencias.Javascript("../")%>
</head>
<body class="body-detalle">
    <form id="form1" runat="server">
        <uc2:BarraMenu ID="BarraMenu" runat="server" Feature="<span style='font-size:18px; font-weight: bold;'>M.Co.I</span> <br/> <span style='font-size:12px;'> Módulo de Comunicación  <br/> Interna</span>" UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" UrlPassword="../" />
        <div id="contenedor_principal_sicoi">
            <div id="botonera_paneles_desplegables">
                <input type="button" id="boton_alertas" style="display:none;" class=" btn btn-danger" value="!"/>
                <div id="titulo_ordenar_por">Ordenar por:</div>
                <a id="boton_ordenar_por_area_actual" class="boton_de_ordenamiento btn btn-inverse btn-mini">Área Actual <i class="icon-white"></i></a>
                <a id="boton_ordenar_por_tipo" class="boton_de_ordenamiento btn btn-inverse btn-mini">Tipo <i class="icon-white"></i></a>
                <div id="boton_desplegar_panel_filtros" class="boton_que_abre_panel_desplegable"
                    title="Filtros">
                    Filtros
                </div>
                <div id="boton_desplegar_panel_alta_documento" class="boton_que_abre_panel_desplegable"
                    title="Agregar documento">
                    Alta de documento
                </div>
            </div>
            <div id="panel_filtros" class="panel_desplegable">
                <div id="panelBusquedaBasica">
                    <div class="titulo_filtro"> Buscar documentos:</div>
                    <input type="text" id="inputFiltroGoogleano" runat="server"/>
                </div>
                <div id="panelBusquedaAvanzada">
                    <div class="titulo_filtro">
                        Creado entre:</div>
                    <input type="text" id="filtroFechaDesde" runat="server"/>
                    <div class="agrupador_de_filtros_por_fecha">
                        y
                    </div>
                    <input type="text" id="filtroFechaHasta" runat="server"/>
                    <div>
                    </div>
                    <input type="text" id="filtroTicket" runat="server" visible = "false"  />
                    <div class="titulo_filtro"> Extracto:</div>
                    <input type="text" id="FiltroExtracto" runat="server"/>
                    <div>
                    </div>
                    <div class="titulo_filtro">
                        Número:</div>
                    <input type="text" id="FiltroNumero" runat="server" maxlength="30"  />
                    <div class="titulo_filtro_tipo">
                        Tipo:</div>
                    <asp:DropDownList ID="cmbFiltroPorTipoDeDocumento" runat="server" EnableViewState="true" type = "text" >
                        <asp:ListItem Value="-1" class="placeholder" Selected="true">Todos</asp:ListItem>
                    </asp:DropDownList>
                    <div class="titulo_filtro_categoria">
                        Categoría:</div>
                    <asp:DropDownList ID="cmbFiltroPorCategoria" runat="server" EnableViewState="true" type = "text" >
                        <asp:ListItem Value="-1" class="placeholder" Selected="true">Todas</asp:ListItem>
                    </asp:DropDownList>
                    <div>
                    </div>
                    <div class="titulo_filtro_solo_docs_en_mi_area" id = "titulo_filtro_solo_docs_en_mi_area">
                        Solo documentos en mi área:</div>
                    <input type="checkbox" id="chkFiltroSoloDocsEnMiArea" runat="server" />
                    <div>
                    </div>
                    <div id="titulo_filtro_area_actual" class="titulo_filtro">
                        Área Actual:</div>
                    <div id="selectorAreaActualEnfiltro" class="selector_areas">
                        <input id="buscador" type=hidden />
                    </div>
                    <div id="titulo_filtro_area_origen" class="titulo_filtro">
                        Área Origen:</div>
                    <div id="selectorAreaOrigenEnfiltro" class="selector_areas">
                        <input id="buscador" type=hidden />
                    </div>
                    <div class="titulo_filtro">
                        Detenido más de:</div>
                    <input type="text" id="txtFiltroPorTiempoEnAreaActual" runat="server" soloNumero ="soloNumero" maxlength="4"/>
                    <span>días</span>        
                </div>
                <div class="botones_alta_documento">
                    <input type="button" id="btnToggleBusquedaAvanzada" class=" btn btn-primary" value="+"/>
                    <input type="button" id="btn_aplicar_filtros" class=" btn btn-primary" value="Aplicar filtros"/>
                    <input type="button" id="btn_cancelar_filtro" class=" btn btn-primary" value="Quitar filtros"/>
                </div>
            </div>
            <div id="panel_alta_documento" class="panel_desplegable">
                <asp:DropDownList ID="cmbTipoDeDocumento" nullValue="Tipo de documento" runat="server" EnableViewState="true" >
                    <asp:ListItem Value="" Selected="true"></asp:ListItem>
                </asp:DropDownList>
                <div id="letrasDelTipoDeDocumento">
                </div>
                <asp:TextBox ID="txtNumero" nullValue="Número (opcional)" runat="server" MaxLength="50"></asp:TextBox>
                <asp:DropDownList ID="cmbCategoria" nullValue="Categoría de documento" runat="server" EnableViewState="true">
                    <asp:ListItem Value="" Selected="true"></asp:ListItem>
                </asp:DropDownList>
                <div id="selectorDeAreaOrigen" class="selector_areas">
                    <input id="buscador" type=hidden />
                </div>

                <input type="text" id="inputFechaDoc" nullValue="Fecha de documento (opcional)" runat="server"/>


                <asp:TextBox ID="txtExtracto" nullValue="Ingrese el extracto del documento" TextMode="MultiLine" type = "text" Height="112px" runat="server"></asp:TextBox>
                <div id="selectorDeAreaDestino" class="selector_areas">
                    <input id="buscador" type=hidden />
                </div>
                <asp:TextBox ID="txtComentarios" nullValue="Ingrese sus comentarios (opcional)" runat="server" TextMode="MultiLine" Height="32px" class="detalle_alta_documento" ></asp:TextBox>
                <div class="botones_alta_documento">
                    <input type="button" id="btnCrearDocumento" class=" btn btn-primary" value="Agregar Documento"/>
                    <input type="button" id="btnCancelar" class=" btn btn-primary" value="Cancelar"/>
                </div>
            </div>
            <div id="panel_documentos">
            </div>       
        </div>

        <div id="plantillas">
            <div id="lista_de_documentos">
                <div id="mensaje_maxima_cantidad_de_items_superada"></div>
                <div id="panel_fichas">
                </div>
            </div>

            <div id="plantilla_ficha_chica_de_documento" class="ficha_chica_de_documento ficha_chica_de_documento_par">
                <div id="ficha_chica_contenido_tipo">Expediente N° 97</div>           
                <div id="ficha_chica_titulo_fecha_documento">Fecha:</div>    
                <div id="ficha_chica_contenido_fecha_documento"></div>    
                <div id="ficha_chica_titulo_ticket">Ticket:</div>
                <div id="ficha_chica_contenido_ticket">AAA036</div>                   
                <div id="ficha_chica_titulo_categoria">Categoría:</div>
                <div id="ficha_chica_contenido_categoria">Renuncia</div>
                <input type="button" id="ficha_chica_boton_enviar_documento" value="Enviar" class="btn btn-mini btn-primary"/><br />
                <div id="ficha_chica_titulo_area_actual">Área Actual:</div>
                <div id="ficha_chica_contenido_area_actual">Dirección General de Recursos Humanos y Organización</div><br />
                <div id="ficha_chica_titulo_extracto">Extracto:</div>
                <div id="ficha_chica_contenido_extracto">ddaaddaa</div>
                <div id="ficha_chica_boton_desplegar" class="icon-plus-sign"></div>
            </div>    

            <div id="plantilla_ficha_grande_de_documento" class="ficha_grande_de_documento">
                <div id='ficha_grande_titulo_area_creadora'> Área Creadora:</div>
                <div id="ficha_grande_contenido_area_creadora"> Mesa de Entradas </div><br />
                <div id='ficha_grande_titulo_tiempo_en_area_actual'> En Área Actual Desde:</div>
                <div id="ficha_grande_contenido_tiempo_en_area_actual"> 2 días </div><br />
                <div id='ficha_grande_titulo_comentarios'> Comentarios:</div>
                <textarea id="ficha_grande_contenido_comentarios"></textarea>
                <div id='ficha_grande_titulo_transiciones'> TRANSICIONES </div>
                <div id='ficha_grande_titulo_fecha_de_ingreso'> Fecha de Ingreso</div>
                <div id='ficha_grande_transiciones'></div>
                <div id='ficha_grande_titulo_area_destino'> Próximo Área Destino:</div>
                <div id="ficha_grande_contenido_area_destino" class="selector_areas">
                    <input id="buscador" type=hidden />
                </div>
                <%--<input type="text" id='ficha_grande_contenido_area_destino' data-provide="typeahead" data-items="9"/>--%>
                <input type="button" id="ficha_grande_boton_guardar_cambios" value="Guardar Cambios" class="btn btn-mini btn-primary"/>
            </div>

            <div id="plantilla_transicion_documento" class="transicion_documento">
                <div id='transicion_documento_fecha_de_ingreso'></div>            
                <div id='transicion_documento_area_destino'></div>            
            </div>

            <div class="vista_area_en_selector">
                <div id="nombre"></div> 
            </div>
        </div>

        <asp:HiddenField ID="AreaDelUsuario" runat="server" />
        <asp:HiddenField ID="CategoriasDeDocumento" runat="server" />
        <asp:HiddenField ID="TiposDeDocumento" runat="server" />

        <asp:HiddenField ID="AreaSeleccionadaOrigenEnFiltro" runat="server" />
        <asp:HiddenField ID="AreaSeleccionadaActualEnFiltro" runat="server" />
           
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</body>

    <script type="text/javascript" src="PanelDeFiltrosDeDocumentos.js"></script>
    <script type="text/javascript" src="InputAutocompletableDeAreas.js"></script>
    <script type="text/javascript" src="PanelDeDocumentos.js"></script>
    <script type="text/javascript" src="PanelAltaDeDocumento.js"></script>
    <script type="text/javascript" src="ListaDeFichas.js"></script>
    <script type="text/javascript" src="FichaChicaDeDocumento.js"></script>
    <script type="text/javascript" src="FichaGrandeDeDocumento.js"></script>
    <script type="text/javascript" src="TransicionDeDocumento.js"></script>
    <script type="text/javascript" src="FabricaDeFichasDeDocumento.js"></script>
    <script type="text/javascript" src="WebService.js"></script>
    <script type="text/javascript" src="BotonAlertas.js"></script>

    <script type="text/javascript" src="../Scripts/ProveedorAjax.js"></script>
    <script type="text/javascript" src="../Scripts/Area.js"></script>
    <script type="text/javascript" src="../Scripts/SelectorDeAreas.js"></script>
    <script type="text/javascript" src="../Scripts/RepositorioDeAreas.js"></script>

    <script type="text/javascript" src="../Scripts/select2-3.4.4/Select2.min.js"></script>
    <script type="text/javascript" src="../Scripts/select2-3.4.4/select2_locale_es.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(window).keydown(function (event) {
                if (event.keyCode == 13) {
                    event.preventDefault();
                    return false;
                }
            });
            var tiposDeDocumento = JSON.parse($('#TiposDeDocumento').val());
            var categoriasDeDocumento = JSON.parse($('#CategoriasDeDocumento').val());
            var areaDelUsuario = JSON.parse($('#AreaDelUsuario').val());

            var repositorioDeAreas = new RepositorioDeAreas(new ProveedorAjax("../"));

            var cfg_panel_documentos = {
                divPanelDocumentos: $("#panel_documentos"),
                plantillaFichaChica: $("#plantilla_ficha_chica_de_documento"),
                plantillaFichaGrande: $("#plantilla_ficha_grande_de_documento"),
                plantillaTransicion: $("#plantilla_transicion_documento"),
                uiListaDeDocs: $("#lista_de_documentos"),
                btnOrdenarPorAreaActual: $("#boton_ordenar_por_area_actual"),
                btnOrdenarPorTipo: $("#boton_ordenar_por_tipo"),
                areaDelUsuario: areaDelUsuario,
                repositorioDeAreas: repositorioDeAreas
            }
            var panel_documentos = new PanelDeDocumentos(cfg_panel_documentos);

            var cfg_panel_alta = {
                selectorDeAreaOrigenEnAlta: $('#selectorDeAreaOrigen'),
                selectorDeAreaDestinoEnAlta: $('#selectorDeAreaDestino'),
                cmbTipoDeDocumento: $('#cmbTipoDeDocumento'),
                cmbCategoriaDocumento: $('#cmbCategoria'),
                lblLetrasDelTipoDeDocumento: $("#letrasDelTipoDeDocumento"),
                txtNumero: $('#txtNumero'),
                txtExtracto: $('#txtExtracto'),
                txtComentarios: $('#txtComentarios'),
                btnCrearDocumento: $('#btnCrearDocumento'),
                btnCancelar: $('#btnCancelar'),
                botonDesplegarPanelAlta: $("#boton_desplegar_panel_alta_documento"),
                divPanelAlta: $("#panel_alta_documento"),
                tiposDeDocumento: tiposDeDocumento,
                categoriasDeDocumento: categoriasDeDocumento,
                areaDelUsuario: areaDelUsuario,
                inputFechaDoc: $('#inputFechaDoc'),
                repositorioDeAreas: repositorioDeAreas
            }
            var panel_alta = new PanelAltaDeDocumento(cfg_panel_alta);

            var cfg_panel_filtros = {
                inputFiltroExtractoDocumento: $('#FiltroExtracto'),
                inputFiltroGoogleano: $('#inputFiltroGoogleano'),
                inputFiltroNumeroDocumento: $('#FiltroNumero'),
                inputFiltroFechaDesde: $('#filtroFechaDesde'),
                inputFiltroFechaHasta: $('#filtroFechaHasta'),
                inputFiltroAreaActual: $('#selectorAreaActualEnfiltro'),
                areaActualSeleccionadaEnFiltro: $('#AreaSeleccionadaActualEnFiltro'),
                inputFiltroAreaOrigen: $('#selectorAreaOrigenEnfiltro'),
                areaOrigenSeleccionadaEnFiltro: $('#AreaSeleccionadaOrigenEnFiltro'),
                inputFiltroDetenidoMasDeTantosDias: $('#txtFiltroPorTiempoEnAreaActual'),
                inputFiltroTipoDeDocumento: $('#cmbFiltroPorTipoDeDocumento'),
                inputFiltroCategoriaDocumentoFiltro: $('#cmbFiltroPorCategoria'),
                inputFiltroCheckDocumentosEnMiArea: $('#chkFiltroSoloDocsEnMiArea'),
                tituloFiltroCheckDocumentosEnMiArea: $('#titulo_filtro_solo_docs_en_mi_area'),
                botonDesplegarPanelFiltros: $("#boton_desplegar_panel_filtros"),
                tituloFiltroAreaActual: $('#titulo_filtro_area_actual'),
                divPanelFiltros: $("#panel_filtros"),
                btnAplicarFiltros: $('#btn_aplicar_filtros'),
                btnQuitarFiltros: $('#btn_cancelar_filtro'),
                panelBusquedaBasica: $('#panelBusquedaBasica'),
                panelBusquedaAvanzada: $('#panelBusquedaAvanzada'),
                btnToggleBusquedaAvanzada: $('#btnToggleBusquedaAvanzada'),
                areaDelUsuario: areaDelUsuario,
                tiposDeDocumento: tiposDeDocumento,
                categoriasDeDocumento: categoriasDeDocumento,
                repositorioDeAreas: repositorioDeAreas

            }
            var panel_filtros = new PanelDeFiltrosDeDocumentos(cfg_panel_filtros);

            panel_documentos.setPanelFiltros(panel_filtros);

            panel_alta.setPanelFiltros(panel_filtros);
            panel_alta.setPanelDocumentos(panel_documentos);

            panel_filtros.setPanelAlta(panel_alta);
            panel_filtros.setPanelDocumentos(panel_documentos);

            var botonAlertas = new BotonAlertas({
                boton_alertas: $("#boton_alertas"),
                panel_documentos: panel_documentos
            });


        });
    </script>   
</html>