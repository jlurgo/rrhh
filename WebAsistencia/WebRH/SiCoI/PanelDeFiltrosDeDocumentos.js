﻿var PanelDeFiltros = function (filtros) {
    this._filtros = filtros;
    this._observadores_activacion = [];
    for (var i = 0; i < this._filtros.length; i++) {
        this._filtros[i].setObservador(this);
    }
}

PanelDeFiltros.prototype = {
    cantidadDeFiltrosActivos: function () {
        return this.filtrosActivos().length;
    },
    filtrosActivos: function () {
        var filtros_activos = [];
        for (var i = 0; i < this._filtros.length; i++) {
            this._filtros[i].agregarFiltroAListaParaAplicar(filtros_activos);
        }
        return filtros_activos;
    },
    filtroActivado: function (filtro) {
        if (this.cantidadDeFiltrosActivos() == 1) {
            for (var i = 0; i < this._observadores_activacion.length; i++) {
                this._observadores_activacion[i].algunFiltroActivado();
            }
        }
        this.cambiaronLosFiltros();
    },
    filtroDesactivado: function (filtro) {
        if (this.cantidadDeFiltrosActivos() == 0) {
            for (var i = 0; i < this._observadores_activacion.length; i++) {
                this._observadores_activacion[i].ningunFiltroActivado();
            }
        }
        this.cambiaronLosFiltros();
    },
    cambiaronLosFiltros: function (filtro) {
        for (var i = 0; i < this._observadores_activacion.length; i++) {
            this._observadores_activacion[i].cambiaronLosFiltros();
        }
    },
    setObservador: function (obs) {
        this._observadores_activacion.push(obs);
        if (this.cantidadDeFiltrosActivos() > 0) { obs.algunFiltroActivado(); }
        if (this.cantidadDeFiltrosActivos() == 0) { obs.ningunFiltroActivado(); }
        this.cambiaronLosFiltros();
    },
    limpiarFiltros: function(){
        for (var i = 0; i < this._filtros.length; i++) {
            this._filtros[i].limpiar();
        }
    }
}

//////////////

var FiltroDeDocumentos = function (input) {
    var self = this;
    this._input = input;
    this._observadores_activacion = [];
    this._input.change(function () {
        self.definirEstado();
    });
    this._input.keyup(function () {
        self.definirEstado();
    });
    this.definirEstado();
    this._habilitado = true;
};

FiltroDeDocumentos.prototype = {
    estaActivo: function () {
        return this._activo;
    },

    //    && (this._activo || this._activo === undefined)
    //    && (!this._activo || this._activo === undefined)

    definirEstado: function () {
        if ((this._input.val() == "" )) this.desactivarFiltro();
        if ((this._input.val() != "")) this.activarFiltro();
    },
    activarFiltro: function () {
        this._activo = true;
        this.agregarFiltroAListaParaAplicar = function (lista) {
            if (this._habilitado) lista.push(this.generarResumenFiltro());
        };
        for (var i = 0; i < this._observadores_activacion.length; i++) {
            this._observadores_activacion[i].filtroActivado(this);
        }
    },
    desactivarFiltro: function () {        
        
        this._activo = false;
        this.agregarFiltroAListaParaAplicar = function (lista) { };
        for (var i = 0; i < this._observadores_activacion.length; i++) {
            this._observadores_activacion[i].filtroDesactivado(this);
        }


    },
    setObservador: function (obs) {
        this._observadores_activacion.push(obs);
        this._activo = undefined;
        this.definirEstado();
    },
    habilitarFiltro: function () {
        this._habilitado = true;
        this.definirEstado();
    },
    desHabilitarFiltro: function () {
        this._habilitado = false;
        this.desactivarFiltro();
    },
    limpiar: function () {

        this._input.val("");
        this._input.change();
        if (this._input.attr('id') == 'cmbFiltroPorTipoDeDocumento' || this._input.attr('id') == 'cmbFiltroPorCategoria') {
            this._input.val("-1");
            this._input.change();
        }

       
    }
};

///////////

