﻿var spinner;
var mes;

var Legajo = {
    init: function () {

    },
    getEstudios: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetEstudios()
            .onSuccess(function (estudiosJSON) {

                spinner.stop();

                var estudios = JSON.parse(estudiosJSON);

                var _this = this;
                $("#tabla_estudios").empty();
                var divGrilla = $("#tabla_estudios");
                //var tabla = resultado;
                var columnas = [];

                columnas.push(new Columna("Titulo", { generar: function (un_estudio) { return un_estudio.titulo } }));
                columnas.push(new Columna("Nivel", { generar: function (un_estudio) { return un_estudio.nombreDeNivel } }));
                columnas.push(new Columna("Institución", { generar: function (un_estudio) { return un_estudio.nombreUniversidad } }));
                columnas.push(new Columna("F. Egreso", { generar: function (un_estudio) {
                    var fecha_sin_hora = un_estudio.fechaEgreso.split("T");
                    var fecha = fecha_sin_hora[0].split("-");
                    return fecha[2] + "/" + fecha[1] + "/" + fecha[0];
                }
                }));

                _this.Grilla = new Grilla(columnas);
                _this.Grilla.SetOnRowClickEventHandler(function (un_estudio) { });
                _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                _this.Grilla.CargarObjetos(estudios);
                _this.Grilla.DibujarEn(divGrilla);
                $('.table-hover').removeClass("table-hover");
                //_this.BuscadorDeTablaDetalle();

                /* $.each(estudios, function (key, value) {
                var estudio = $(".cajaEstudioOculta").clone();
                estudio.find(".nivel").html(value.nombreDeNivel);
                estudio.find(".titulo").html(value.titulo);
                var fecha_sin_hora = value.fechaEgreso.split("T");
                var fecha = fecha_sin_hora[0].split("-");
                estudio.find(".fecha").html(fecha[2] + "/" + fecha[1] + "/" + fecha[0]);
                estudio.addClass("caja_estudio_posta"); // attr('style', 'margin:10px; border-bottom:1px solid;');
                estudio.removeClass("cajaEstudioOculta");

                $('#listadoEstudios').append(estudio);
                });*/

            })
            .onError(function (e) {
                spinner.stop();
            });
    },
    getDatosPersonales: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetDatosPersonales()
            .onSuccess(function (datos) {

                var data = $.parseJSON(datos);

                if (!$.isEmptyObject(data)) {

                    $('#mensaje').html("");

                    $('#legajo').html(data.Legajo);
                    $('#fechaNac').html(data.FechaNacimiento);
                    $('#edad').html(data.Edad);
                    $('#cuil').html(data.Cuil);
                    $('#sexo').html(data.Sexo);
                    $('#estadoCivil').html(data.EstadoCivil);
                    $('#dni').html(data.Documento);
                    $('#domicilio').html(data.Domicilio);
                    $('#cargo').html(data.Cargo);

                }

                spinner.stop();

            })
            .onError(function (e) {
                spinner.stop();
            });

    },
    getDatosFamiliares: function () {

        Backend.GetFamiliares()
            .onSuccess(function (familiaresJSON) {

                var familiares = JSON.parse(familiaresJSON);

                var _this = this;
                $("#tabla_familiar").empty();
                var divGrilla = $("#tabla_familiar");
                //var tabla = resultado;
                var columnas = [];

                columnas.push(new Columna("Parentesco", { generar: function (un_familiar) { return un_familiar.Parentesco } }));
                columnas.push(new Columna("Apellido", { generar: function (un_familiar) { return un_familiar.Apellido } }));
                columnas.push(new Columna("Nombre", { generar: function (un_familiar) { return un_familiar.Nombre } }));
                columnas.push(new Columna("N doc", { generar: function (un_familiar) { return un_familiar.Documento } }));
                columnas.push(new Columna("Tipo DNI", { generar: function (un_familiar) { return un_familiar.TipoDNI } }));


                _this.Grilla = new Grilla(columnas);
                _this.Grilla.SetOnRowClickEventHandler(function (un_familiar) { });
                _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                _this.Grilla.CargarObjetos(familiares);
                _this.Grilla.DibujarEn(divGrilla);
                $('.table-hover').removeClass("table-hover");


            })
            .onError(function (e) {

            });

    },
    getPsicofisicos: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetPsicofisicos()
            .onSuccess(function (psicofisicosJSON) {
                spinner.stop();

                var psicofisicos = JSON.parse(psicofisicosJSON);

                var _this = this;
                $("#tabla_psicofisicos").empty();
                var divGrilla = $("#tabla_psicofisicos");
                //var tabla = resultado;
                var columnas = [];

                columnas.push(new Columna("Folio", { generar: function (un_examen) { return un_examen.Folio } }));
                columnas.push(new Columna("Motivo", { generar: function (un_examen) { return un_examen.Motivo } }));
                columnas.push(new Columna("Resultado", { generar: function (un_examen) { return un_examen.Resultado } }));
                columnas.push(new Columna("Organismo", { generar: function (un_examen) { return un_examen.Organismo } }));


                _this.Grilla = new Grilla(columnas);
                _this.Grilla.SetOnRowClickEventHandler(function (un_examen) { });
                _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                _this.Grilla.CargarObjetos(psicofisicos);
                _this.Grilla.DibujarEn(divGrilla);
                $('.table-hover').removeClass("table-hover");


            })
            .onError(function (e) {
                spinner.stop();
            });



    },

    getDatosLicencias: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetLicenciasEnTramite()
                    .onSuccess(function (licenciasJSON) {
                        var licencias = [];
                        if (licenciasJSON != "") {
                            licencias = JSON.parse(licenciasJSON);
                        }

                        var _this = this;
                        $("#tablaLicenciasEnTramite").empty();
                        var divGrilla = $("#tablaLicenciasEnTramite");
                        var columnas = [];
                        columnas.push(new Columna("Tipo de Licencia", { generar: function (una_licencia) { return una_licencia.Descripcion } }));
                        columnas.push(new Columna("Fecha Desde", { generar: function (una_licencia) { return ConversorDeFechas.deIsoAFechaEnCriollo(una_licencia.Desde) } }));
                        columnas.push(new Columna("FEcha Hasta", { generar: function (una_licencia) { return ConversorDeFechas.deIsoAFechaEnCriollo(una_licencia.Hasta) } }));
                        columnas.push(new Columna("Estado", { generar: function (una_licencia) { return una_licencia.Estado } }));
                        _this.Grilla = new Grilla(columnas);
                        _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                        _this.Grilla.CargarObjetos(licencias);
                        _this.Grilla.DibujarEn(divGrilla);
                        $('.table-hover').removeClass("table-hover");


                    })
                    .onError(function (e) {

                    });


        Backend.GetLicenciasOrdinariasDisponibles()
                    .onSuccess(function (licenciasJSON) {
                        var licencias = [];
                        if (licenciasJSON != "") {
                            licencias = JSON.parse(licenciasJSON).Detalle;
                        }
                        var _this = this;
                        $("#tablaLicenciasOrdinariasDisponibles").empty();
                        var divGrilla = $("#tablaLicenciasOrdinariasDisponibles");
                        var columnas = [];
                        columnas.push(new Columna("Año", { generar: function (una_licencia) { return una_licencia.Periodo } }));
                        columnas.push(new Columna("Días Disponibles", { generar: function (una_licencia) { return una_licencia.Disponible } }));

                        _this.Grilla = new Grilla(columnas);
                        _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                        _this.Grilla.CargarObjetos(licencias);
                        _this.Grilla.DibujarEn(divGrilla);
                        $('.table-hover').removeClass("table-hover");

                        spinner.stop();
                    })
                    .onError(function (e) {
                        spinner.stop();
                    });

    },
    ConvertirAMonedaOVacio: function (numero) {
                    var _this = this;
                    if (numero == null) {
                        return "";
                    }
                    var _this = this;
                    if (numero == 0) return "";
                    return '$ ' + _this.ConvertirANumeroConPuntos(numero.toFixed(2).toString().replace(".", ","));

        if (numero == "0") {
            return "";
        } else {
            return "$ " + numero;
        }
    },
    ConvertirANumeroConPuntos: function (n) {

        if (n == null) {
            return "";
        }

        n = n.toString()
        while (true) {
            var n2 = n.replace(/(\d)(\d{3})($|,|\.)/g, '$1.$2$3')
            if (n == n2) break
            n = n2
        }
        return n;
    },

    getReciboDeSueldo: function (liquidacion) {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetRecibo(liquidacion)
            .onSuccess(function (reciboJSON) {
                spinner.stop();

                $("#tabla_recibo_encabezado tbody tr").remove();
                $("#tabla_recibo_encabezado").show();
                $("#bloque_final").show();

                var recibo = JSON.parse(reciboJSON);
                var detalle = "";
                var _this = this;

                $('#celdaLegajo').html(recibo.Cabecera.Legajo);
                $('#celdaNombre').html(recibo.Cabecera.Agente);
                $('#celdaCUIL').html(recibo.Cabecera.CUIL);
                $('#celdaOficina').html(recibo.Cabecera.Oficina);
                $('#celdaOrden').html(recibo.Cabecera.Orden);

                $('#bloque_final').show();
                $('#area').html(recibo.Cabecera.Area);
                $('#domicilio').html(recibo.Cabecera.Domicilio);
                $('#fechaLiquidacion').html(recibo.Cabecera.FechaLiquidacion);
                $('#categoria').html(recibo.Cabecera.NivelGrado);

                for (var i = 0; i < recibo.Detalle.length; i++) {

                    if (recibo.Detalle[i].Aporte != "0" || recibo.Detalle[i].Descuento != "0") {
                        detalle = detalle + "<tr><td>" + recibo.Detalle[i].Concepto + "</td><td class=\"columna_concepto\">"
                        + recibo.Detalle[i].Descripcion + "</td><td>" + Legajo.ConvertirAMonedaOVacio(recibo.Detalle[i].Aporte) + "</td><td colspan=\"2\">"
                        + Legajo.ConvertirAMonedaOVacio(recibo.Detalle[i].Descuento) + "</td></tr>";
                    }

                }

                detalle += "<tr style='border-bottom:none;' class='ultima_fila'><td style='border: none;'></td><td style='border: none;'></td><td class='celda_bruto_nombre'><strong>Bruto:</strong></td><td class='celda_bruto'>" + Legajo.ConvertirAMonedaOVacio(parseInt(recibo.Cabecera.Bruto)) + "</td><td class=''> " + Legajo.ConvertirAMonedaOVacio(parseInt(recibo.Cabecera.Descuentos)) + "</td></tr>";
                detalle += "<tr style='border:none;' class='ultima_fila'><td style='border: none;'></td><td style='border: none;'></td><td class='celda_neto'><strong>Neto:</strong></td><td class='celda_importe_neto' colspan='2'><strong>" + Legajo.ConvertirAMonedaOVacio(parseInt(recibo.Cabecera.Neto)) + "</strong></td></tr>";

                $("#tabla_recibo_encabezado > tbody ").append(detalle);


            })
            .onError(function (e) {
                spinner.stop();
            });
    },
    bindearBotonLiquidacion: function () {
        var _this = this;


        var btn_combo_anio = $('#cmb_anio').change(function () {
            var anio_combo = $("#cmb_anio option:selected").val();
            var day = new Date();
            mes = day.getMonth();
            var anio = day.getFullYear();

            //borro lo meses que no estan vigentes para este año
            if (anio_combo == anio) {
                $("#cmb_meses option").each(function () {
                    if (mes <= $(this).val()) {
                        $(this).attr('disabled', 'disabled');
                    }
                });
            } else {
                $("#cmb_meses option").each(function () {
                    $(this).removeAttr('disabled');
                });
            }
        });

        var btn = $('#cmb_meses').change(function () {
            $("#tabla_recibo_encabezado tbody tr").remove();
            $("#tabla_recibo_encabezado").hide();
            $("#bloque_final").hide();

            var anio = $("#cmb_anio option:selected").val();
            mes = $("#cmb_meses option:selected").val() - 1;
            var div_controles = $("#caja_controles");
            div_controles.empty();

            var spinner = new Spinner({ scale: 2 });
            spinner.spin($("html")[0]);

            Backend.GetLiquidaciones(anio, mes)
                    .onSuccess(function (liquidacionesJSON) {
                        var liquidaciones = [];
                        if (liquidacionesJSON != "") {
                            liquidaciones = JSON.parse(liquidacionesJSON);


                            for (var i = 0; i < liquidaciones.length; i++) {

                                var texto_extra;

                                if (liquidaciones[i].Descripcion.toLowerCase().indexOf("extras") >= 0) {
                                    var mes_cobrado_valor = mes + 1;
                                    var mes_cobrado_texto = $("#cmb_meses option[value=" + mes_cobrado_valor + "]").text();
                                    var mes_liquidado_valor = mes - 1;
                                    var mes_liquidado_texto = $("#cmb_meses option[value=" + mes_liquidado_valor + "]").text();

                                    texto_extra = "(cobrado a principios del mes de " + mes_cobrado_texto + ", liquidación de " + mes_liquidado_texto + ")";
                                } else {
                                    var mes_cobrado_valor = mes + 1;
                                    var mes_cobrado_texto = $("#cmb_meses option[value=" + mes_cobrado_valor + "]").text();
                                    var mes_liquidado_valor = mes;
                                    var mes_liquidado_texto = $("#cmb_meses option[value=" + mes_liquidado_valor + "]").text();

                                    texto_extra = "(cobrado a principios del mes de " + mes_cobrado_texto + ", liquidación de " + mes_liquidado_texto + ")";
                                }

                                var radio = "<input style='margin-left:10px' type='radio' name='liquidacion' value='" + liquidaciones[i].Id + "'/> " + liquidaciones[i].Descripcion + ' ' + texto_extra + "<br/>";
                                div_controles.append(radio);

                            }

                            $('input[name=liquidacion]').change(function () {
                                var liquidacion = $('input[name=liquidacion]:checked').val();
                                _this.getReciboDeSueldo(liquidacion);
                            });

                            spinner.stop();
                        }


                    })
                    .onError(function (e) {
                        spinner.stop();
                    });

        });

    },
    GetDatosDesignaciones: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetDesignacionActual()
                    .onSuccess(function (designacionJSON) {
                        designacion = JSON.parse(designacionJSON);
                        $('#txt_sector').text(designacion.Sector);
                        $('#txt_nivel_grado').text(designacion.Nivel);
                        $('#txt_planta').text(designacion.Planta);
                        $('#txt_agrupamiento').text(designacion.Agrupamiento);
                        $('#txt_ingreso').text(designacion.IngresoMinisterio);
                        $('#txt_sector').text(designacion.Sector);

                    })
                    .onError(function (e) {

                    });



        Backend.GetDesignaciones()
                    .onSuccess(function (designacionesJSON) {
                        var designaciones = [];
                        if (designacionesJSON != "") {
                            designaciones = JSON.parse(designacionesJSON);
                        }
                        var _this = this;
                        $("#tablaDesignaciones").empty();
                        var divGrilla = $("#tablaDesignaciones");
                        var columnas = [];
                        columnas.push(new Columna("Tipo Acto", { generar: function (una_designacion) { return una_designacion.TipoActo } }));
                        columnas.push(new Columna("Nro Acto", { generar: function (una_designacion) { return una_designacion.NroActo } }));
                        columnas.push(new Columna("Fecha Acto", { generar: function (una_designacion) { return ConversorDeFechas.deIsoAFechaEnCriollo(una_designacion.FechActo) } }));
                        columnas.push(new Columna("Motivo", { generar: function (una_designacion) { return una_designacion.Motivo } }));
                        columnas.push(new Columna("Situación de Revista", { generar: function (una_designacion) { return una_designacion.SituacionRevista } }));
                        columnas.push(new Columna("Folio", { generar: function (una_designacion) { return una_designacion.Folio } }));

                        _this.Grilla = new Grilla(columnas);
                        _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                        _this.Grilla.CargarObjetos(designaciones);
                        _this.Grilla.DibujarEn(divGrilla);
                        $('.table-hover').removeClass("table-hover");

                        spinner.stop();
                    })
                    .onError(function (e) {
                        spinner.stop();
                    });
    },
    getDocumentos: function () {
        var spinner = new Spinner({ scale: 2 });
        spinner.spin($("html")[0]);

        Backend.GetDocumentosDelLegajo()
            .onSuccess(function (documentosJSON) {

                spinner.stop();

                var documentos = JSON.parse(documentosJSON);

                var _this = this;
                $("#tabla_documentos").empty();
                var divGrilla = $("#tabla_documentos");
                //var tabla = resultado;
                var columnas = [];

                columnas.push(new Columna("Documento", { generar: function (un_documento) { return un_documento.Nombre } }));
                columnas.push(new Columna("Folio", { generar: function (un_documento) { return un_documento.Folio } }));


                _this.Grilla = new Grilla(columnas);
                _this.Grilla.SetOnRowClickEventHandler(function (un_documento) { });
                _this.Grilla.CambiarEstiloCabecera("estilo_tabla_portal");
                _this.Grilla.CargarObjetos(documentos);
                _this.Grilla.DibujarEn(divGrilla);
                $('.table-hover').removeClass("table-hover");


            })
            .onError(function (e) {
                spinner.stop();
            });
    },
    getNombre: function () {
        Backend.GetNombreDeLaPersona()
        .onSuccess(function (nombre) {
            $("#nombre_empleado").html(nombre);
           
        })
        .onError(function (e) {

        });
    }
}
