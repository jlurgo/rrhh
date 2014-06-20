﻿var AntecedentesAcademicos = {
    mostrar: function (evento, alModificar) {
        var _this = this;
        this.ui = $("#un_div_modal");
        this.ui.find("#contenido_modal").load("AntecedentesAcademicos.htm", function () {
            _this.txt_evento_denominacion = _this.ui.find("#txt_evento_denominacion");
            _this.txt_evento_denominacion.val(evento.Denominacion);

            _this.txt_evento_academico_tipo_evento = _this.ui.find("#evento_academico_tipo_evento");
            _this.txt_evento_academico_tipo_evento.val(evento.EventoTipo);

            _this.txt_evento_academico_caracter_participacion = _this.ui.find("#txt_evento_academico_caracter_participacion");
            _this.txt_evento_academico_caracter_participacion.val(evento.Especialidad);

            _this.txt_evento_academico_fecha_inicio = _this.ui.find("#txt_evento_academico_fecha_inicio");
            _this.txt_evento_academico_fecha_inicio.val(evento.FechaIngreso);

            _this.txt_evento_academico_fecha_fin = _this.ui.find("#txt_evento_academico_fecha_fin");
            _this.txt_evento_academico_fecha_fin.val(evento.FechaEgreso);

            _this.txt_evento_academico_duracion = _this.ui.find("#txt_evento_academico_duracion");
            _this.txt_evento_academico_duracion.val(evento.Duracion);

            _this.txt_evento_academico_institucion = _this.ui.find("#txt_evento_academico_institucion");
            _this.txt_evento_academico_institucion.val(evento.Localidad);

            _this.txt_evento_academico_localidad = _this.ui.find("#txt_evento_academico_localidad");
            _this.txt_evento_academico_localidad.val(evento.Pais);

            _this.cmb_evento_academico_pais = _this.ui.find("#cmb_evento_academico_pais");
            _this.cmb_evento_academico_pais.val(evento.Pais);

            //Bt agregar
            _this.add_antecedentesAcademicos = _this.ui.find("#add_evento_academico");
            _this.add_antecedentesAcademicos.click(function () {
                var evento_nuevo = {};
                //var estudio_modificado = $.extend(true, estudio_original);
                evento_nuevo.Titulo = _this.txt_antecedentes_titulo.val();
                evento_nuevo.Establecimiento = _this.txt_establecimiento.val();
                evento_nuevo.Especialidad = _this.txt_antecedentes_especialidad.val();
                evento_nuevo.FechaIngreso = _this.txt_antecedentes_ingreso.val();
                evento_nuevo.FechaEgreso = _this.txt_antecedentes_egreso.val();
                evento_nuevo.Localidad = _this.txt_antecedentes_localidad.val();
                evento_nuevo.Pais = _this.cmb_antecedentes_pais.val();

                var data_post = JSON.stringify({
                    "evento_nuevos": estudio_nuevo,
                    "evento_originales": estudio_original
                });
                $.ajax({
                    url: "../AjaxWS.asmx/GuardarCVEventosAcademicos",
                    type: "POST",
                    data: data_post,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (respuestaJson) {
                        var respuesta = JSON.parse(respuestaJson.d);
                        alModificar(respuesta);
                        $(".modal_close_concursar").click();
                        alertify.success("Los datos fueron guardados correctamente");
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alertify.alert(errorThrown);
                    }
                });
            });

            //Activar datePicker para el modal de AntecedentesAcademicos
            $('#txt_evento_academico_fecha_inicio').datepicker({
                dateFormat: 'dd/mm/yy',
                onClose: function () {

                }
            });
            $('#txt_evento_academico_fecha_fin').datepicker({
                dateFormat: 'dd/mm/yy',
                onClose: function () {

                }
            });

            var link_trucho = $("<a href='#un_div_modal'></a>");
            link_trucho.leanModal({ top: 300, closeButton: ".modal_close_concursar" });
            link_trucho.click();


        });
    },
    armarGrilla: function (estudios) {
        var _this = this;

        //var estudios = JSON.parse(estudios);

        contenedorPlanilla = $('#tabla_antecedentes');

        var columnas = [];

        columnas.push(new Columna("Id", { generar: function (un_estudio) { return un_estudio.Id } }));
        columnas.push(new Columna("Titulo", { generar: function (un_estudio) { return un_estudio.Titulo } }));
        columnas.push(new Columna("Establecimiento", { generar: function (un_estudio) { return un_estudio.Establecimiento } }));
        columnas.push(new Columna("Especialidad", { generar: function (un_estudio) { return un_estudio.Especialidad } }));
        columnas.push(new Columna("FechaIngreso", { generar: function (un_estudio) { return un_estudio.FechaIngreso } }));
        columnas.push(new Columna("FechaEgreso", { generar: function (un_estudio) { return un_estudio.FechaEgreso } }));
        columnas.push(new Columna("Localidad", { generar: function (un_estudio) { return un_estudio.Localidad } }));
        columnas.push(new Columna("Pais", { generar: function (un_estudio) { return un_estudio.Pais } }));
        columnas.push(new Columna('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Acciones&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', { generar: function (un_estudio) {
            var contenedorBtnAcciones = $('<div>');
            var botonEditar = $('<img>');
            botonEditar.addClass('edit-item-btn');
            botonEditar.attr('src', '../Imagenes/edit.png');
            botonEditar.attr('style', 'padding-right:5px;');
            botonEditar.attr('width', '25px');
            botonEditar.attr('height', '25px');

            botonEditar.click(function () {
                AntecedentesAcademicos.mostrar(un_estudio, function (estudios_actualizados) {
                    PlanillaCvEstudios.BorrarContenido();
                    PlanillaCvEstudios.CargarObjetos(estudios_actualizados);
                });
            });

            contenedorBtnAcciones.append(botonEditar);

            var botonEliminar = $('<img>');
            botonEliminar.addClass('remove-item-btn');
            botonEliminar.attr('src', '../Imagenes/iconos_eliminar.png');
            botonEliminar.attr('width', '25px');
            botonEliminar.attr('height', '25px');

            botonEliminar.click(function () {
                AntecedentesAcademicos.eliminar(un_estudio, function (estudio_eliminado) {
                    PlanillaCvEstudios.QuitarObjeto(contenedorPlanilla, estudio_eliminado);
                });
            });

            contenedorBtnAcciones.append(botonEliminar);

            return contenedorBtnAcciones;
        }
        }));


        PlanillaCvEstudios = new Grilla(columnas);
        PlanillaCvEstudios.AgregarEstilo("table table-striped");
        PlanillaCvEstudios.SetOnRowClickEventHandler(function (un_estudio) {
            // panelAlumno.CompletarDatosAlumno(un_alumno);
        });

        PlanillaCvEstudios.CargarObjetos(estudios);
        PlanillaCvEstudios.DibujarEn(contenedorPlanilla);

    },
    eliminar: function (estudio_a_eliminar, alModificar) {
        // confirm dialog
        alertify.confirm("Está seguro que desea eliminar el antecedente", function (e) {
            if (e) {
                // user clicked "ok"
                var data_post = JSON.stringify({
                    "antecedentesAcademicos_borrar": estudio_a_eliminar
                });
                $.ajax({
                    url: "../AjaxWS.asmx/EliminarCVAntecedentesAcademicos",
                    type: "POST",
                    data: data_post,
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (respuestaJson) {
                        var respuesta = JSON.parse(respuestaJson.d);
                        alertify.success("Antecedente Academico eliminado correctamente");
                        //alertify.alert("Los datos fueron guardados correctamente");
                        alModificar(respuesta);
                        //$(".modal_close_concursar").click();
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alertify.alert(errorThrown);
                        alertify.error("No se pudo eliminar el antecedente");
                    }
                });
            } else {
                // user clicked "cancel"
                
            }
        });



    }
}