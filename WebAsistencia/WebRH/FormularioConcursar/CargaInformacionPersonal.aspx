﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargaInformacionPersonal.aspx.cs"
    Inherits="FormularioConcursar_Pantalla1" %>

<%@ Register Src="~/BarraMenu/BarraMenu.ascx" TagName="BarraMenu" TagPrefix="uc2" %>
<%@ Register Src="~/FormularioConcursar/MenuConcursar.ascx" TagName="BarraMenuConcursar"
    TagPrefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <%= Referencias.Css("../") %>
    <link rel="stylesheet" href="../scripts/select2-3.4.4/select2.css" type="text/css" />
    <link rel="stylesheet" href="EstilosPostular.css" />
    <script type="text/javascript" src="../Scripts/bootstrap/js/jquery.js"> </script>
</head>
<body class="">
    <form runat="server" class="cmxform">
    <uc2:BarraMenu ID="BarraMenu" UrlPassword="../" runat="server" Feature="<span style='font-size:20px; font-weight: bold; padding-top:20px;'>PostulAR</span> <br/> "
        UrlImagenes="../Imagenes/" UrlEstilos="../Estilos/" />
    <div class="contenedor_concursar">
        <div class="accordion" id="accordion">
            <uc3:BarraMenuConcursar runat="server" />
            <nav style="min-width: 900px;">
                    <ul class="ul_cv" style="width:100%; margin-left:1%; margin-top:5px; margin-bottom:3px;">    
                        <li class="menu_lista_formularios"><a href="#ancla1">Información Personal</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla2">Antecedentes Académicos</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla3">Actividades de Capacitación</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla4">Actividades Docentes</a></li>
                        <li class="menu_lista_formularios no_borde"><a href="#ancla5">Eventos Académicos</a></li>
                    </ul>
                    <ul class="ul_cv" style="width:90%; margin-left:13%; margin-bottom:3px;">
                        <li class="menu_lista_formularios"><a href="#ancla6">Publicaciones o trabajos</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla7">Matr&iacute;culas</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla8">Instituciones Académicas</a></li>
                        <li class="menu_lista_formularios no_borde"><a href="#ancla9">Experiencia Laboral</a></li>                
                    </ul>
                    <ul class="ul_cv" style="width:60%; margin-left:18%;">
                        <li class="menu_lista_formularios"><a href="#ancla10">Idiomas Extranjeros</a></li>
                        <li class="menu_lista_formularios"><a href="#ancla11">Competencias Informáticas</a></li>
                        <li class="menu_lista_formularios no_borde"><a href="#ancla12">Otras Capacidades</a></li> 
                    </ul>
                </nav>
            <hr style="clear: both; background-color: #0088cc;" />
            <div class="accordion-group">
                <div id="ancla1" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        I. INFORMACIÓN PERSONAL</a>
                </div>
                <div id="collapseOne" class="accordion-body collapse" style="height: 0px;">
                    <div id="contenedor_datosPersonales" class="accordion-inner fondo_form">
                        <fieldset style="width: 100%; min-width: 500px;">
                            <h5>
                                <em>*</em> Campos Obligatorios</h5>
                            <p style="text-transform: uppercase; font-weight: bold;">
                                VISUALIZACIÓN Y EDICIÓN DE LA INFORMACIÓN PERSONAL</p>
                                <p id="lema_para_empleados"></p>
                            <div id="contenedor_datos_legajos">
                                <div class="grupo_campos nueva_linea">
                                    <label for="nombre">
                                        Nombre <em>*</em></label>
                                    <input id="nombre" type="text" rh-control-type="textbox" rh-model-property="Nombre"
                                        style="width: 160px;" data-validar="esNoBlanco" maxlength="100" />
                                </div>
                                <div class="grupo_campos">
                                    <label for="apellido">
                                        Apellido <em>*</em></label>
                                    <input id="apellido" type="text" style="width: 160px;" rh-control-type="textbox"
                                        rh-model-property="Apellido" data-validar="esNoBlanco" />
                                </div>
                                <div id="contenedor_cmb_sexo" class="grupo_campos">
                                    <label for="cmb_sexo">
                                        Sexo <em>*</em></label>
                                    <select id="cmb_sexo" style="width: 100px;" rh-control-type="combo" rh-data-provider="Sexos"
                                        rh-model-property="Sexo" data-validar="haySeleccionEnCombo">
                                    </select>
                                </div>
                                <div id="contenedor_cmb_estado_civil" class="grupo_campos">
                                    <label for="cmb_estadoCivil">
                                        Estado Civil <em>*</em></label>
                                    <select id="cmb_estadoCivil" style="width: 160px;" rh-control-type="combo" rh-data-provider="EstadosCiviles"
                                        rh-model-property="EstadoCivil" data-validar="haySeleccionEnCombo">
                                    </select>
                                </div>
                                <div class="grupo_campos nueva_linea">
                                    <label class="etiqueta_campo" for="cmb_tipoDocumento">
                                        Tipo Documento <em>*</em></label>
                                    <select id="cmb_tipoDocumento" style="width: 170px;" rh-control-type="combo" rh-data-provider="TiposDeDocumento"
                                        rh-model-property="TipoDocumento" data-validar="haySeleccionEnCombo">
                                    </select>
                                </div>
                                <div class="grupo_campos">
                                    <label class="etiqueta_campo" for="txt_documento">
                                        Nro Documento <em>*</em></label>
                                    <input id="txt_documento" type="text" style="width: 160px;" rh-control-type="textbox"
                                        rh-model-property="Dni" data-validar="esNumeroNatural" />
                                </div>
                                <div class="grupo_campos">
                                    <label for="cuil">
                                        CUIL <em>*</em>
                                        <h5 style="display: inline-block;">
                                            (Ej.:99-99999999-9)</h5>
                                    </label>
                                    <input id="cuil" type="text" style="width: 270px;" data-validar="esNoBlanco" />
                                </div>
                                <div class="grupo_campos nueva_linea">
                                    <label class="etiqueta_campo" for="txt_fechaNac">
                                        Fecha Nacimiento <em>*</em></label>
                                    <input type="text" id="txt_fechaNac" style="width: 110px;" rh-control-type="datepicker"
                                        rh-model-property="FechaNacimiento" data-validar="esNoBlanco" />
                                </div>
                                <div class="grupo_campos">
                                    <label class="etiqueta_campo" for="cmb_lugar_nacimiento">
                                        Lugar Nacimiento <em>*</em></label>
                                    <input type="text" id="cmb_lugar_nacimiento" style="width: 210px;" rh-control-type="textbox"
                                        rh-model-property="LugarDeNacimiento" data-validar="esNoBlanco" /></div>
                                <div class="grupo_campos">
                                    <label class="etiqueta_campo" for="cmb_nacionalidad">
                                        Nacionalidad <em>*</em></label>
                                    <select id="cmb_nacionalidad" style="width: 280px;" rh-control-type="combo" rh-data-provider="Nacionalidades"
                                        rh-model-property="Nacionalidad" data-validar="haySeleccionEnCombo">
                                    </select>
                                </div>
                            </div>
                            <div class="grupo_campos nueva_linea">
                                <label class="etiqueta_campo" for="txt_calle1">
                                    Calle <em>*</em></label>
                                <input type="text" id="txt_calle1" name="txt_calle1" style="width: 350px;" data-validar="esNoBlanco"
                                    rh-control-type="textbox" rh-model-property="DomicilioPersonal.Calle" maxlength="100" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_numero1">
                                    Número <em>*</em></label>
                                <input type="text" id="txt_numero1" name="txt_numero1" style="width: 50px" data-validar="esNumeroNatural"
                                    rh-control-type="textbox" rh-model-property="DomicilioPersonal.Numero" maxlength="20" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_piso1">
                                    Piso</label>
                                <input type="text" id="txt_piso1" name="txt_piso1" rh-control-type="textbox" rh-model-property="DomicilioPersonal.Piso"
                                    style="width: 30px" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_dto1">
                                    Dpto</label>
                                <input type="text" id="txt_dto1" name="txt_dto1" rh-control-type="textbox" rh-model-property="DomicilioPersonal.Depto"
                                    style="width: 30px" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo_small" for="txt_cp1">
                                    Código Postal <em>*</em></label>
                                <input type="text" id="txt_cp1" name="txt_cp1" style="width: 80px" rh-control-type="textbox"
                                    rh-model-property="DomicilioPersonal.Cp" data-validar="esNumeroNatural" maxlength="10">
                            </div>
                            <div class="grupo_campos nueva_linea">
                                <label class="etiqueta_campo" for="cmb_provincia1">
                                    Provincia <em>*</em></label>
                                <select id="cmb_provincia1" style="width: 320px;" rh-control-type="combo" rh-propiedad-label="Nombre"
                                    rh-data-provider="Provincias" rh-model-property="DomicilioPersonal.Provincia"
                                    data-validar="haySeleccionEnCombo">
                                </select>
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo_small" for="cmb_localidad1">
                                    Localidad <em>*</em></label>
                                <select id="cmb_localidad1" style="width: 320px;" rh-control-type="combo" rh-propiedad-label="Nombre"
                                    rh-data-provider="Localidades" rh-model-property="DomicilioPersonal.Localidad"
                                    rh-filter-key="IdProvincia" rh-filter-value="DomicilioPersonal.Provincia" data-validar="haySeleccionEnCombo">
                                </select>
                            </div>
                            <div class="grupo_campos nueva_linea">
                                <label class="etiqueta_campo" for="txt_telefono">
                                    Tel&eacute;fono Fijo <em>*</em></label>
                                <input type="text" id="txt_telefono" name="txt_telefonoFijo" style="width: 140px;"
                                    rh-control-type="textbox" rh-model-property="DatosDeContacto.Telefono" data-validar="haySeleccionEnCombo" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_telefono2">
                                    Tel&eacute;fono Celular<em>*</em></label>
                                <input type="text" id="txt_telefono2" name="txt_telefonoCelular" style="width: 140px;"
                                    rh-control-type="textbox" rh-model-property="DatosDeContacto.Telefono2" data-validar="haySeleccionEnCombo" />
                            </div>
                            <div id="contenedor_mails" class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_email">
                                    Correo Electrónico<em>*</em></label>
                                <input type="text" id="txt_email" name="txt_email" style="width: 320px; display:none;" data-validar="esEmailValido, esNoBlanco"
                                    rh-control-type="textbox" rh-model-property="DatosDeContacto.Email" />
                                    <p id="txt_email2" style="margin-top: 5px; display: inline-block; font-size: 13px;"></p> <span style="font-size:10px;">(Para modificar su mail haga click en la foto de su usuario)</span>
                                    <%--<input type="text" id="txt_email2" style="width: 320px" disabled="disabled" />--%>
                            </div>

                           <%-- <div class="grupo_campos">
                                <p class="aclaraciones">
                                    <input id="chk_replicar" type="checkbox" onchange="replicarDireccion()" /> Usar esta
                                    dirección para notificaciones</p>
                            </div>
                        </fieldset>
                        <br />
                        <fieldset style="width: 100%;">
                            <p style="font-weight: bold; text-transform: uppercase;">
                                Información Requerida Para Recibir Notificaciones y Avisos</p>
                            <div class="grupo_campos nueva_linea">
                                <label class="etiqueta_campo" for="text_calle2">
                                    Calle <em>*</em></label>
                                <input type="text" id="text_calle2" name="text_calle2" style="width: 350px;" data-validar="esNoBlanco"
                                    rh-control-type="textbox" rh-model-property="DomicilioLegal.Calle" maxlength="100" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_numero2">
                                    Número <em>*</em></label>
                                <input type="text" id="txt_numero2" name="txt_numero2" style="width: 50px" data-validar="esNumeroNatural"
                                    rh-control-type="textbox" rh-model-property="DomicilioLegal.Numero" maxlength="10" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_piso2">
                                    Piso</label>
                                <input type="text" id="txt_piso2" name="txt_piso2" style="width: 30px" maxlength="10"
                                    rh-control-type="textbox" rh-model-property="DomicilioLegal.Piso" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo" for="txt_dto2">
                                    Dto</label>
                                <input type="text" id="txt_dto2" name="txt_dto2" style="width: 30px" maxlength="10"
                                    rh-control-type="textbox" rh-model-property="DomicilioLegal.Depto" />
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo_small" for="txt_cp2">
                                    Código Postal <em>*</em></label>
                                <input type="text" id="txt_cp2" name="txt_cp2" style="width: 80px" data-validar="esNumeroNatural"
                                    rh-control-type="textbox" rh-model-property="DomicilioLegal.Cp" maxlength="20" /><br />
                            </div>
                            <div class="grupo_campos nueva_linea">
                                <label class="etiqueta_campo" for="cmb_provincia2">
                                    Provincia <em>*</em></label>
                                <select id="cmb_provincia2" style="width: 320px;" rh-control-type="combo" rh-propiedad-label="Nombre"
                                    rh-data-provider="Provincias" rh-model-property="DomicilioLegal.Provincia" data-validar="haySeleccionEnCombo">
                                </select>
                            </div>
                            <div class="grupo_campos">
                                <label class="etiqueta_campo_small" for="cmb_localidad2">
                                    Localidad <em>*</em></label>
                                <select id="cmb_localidad2" style="width: 320px;" rh-control-type="combo" rh-propiedad-label="Nombre"
                                    rh-data-provider="Localidades" rh-model-property="DomicilioLegal.Localidad" rh-filter-key="IdProvincia"
                                    rh-filter-value="DomicilioLegal.Provincia" data-validar="haySeleccionEnCombo">
                                </select>
                            </div>
                        </fieldset>--%>
                        <br />
                        <div  style="text-align: center; clear: left;">
                            <input type="button" class="btn" id="btn_guardar_datosPersonales" value="Guardar" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla2" class="accordion-heading ">
                    <a class="accordion-toggle
    titulo_acordion" style="" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">II. ANTECEDENTES
                        ACADÉMICOS </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_antecedente_academico" class="link">Cargar antecedente académico</a></legend>
                            <h4>
                                Antecedentes Agregados</h4>
                            <div id="ContenedorPlanillaAntecendentesAcademicos" runat="server">
                                <table id="tabla_antecedentes_academicos" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla3" class="accordion-heading">
                    <a class="accordion-toggle
    titulo_acordion" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">III. ACTIVIDADES DE
                        CAPACITACI&Oacute;N </a>
                </div>
                <div id="collapseThree" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_actividad_capacitacion" class="link">Cargar actividad de capacitación</a></legend>
                            <h4>Actividades de Capacitación Agregadas</h4>
                            <div id="ContenedorPlanillaActividadesCapacitacion" runat="server">
                                <table id="tabla_actividades_capacitacion" class="table table-striped">
                                </table>
                            </div>
                            
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla4" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                        IV. ACTIVIDADES DOCENTES </a>
                </div>
                <div id="collapseFour" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_actividad_docente" class="link">Cargar actividad docente</a></legend>
                            <h4>
                                Actividades Docentes Agregadas</h4>
                            <div id="ContenedorPlanillaActividadesDocentes" runat="server">
                                <table id="tabla_actividades_docentes" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla5" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                        V. EVENTOS ACAD&Eacute;MICOS </a>
                </div>
                <div id="collapseFive" class="accordion-body collapse">
                    <div class="accordion-inner
    fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_evento_academico" class="link">Cargar evento académico</a></legend>
                            <h4>
                                Eventos Académicos Agregados</h4>
                            <div id="ContenedorPlanillEventosAcademicos" runat="server">
                                <table id="tabla_eventos_academicos" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla6" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                        VI. PUBLICACIONES O TRABAJOS </a>
                </div>
                <div id="collapseSix" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_publicacion_trabajo" class="link">Cargar publicación o trabajo</a></legend>
                            <h4>
                                Publicaciones y Trabajos Agregados</h4>
                            <div id="ContenedorPlanillaPublicacionesTrabajos" runat="server">
                                <table id="tabla_publicaciones_trabajos" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla7" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">
                        VII. MATR&Iacute;CULAS </a>
                </div>
                <div id="collapseSeven" class="accordion-body
    collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_matricula" class="link">Cargar matrícula</a></legend>
                            <h4>
                                Matrículas Agregadas</h4>
                            <div id="ContenedorPlanillaMatriculas" runat="server">
                                <table id="tabla_matriculas" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla8" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">
                        VIII. INSTITUCIONES ACAD&Eacute;MICAS </a>
                </div>
                <div id="collapseEight" class="accordion-body
    collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_institucion_academica" class="link">Cargar institución académica</a></legend>
                            <h4>
                                Instituciones Académicas Agregadas</h4>
                            <div id="ContenedorPlanillaInstitucionesAcademicas" runat="server">
                                <table id="tabla_instituciones_academicas" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla9" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">
                        IX. EXPERIENCIA LABORAL </a>
                </div>
                <div id="collapseNine" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_experiencia_laboral" class="link">Cargar experiencia laboral</a></legend>
                            <h4>
                                Experiencia Laboral Agregada</h4>
                            <div id="ContenedorPlanillaExperienciasLaborales" runat="server">
                                <table id="tabla_experiencias_laborales" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla10" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
                        X. IDIOMAS EXTRANJEROS </a>
                </div>
                <div id="collapseTen" class="accordion-body collapse">
                    <div class="accordion-inner
    fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_idioma_extranjero" class="link">Cargar idioma extranjero</a></legend>
                            <h4>
                                Idiomas Extranjeros Agregados</h4>
                            <div id="ContenedorPlanillaIdiomasExtranjeros" runat="server">
                                <table id="tabla_idiomas_extranjeros" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla11" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">
                        XI. COMPETENCIAS INFORM&Aacute;TICAS </a>
                </div>
                <div id="collapseEleven" class="accordion-body collapse">
                    <div class="accordion-inner fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_competencia_informatica" class="link">Cargar competencia
                                informática</a></legend>
                            <h4>
                                Competencias Informáticas Agregadas</h4>
                            <div id="ContenedorPlanillaCompetenciasInformaticas" runat="server">
                                <table id="tabla_competencias_informaticas" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div class="accordion-group">
                <div id="ancla12" class="accordion-heading">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwelve">
                        XII. OTRAS CAPACIDADES </a>
                </div>
                <div id="collapseTwelve" class="accordion-body collapse">
                    <div class="accordion-inner
    fondo_form">
                        <fieldset style="width: 100%;">
                            <legend><a id="btn_agregar_otra_capacidad" class="link">Cargar otra capacidad</a></legend>
                            <h4>
                                Otras Capacidades Agregadas</h4>
                            <div id="ContenedorPlanillaOtrasCapacidades" runat="server">
                                <table id="tabla_otras_capacidades" class="table table-striped">
                                </table>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%----------------- MODAL DE VISTA PRELIMINAR ---------------------%>
    <input type="text" id="urlAjax" value="" style="display: none;" />
    <div id="plantillas">
        <div class="botonera_grilla">
            <img id="btn_editar" src="../Imagenes/edit2.png" />
            <img id="btn_eliminar" src="../Imagenes/icono_eliminar2.png" />
        </div>
    </div>
    <div id="un_div_modal" style="width: 65%; height:500px; overflow:scroll;" class="form_concursar">
        <div class="modal_close_concursar">
        </div>
        <div id="contenido_modal">
        </div>
    </div>
    <asp:HiddenField ID="curriculum" runat="server" />
    </form>
    <div id='IrArriba'>
        <a href='#Arriba'><span></span></a>
    </div>