var FiltroDeDocumentosQuePintaInput = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentos.call(this, input);
    this.setObservador(
                {
                    filtroActivado: function (filtro) {
                        input.css('background-color', color_activo);
                    },
                    filtroDesactivado: function (filtro) {
                        input.css('background-color', color_inactivo);
                    }
                }
            );
};

FiltroDeDocumentosQuePintaInput.prototype = $.extend(true, {}, FiltroDeDocumentos.prototype);
FiltroDeDocumentosQuePintaInput.prototype.constructor = FiltroDeDocumentosQuePintaInput;


////////////
var FiltroDeDocumentosPorNumero = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorNumero.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorNumero.prototype.constructor = FiltroDeDocumentosPorNumero;
FiltroDeDocumentosPorNumero.prototype.generarResumenFiltro = function () {
    return { tipoDeFiltro: "FiltroDeDocumentosPorNumero",
        numero: this._input.val()
    };
};

///////////////

var FiltroDeDocumentosPorExtracto = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorExtracto.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorExtracto.prototype.constructor = FiltroDeDocumentosPorExtracto;
FiltroDeDocumentosPorExtracto.prototype.generarResumenFiltro = function () {
    return { tipoDeFiltro: "FiltroDeDocumentosPorExtracto",
        extracto: this._input.val()
    };
}

///////////////

var FiltroDeDocumentosGoogleano = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosGoogleano.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosGoogleano.prototype.constructor = FiltroDeDocumentosPorExtracto;
FiltroDeDocumentosGoogleano.prototype.generarResumenFiltro = function () {
    return { tipoDeFiltro: "FiltroDeDocumentosGoogleano",
        criterio: this._input.val()
    };
}

///////////

var FiltroDeDocumentosSoloEnAreaUsuario = function (checkbox, idAreaUsuario) {
    this._idAreaUsuario = idAreaUsuario;
    FiltroDeDocumentos.call(this, checkbox);
};

FiltroDeDocumentosSoloEnAreaUsuario.prototype = $.extend(true, {}, FiltroDeDocumentos.prototype);
FiltroDeDocumentosSoloEnAreaUsuario.prototype.constructor = FiltroDeDocumentosSoloEnAreaUsuario;
FiltroDeDocumentosSoloEnAreaUsuario.prototype.generarResumenFiltro = function () {
    return { tipoDeFiltro: "FiltroDeDocumentosPorAreaActual",
        idArea: this._idAreaUsuario
    };
};
FiltroDeDocumentosSoloEnAreaUsuario.prototype.definirEstado = function () {
    if ((!this._input.is(":checked")) && (this._activo || this._activo === undefined)) this.desactivarFiltro();
    if ((this._input.is(":checked")) && (!this._activo || this._activo === undefined)) this.activarFiltro();
};
FiltroDeDocumentosSoloEnAreaUsuario.prototype.limpiar = function () {
    this._input.attr("checked", false);
    this._input.change();
};
///////////

var FiltroDeDocumentosPorTransicion = function (input, idAreaUsuario) {
    this._idAreaUsuario = idAreaUsuario;
    FiltroDeDocumentos.call(this, input);
};

FiltroDeDocumentosPorTransicion.prototype = $.extend(true, {}, FiltroDeDocumentos.prototype);
FiltroDeDocumentosPorTransicion.prototype.constructor = FiltroDeDocumentosPorTransicion;
FiltroDeDocumentosPorTransicion.prototype.generarResumenFiltro = function () {
    return { tipoDeFiltro: "FiltroDeDocumentosPorTransicion",
        idAreaOrigen : this._input.val(),
        idAreaDestino : this._idAreaUsuario
    };
};

///////////

var FiltroDeDocumentosPorAreaActual = function (input) {
    FiltroDeDocumentos.call(this, input);
};

FiltroDeDocumentosPorAreaActual.prototype = $.extend(true, {}, FiltroDeDocumentos.prototype);
FiltroDeDocumentosPorAreaActual.prototype.constructor = FiltroDeDocumentosPorAreaActual;
FiltroDeDocumentosPorAreaActual.prototype.generarResumenFiltro = function () {
    return { 
        tipoDeFiltro: "FiltroDeDocumentosPorAreaActual",
        idArea: this._input.val()
    };
};

