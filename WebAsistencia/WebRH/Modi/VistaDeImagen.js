﻿var VistaDeImagen = function (opt) {
    this.o = opt;
    this.start();
};

VistaDeImagen.prototype.start = function () {
    this.id = this.o.idImagen;
    this.ui = $("#plantilla_ui_imagen").clone();
    this.img_thumbnail = this.ui.find('#img_thumbnail');
    this.img_estatica = this.ui.find('#img_estatica');
    this.folioLegajo = this.o.numeroDeFolio || "";
    this.orden = this.o.orden;

    var _this = this;
    this.ui.click(function () {
        if (!_this.onDrag) {
            new VisualizadorDeImagenes({
                imagen: _this,
                servicioDeLegajos: _this.o.servicioDeLegajos,
                alGuardar: function (valores) {
                    if (valores.folioLegajo == "") {
                        _this.o.servicioDeLegajos.desAsignarImagen(
                            _this.id,
                            function () {
                                _this.folioLegajo = valores.folioLegajo;
                                _this.orden = "";
                                _this.dibujarEn($("#panel_imagenes_no_asignadas .panel_de_imagenes"));
                            });
                    }
                    else {
                        var div_folio = $("#folio_" + valores.folioLegajo);
                        if (div_folio.length == 0) {
                            new Alerta("El folio ingresado no existe");
                            return;
                        }
                        //                        if (div_folio.find(".imagen_miniatura").length != 0) {
                        //                            new Alerta("Ya hay una imagen asignada al folio ingresado");
                        //                            return;
                        //                        }
                        if (valores.pagina) {
                            _this.o.servicioDeLegajos.asignarImagenAFolioDeLegajoPasandoPagina(
                                _this.id,
                                valores.folioLegajo,
                                valores.pagina,
                                function () {
                                    _this.folioLegajo = valores.folioLegajo;
                                    _this.orden = valores.pagina;
                                    _this.dibujarEn(div_folio);
                                }
                            );
                        } else {
                            _this.o.servicioDeLegajos.asignarImagenAFolioDeLegajo(
                                _this.id,
                                valores.folioLegajo,
                                function (orden) {
                                    _this.folioLegajo = valores.folioLegajo;
                                    _this.orden = orden;
                                    _this.dibujarEn(div_folio);
                                }
                            );
                        }
                    }
                }
            });
        }
    });

    this.ui.draggable({ revert: "invalid",
        distance: 20,
        start: function (ui) {
            console.log("empezó a dragear: ", _this);
            _this.o.servicioDeDragAndDrop.imagenOnDrag = _this;
        },
        helper: "clone",
        scroll: false
    });

    this.img_thumbnail.show();
    this.img_estatica.hide();
//    this.img_estatica.show();
//    this.o.servicioDeLegajos.getThumbnailPorId(
//        this.id,
//        90,
//        90,
//        function (imagen) {
//            _this.img_thumbnail.show();
//            _this.img_estatica.hide();
//            _this.img_thumbnail.attr("src", "data:image/png;base64," + imagen.bytesImagen)
//        });
};

VistaDeImagen.prototype.dibujarEn = function (panel) {
    panel.append(this.ui);
};

VistaDeImagen.prototype.borrar = function () {
    this.ui.remove();
};