</body>
<script type="text/javascript" src="CvDatosPersonales.js"></script>
<script type="text/javascript" src="PanelDetalleGenerico.js"></script>
<script type="text/javascript" src="PanelListaDeActividadesDocentes.js"></script>
<script type="text/javascript" src="PanelListaDeActividadesCapacitacion.js"></script>
<script type="text/javascript" src="PanelListaDeAntecedentesAcademicos.js"></script>
<script type="text/javascript" src="PanelListaDeEventosAcademicos.js"></script>
<script type="text/javascript" src="PanelListaDePublicacionesTrabajos.js"></script>
<script type="text/javascript" src="PanelListaDeMatriculas.js"></script>
<script type="text/javascript" src="PanelListaDeInstitucionesAcademicas.js"></script>
<script type="text/javascript" src="PanelListaDeExperienciasLaborales.js"></script>
<script type="text/javascript" src="PanelListaDeIdiomasExtranjeros.js"></script>
<script type="text/javascript" src="PanelListaDeCompetenciasInformaticas.js"></script>
<script type="text/javascript" src="PanelListaDeOtrasCapacidades.js"></script>
<script type="text/javascript" src="RepositorioDeTiposDeCapacidadPersonal.js"></script>
<%= Referencias.Javascript("../") %>
<script type="text/javascript" src="Postulacion.js"></script>
<script type="text/javascript" src="../Scripts/ConversorDeFechas.js"></script>
<script type="text/javascript" src="../Scripts/FormularioBindeado.js"></script>
<script type="text/javascript" src="../Scripts/ComboConBusquedaYAgregado.js"></script>
<script type="text/javascript" src="../Scripts/jquery.maskedinput.min.js"> </script>
<script type="text/javascript" src="../Scripts/select2-3.4.4/Select2.min.js"></script>
<script type="text/javascript" src="../Scripts/select2-3.4.4/select2_locale_es.js"></script>
<script type="text/javascript" src="../Scripts/ObjectObserver.js"> </script>
<script type="text/javascript" src="../Scripts/String.js"> </script>
<script type="text/javascript">
    Backend.start();

    $('#tab_cv').addClass('active');

    $(document).ready(function () {
        $(".collapse").collapse('show');

        curriculum = JSON.parse($('#curriculum').val());

        CvDatosPersonales.completarDatos(curriculum.DatosPersonales);

        PanelListaDeOtrasCapacidades.armarGrilla(curriculum.CvCapacidadesPersonales);
        PanelListaDeAntecedentesAcademicos.armarGrilla(curriculum.CvEstudios);
        PanelListaDeCompetenciasInformaticas.armarGrilla(curriculum.CvCompetenciasInformaticas);
        PanelListaDeIdiomasExtranjeros.armarGrilla(curriculum.CvIdiomas);
        PanelListaDeActividadesDocentes.armarGrilla(curriculum.CvDocencias);
        PanelListaDeMatriculas.armarGrilla(curriculum.CvMatricula);
        PanelListaDePublicacionesTrabajos.armarGrilla(curriculum.CvPublicaciones);
        PanelListaDeActividadesCapacitacion.armarGrilla(curriculum.CvCertificadosDeCapacitacion);
        PanelListaDeInstitucionesAcademicas.armarGrilla(curriculum.CvInstitucionesAcademicas);
        PanelListaDeExperienciasLaborales.armarGrilla(curriculum.CvExperienciaLaboral);
        PanelListaDeEventosAcademicos.armarGrilla(curriculum.CvEventosAcademicos);

        
        //Activar leanModal
        $('a[rel*=leanModalConcursar]').click(function () {
            var _this = $(this);
            if (_this.attr("data-url") !== undefined) {
                var div = $("#contenido_modal");
                div.html("");
                $.ajax({
                    url: _this.attr("data-url"),
                    success: function (r) {
                        div.append(r);
                    }
                });
            }
        });

        $('a[rel*=leanModalConcursar]').leanModal({ top: 300, closeButton: ".modal_close_concursar" });


      
    });

</script>
</html>