///////////

var FiltroDeDocumentosPorFechaDesde = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorFechaDesde.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorFechaDesde.prototype.constructor = FiltroDeDocumentosPorFechaDesde;
FiltroDeDocumentosPorFechaDesde.prototype.generarResumenFiltro = function () {
    return {
        tipoDeFiltro : "FiltroDeDocumentosPorFechaDesde",
        fechaDesde : this._input.val()
    };
};

///////////

var FiltroDeDocumentosPorFechaHasta = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorFechaHasta.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorFechaHasta.prototype.constructor = FiltroDeDocumentosPorFechaHasta;
FiltroDeDocumentosPorFechaHasta.prototype.generarResumenFiltro = function () {
    return {
        tipoDeFiltro: "FiltroDeDocumentosPorFechaHasta",
        fechaHasta: this._input.val()
    };
};

///////////

var FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA.prototype.constructor = FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA;
FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA.prototype.generarResumenFiltro = function () {
    return {
        tipoDeFiltro: "FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA",
        dias: this._input.val()
    };
};

///////////

var FiltroDeDocumentosPorTipoDocumento = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorTipoDocumento.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorTipoDocumento.prototype.constructor = FiltroDeDocumentosPorTipoDocumento;
FiltroDeDocumentosPorTipoDocumento.prototype.generarResumenFiltro = function () {
    return {
        tipoDeFiltro: "FiltroDeDocumentosPorTipoDocumento",
        idTipo: this._input.val()
    };
};
FiltroDeDocumentosPorTipoDocumento.prototype.definirEstado = function () {
    if ((this._input.val() == "-1") && (this._activo || this._activo === undefined)) this.desactivarFiltro();
    if ((this._input.val() != "-1") && (!this._activo || this._activo === undefined)) this.activarFiltro();
};
///////////

var FiltroDeDocumentosPorCategoria = function (input, color_activo, color_inactivo) {
    FiltroDeDocumentosQuePintaInput.call(this, input, color_activo, color_inactivo);
};

FiltroDeDocumentosPorCategoria.prototype = $.extend(true, {}, FiltroDeDocumentosQuePintaInput.prototype);
FiltroDeDocumentosPorCategoria.prototype.constructor = FiltroDeDocumentosPorCategoria;
FiltroDeDocumentosPorCategoria.prototype.generarResumenFiltro = function () {
    return {
        tipoDeFiltro: "FiltroDeDocumentosPorCategoria",
        idCategoria: this._input.val()
    };
};
FiltroDeDocumentosPorCategoria.prototype.definirEstado = function () {
    if ((this._input.val() == "-1") && (this._activo || this._activo === undefined)) this.desactivarFiltro();
    if ((this._input.val() != "-1") && (!this._activo || this._activo === undefined)) this.activarFiltro();
};


