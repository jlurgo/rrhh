﻿var VistaDeArea = function (opt) {
    this.o = opt;
    this.start();
};

VistaDeArea.prototype.start = function () {
    this.ui = $("#plantilla_vista_area").clone();
    this.ui.find("#nombre_area").text(this.o.area.nombre());
    this.ui.find("#responsable").text(this.o.area.responsable());
    this.ui.find("#direccion").text(this.o.area.direccion());
    this.ui.find("#telefono").text(this.o.area.telefonos());
    this.ui.find("#fax").text(this.o.area.faxes());
    this.ui.find("#mail").text(this.o.area.mails());
    var div_asistentes = this.ui.find("#asistentes");
    for (var i = 0; i < this.o.area.asistentes().length; i++) {
        new VistaDeAsistente({ asistente: this.o.area.asistentes()[i] }).dibujarEn(div_asistentes);
    }
    var _this = this;
    this.ui.dialog({
        title: _this.o.area.nombre(),
        height: 300,
        width: 1020,
        modal: true,
        show: {
            effect: "puff",
            duration: 300,
            direction: 'left'
        },
        hide: {
            effect: "puff",
            duration: 300,
            direction: 'right'
        },
        dialogClass: "dialog_vista_area"
    });
};