//////////////////
var PanelDeFiltrosDeDocumentos = function (cfg) {
    this.cfg = cfg;

    var self = this;

    var blanco = 'rgb(255, 255, 255)';
    var amarillo = 'rgb(255, 255, 200)';

    self.cfg.areaActualSeleccionadaEnFiltro.val("");
    var selectorDeAreaActualEnfiltro = new SelectorDeAreas({
        ui: self.cfg.inputFiltroAreaActual,
        repositorioDeAreas: cfg.repositorioDeAreas,
        placeholder: "",
        alSeleccionarUnArea: function (area) {
            self.cfg.areaActualSeleccionadaEnFiltro.val(area.id);
            self.cfg.areaActualSeleccionadaEnFiltro.change();
        },
    });

    self.cfg.areaOrigenSeleccionadaEnFiltro.val("");
    var selectorDeAreaOrigenEnfiltro = new SelectorDeAreas({
        ui: self.cfg.inputFiltroAreaOrigen,
        repositorioDeAreas: cfg.repositorioDeAreas,
        placeholder: "",
        alSeleccionarUnArea: function (area) {
            self.cfg.areaOrigenSeleccionadaEnFiltro.val(area.id);
            self.cfg.areaOrigenSeleccionadaEnFiltro.change();
        },
    });

    for (var i = 0; i < self.cfg.tiposDeDocumento.length; i++) {
        var tipo = self.cfg.tiposDeDocumento[i];
        var listItem = $('<option>');
        listItem.val(tipo.Id);
        listItem.text(tipo.descripcion);
        self.cfg.inputFiltroTipoDeDocumento.append(listItem.clone());
    }

    for (var i = 0; i < cfg.categoriasDeDocumento.length; i++) {
        var categoria = cfg.categoriasDeDocumento[i];
        var listItem = $('<option>');
        listItem.val(categoria.Id);
        listItem.text(categoria.descripcion);
        cfg.inputFiltroCategoriaDocumentoFiltro.append(listItem);
    }


    self.cfg.inputFiltroFechaDesde.datepicker({ dateFormat: "dd/mm/yy",
        onSelect: function (date) { self.cfg.inputFiltroFechaDesde.change(); }
    });
    self.cfg.inputFiltroFechaHasta.datepicker({ dateFormat: "dd/mm/yy",
        onSelect: function (date) { self.cfg.inputFiltroFechaHasta.change(); }
    });

    var filtroPorExtracto = new FiltroDeDocumentosPorExtracto(self.cfg.inputFiltroExtractoDocumento, amarillo, blanco);
    var filtroGoogleano = new FiltroDeDocumentosGoogleano(self.cfg.inputFiltroGoogleano, amarillo, blanco);
    var filtroPorNumero = new FiltroDeDocumentosPorNumero(self.cfg.inputFiltroNumeroDocumento, amarillo, blanco);
    var filtroPorFechaDesde = new FiltroDeDocumentosPorFechaDesde(self.cfg.inputFiltroFechaDesde, amarillo, blanco);
    var filtroPorFechaHasta = new FiltroDeDocumentosPorFechaHasta(self.cfg.inputFiltroFechaHasta, amarillo, blanco);
    var filtroPorAreaActual = new FiltroDeDocumentosPorAreaActual(self.cfg.areaActualSeleccionadaEnFiltro);

    filtroPorAreaActual.setObservador(
                {
                    filtroActivado: function (filtro) {
                        self.cfg.inputFiltroAreaActual.css('background-color', amarillo);
                    },
                    filtroDesactivado: function (filtro) {
                        self.cfg.inputFiltroAreaActual.css('background-color', blanco);
                    }
                }
            );

    var filtroPorAreaOrigen = new FiltroDeDocumentosPorTransicion(self.cfg.areaOrigenSeleccionadaEnFiltro, self.cfg.areaDelUsuario.id.toString());
    filtroPorAreaOrigen.setObservador(
                {
                    filtroActivado: function (filtro) {
                        self.cfg.inputFiltroAreaOrigen.css('background-color', amarillo);
                    },
                    filtroDesactivado: function (filtro) {
                        self.cfg.inputFiltroAreaOrigen.css('background-color', blanco);
                    }
                }
            );
    var filtroPorDetenidoMasDeTantosDias = new FiltroDeDocumentosPorTiempoEnUltimaAreaMayorOIgualA(self.cfg.inputFiltroDetenidoMasDeTantosDias, amarillo, blanco);
    var filtroPorTipoDeDocumento = new FiltroDeDocumentosPorTipoDocumento(self.cfg.inputFiltroTipoDeDocumento, amarillo, blanco);
    var filtroPorCategoriaDeDocumento = new FiltroDeDocumentosPorCategoria(self.cfg.inputFiltroCategoriaDocumentoFiltro, amarillo, blanco);
    var filtroPorSoloEnAreaUsuario = new FiltroDeDocumentosSoloEnAreaUsuario(self.cfg.inputFiltroCheckDocumentosEnMiArea, self.cfg.areaDelUsuario.id.toString());
    filtroPorSoloEnAreaUsuario.setObservador(
                {
                    filtroActivado: function (filtro) {
                        self.cfg.tituloFiltroCheckDocumentosEnMiArea.css('background-color', amarillo);
                        filtroPorAreaActual.desHabilitarFiltro();
                    },
                    filtroDesactivado: function (filtro) {
                        self.cfg.tituloFiltroCheckDocumentosEnMiArea.css('background-color', blanco);
                        filtroPorAreaActual.habilitarFiltro();
                    }
                }
            );

    this.panel_filtros = new PanelDeFiltros([filtroGoogleano,
                        filtroPorExtracto,
                        filtroPorNumero,
                        filtroPorFechaDesde,
                        filtroPorFechaHasta,
                        filtroPorAreaActual,
                        filtroPorAreaOrigen,
                        filtroPorDetenidoMasDeTantosDias,
                        filtroPorTipoDeDocumento,
                        filtroPorCategoriaDeDocumento,
                        filtroPorSoloEnAreaUsuario]);

    this.panel_filtros.setObservador({
        algunFiltroActivado: function () {
            self.cfg.botonDesplegarPanelFiltros.addClass('boton_que_abre_panel_desplegable_activo_con_filtros');
        },
        ningunFiltroActivado: function () {
            self.cfg.botonDesplegarPanelFiltros.removeClass('boton_que_abre_panel_desplegable_activo_con_filtros');
        },
        cambiaronLosFiltros: function () {
        }
    });

    this.setearVisibilidadFiltroAreaActualSegunChkEnAreaDelUsuario();

    cfg.inputFiltroCheckDocumentosEnMiArea.change(function () { self.setearVisibilidadFiltroAreaActualSegunChkEnAreaDelUsuario() });

    cfg.botonDesplegarPanelFiltros.click(function () {
        self._panel_alta.contraer();
        self.alternarDespliegue();
    });

    cfg.btnAplicarFiltros.click(function () {
        self.contraer();
        self._panel_documentos.refrescarDocumentos();
    });

    cfg.btnQuitarFiltros.click(function () {
        self.contraer();
        self.panel_filtros.limpiarFiltros();
        self._panel_documentos.refrescarDocumentos();
    });

    cfg.panelBusquedaBasica.show();
    cfg.panelBusquedaAvanzada.hide();

    cfg.btnToggleBusquedaAvanzada.click(function () {
        cfg.panelBusquedaBasica.toggle();
        cfg.panelBusquedaAvanzada.toggle();
        self.panel_filtros.limpiarFiltros();
        if (cfg.panelBusquedaBasica.css('display') == 'block') cfg.btnToggleBusquedaAvanzada.val("+");
        else cfg.btnToggleBusquedaAvanzada.val("-");
    });

    cfg.inputFiltroGoogleano.keydown(function (e) {
        if (e.keyCode == 13) {
            self.cfg.btnAplicarFiltros.click();
        }
    });
}

PanelDeFiltrosDeDocumentos.prototype = {
    getFiltrosActivos: function () {
        return this.panel_filtros.filtrosActivos();
    },
    setPanelAlta: function (panel) {
        this._panel_alta = panel;
    },
    setPanelDocumentos: function (panel) {
        this._panel_documentos = panel;
    },
    alternarDespliegue: function () {
        this.cfg.divPanelFiltros.slideToggle("fast");
        this.cfg.botonDesplegarPanelFiltros.toggleClass("boton_que_abre_panel_desplegable_activo");
    },
    desplegar: function () {
        this.cfg.divPanelFiltros.slideDown("fast");
        this.cfg.botonDesplegarPanelFiltros.addClass("boton_que_abre_panel_desplegable_activo");
    },
    contraer: function () {
        this.cfg.divPanelFiltros.slideUp("fast");
        this.cfg.botonDesplegarPanelFiltros.removeClass("boton_que_abre_panel_desplegable_activo");
    },
    setearVisibilidadFiltroAreaActualSegunChkEnAreaDelUsuario : function () {
        if (this.cfg.inputFiltroCheckDocumentosEnMiArea.is(':checked')) {
            this.cfg.inputFiltroAreaActual.hide();
            this.cfg.tituloFiltroAreaActual.hide();
        } else {
            this.cfg.inputFiltroAreaActual.show();
            this.cfg.tituloFiltroAreaActual.show();
        }
    }
}