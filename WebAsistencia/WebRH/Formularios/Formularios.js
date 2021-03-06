﻿$(document).ready(function () {
    Backend.start(function () {
        VistaFormulario.start();
    });
});



var VistaFormulario = {
    start: function () {
        var _this = this;

        

        $('#fecha_ingreso_apn').datepicker();
        $('#fecha_ingreso_apn').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_ingreso_minis').datepicker();
        $('#fecha_ingreso_minis').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_ingreso_oficina').datepicker();
        $('#fecha_ingreso_oficina').datepicker('option', 'dateFormat', 'dd/mm/yy');

        $("#telefono_area").mask("(99) 9999-9999");
        $("#domicilio_telefono_nuevo").mask("(99) 9999-9999");


        $('#fecha_egreso_1').datepicker();
        $('#fecha_egreso_1').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_egreso_2').datepicker();
        $('#fecha_egreso_2').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_egreso_3').datepicker();
        $('#fecha_egreso_3').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_egreso_4').datepicker();
        $('#fecha_egreso_4').datepicker('option', 'dateFormat', 'dd/mm/yy');
        $('#fecha_egreso_5').datepicker();
        $('#fecha_egreso_5').datepicker('option', 'dateFormat', 'dd/mm/yy');

        var crear_vista_conocimiento = function (id) {
            var conocimiento = $("#plantillas .caja_estilo_conocimiento").clone();
            conocimiento.find(".conocimiento").attr("campo", "conocimiento_" + i);
            conocimiento.find(".utiliza_conocimiento").attr("campo", "utiliza_conocimiento_" + i);
            conocimiento.find(".icono_eliminar").click(function () {
                conocimiento.find(".conocimiento").val("");
                conocimiento.find(".conocimiento").change();
                conocimiento.find(".utiliza_conocimiento").prop("checked", false);
                conocimiento.find(".utiliza_conocimiento").change();
                conocimiento.hide();
            });
            conocimiento.hide();

            conocimiento.appendTo($("#listadoConocimientos"));
        };
        for (var i = 1; i < 21; i++) {
            crear_vista_conocimiento(i);
        }
        this.bindearBtnAgregarConocimiento();

        _this.formulario = {};

        _this.cambios = {};

        $("[rh-control-type='combo']").each(function (i, e) {
            var _this = this;
            var select = $(this);
            var opt_constructor = {
                select: select,
                dataProvider: select.attr('rh-data-provider'),
                permiteAgregar: select.attr('rh-permite-agregar') || false
            };
            var prop_label = select.attr("rh-propiedad-label");
            if (prop_label) opt_constructor.propiedadLabel = prop_label;


            var filter_key = select.attr('rh-filter-key');
            var id_filter_combo = select.attr('rh-id-filter-combo');
            if (filter_key && id_filter_combo) {
                var filter_combo = $("#" + id_filter_combo);
                opt_constructor.filtro = {};
                var valor_filtro = parseInt(filter_combo.val());
                if (isNaN(valor_filtro)) valor_filtro = -1;
                opt_constructor.filtro[filter_key] = valor_filtro;
            }

            var combo = new ComboConBusquedaYAgregado(opt_constructor);

            if (filter_key && id_filter_combo) {
                var filter_combo = $("#" + id_filter_combo);
                filter_combo.change(function () {
                    var filtro = {};
                    var valor_filtro = parseInt(filter_combo.val());
                    if (isNaN(valor_filtro)) valor_filtro = -1;
                    filtro[filter_key] = valor_filtro;
                    combo.filtrarPor(filtro);
                });
            }
        });

        _this.habilitar_registro_cambios = true;
        $("[campo]").change(function () {
            if (_this.habilitar_registro_cambios) {
                if ($(this).attr("type") == "checkbox") {
                    _this.cambios[$(this).attr("campo")] = $(this).is(":checked");
                } else {
                    _this.cambios[$(this).attr("campo")] = $(this).val();
                }
            }
        });
        $("#btn_guardar_cambios").click(function () {
            var validacion = _this.validar();
            if (!validacion.valido) {
                alertify.error(validacion.mensaje)
                return;
            }
            form_cambios = {
                idFormulario: _this.formulario.idFormulario,
                idPersona: _this.formulario.idPersona,
                campos: []
            }

            for (var campo_cambio in _this.cambios) {
                if (_this.cambios.hasOwnProperty(campo_cambio)) {
                    form_cambios.campos.push({
                        clave: campo_cambio,
                        valor: _this.cambios[campo_cambio],
                        fijo: false
                    });
                }
            }

            console.log(form_cambios);
            Backend.GuardarCambiosEnFormulario(form_cambios)
            .onSuccess(function () {
                alertify.success("Formulario guardado correctamente");
                _this.mostrarIdUltimoFormulario(form_cambios);
                _this.cambios = [];
            })
            .onError(function () {
                alertify.error("Error al guardar formulario");
            });
        });

        $("#cargar_mas_estudios").click(function () {
            var listo = false;
            $('.caja_estudios').each(function () {
                if (($(this).find(".titulo_obtenido").val() == "" && !$(this).is(":visible")) && !listo) {
                    $(this).show();
                    listo = true;
                }
            });
        });

        Backend.ElUsuarioLogueadoTienePermisosParaFuncionalidadPorNombre("formularios_administracion").onSuccess(function (tiene_funcionalidad) {
            if (tiene_funcionalidad) {
                var selector_personas = new SelectorDePersonas({
                    ui: $('#selector_usuario'),
                    repositorioDePersonas: new RepositorioDePersonas(new ProveedorAjax("../")),
                    placeholder: "nombre, apellido, documento o legajo"
                });
                selector_personas.alSeleccionarUnaPersona = function (la_persona_seleccionada) {
                    _this.mostrarPersona(la_persona_seleccionada.id);
                };
            } else {
                Backend.GetPersonaUsuarioLogueado().onSuccess(function (persona) {
                    _this.mostrarPersona(persona.Id);
                });
            }
        });

    },
    validar: function () {
        var respuesta = {
            valido: true
        };

        var ingreso_apn = $('#fecha_ingreso_apn').val();
        var ingreso_minis = $('#fecha_ingreso_minis').val();
        var ingreso_of = $('#fecha_ingreso_oficina').val();
        if (ConversorDeFechas.PrimeraFechaCriolloMayor(ingreso_apn, ingreso_minis)) {
            respuesta.valido = false;
            respuesta.mensaje = "la fecha de ingreso al ministerio debe ser posterior a la fecha de ingreso a la APN";
            return respuesta;
        }
        if (ConversorDeFechas.PrimeraFechaCriolloMayor(ingreso_minis, ingreso_of)) {
            respuesta.valido = false;
            respuesta.mensaje = "la fecha de ingreso a la oficina debe ser posterior a la fecha de ingreso al ministerio";
            return respuesta;
        }

        return respuesta;
    },
    mostrarPersona: function (id_persona) {
        var _this = this;
        $(".contenedor_formulario").hide()
        _this.limpiarPantalla();
        _this.cambios = [];
        Backend.GetFormulario(JSON.stringify({ idFormulario: 1, idPersona: id_persona })).onSuccess(function (form) {
            //            formulario = {
            //                id: 1,
            //                nombre: "Relevamiento de contrato",
            //                idPersona: 111,
            //                campos: [
            //                        { campo: "nombre", valor: "agustin" },
            //                        { campo: "apellido", valor: "calcagno" }
            //                    ]
            //            };

            _this.formulario = form;
            form.idPersona = id_persona;
            form.idFormulario = 1;
            _this.habilitar_registro_cambios = false;
            $("[campo]").each(function () {
                var campo = _.findWhere(_this.formulario.campos, { clave: $(this).attr("campo") });
                if (campo) {
                    if ($(this).attr("type") == "checkbox") {
                        $(this).prop('checked', (campo.valor.toLowerCase() === 'true'));
                    }
                    else {
                        $(this).val(campo.valor);
                        $(this).attr("valor_para_carga_async", campo.valor);
                    }
                    $(this).prop('disabled', campo.fijo);
                    $(this).change();
                }
            });
            _this.habilitar_registro_cambios = true;

            $("#listadoConocimientos .caja_estilo_conocimiento").each(function () {
                var input_conocimiento = $(this).find(".conocimiento");

                if (input_conocimiento.val() != "") {
                    $(this).show();
                }
            });

            $(".CantMaximaCaracteres").bind({
                keypress: function () {
                    var campo = $(this);
                    var numero = String.fromCharCode(event.keyCode);
                    if (0 < numero && numero <= 5) {
                        if (campo.length = 1) campo.val("");
                    } else {
                        return false;
                    }
                    _this.VerificarMaximoDeAsignaciones();
                },
                blur: function () {
                    _this.VerificarMaximoDeAsignaciones();
                },
                keyup: function () {
                    _this.VerificarMaximoDeAsignaciones();
                },
                click: function () {
                    _this.VerificarMaximoDeAsignaciones();
                },
                change: function () {
                    _this.VerificarMaximoDeAsignaciones();
                }
            });



            $(".contenedor_formulario").show()

            _this.dibujarEstudios();
            _this.ocultarTareas();
            _this.bidearEventosImprimir(form);
            _this.mostrarIdUltimoFormulario(form);

            var dni = $('#txt_documento').val();
            var nombre = $("#nombre").html() + ', ' + $("#apellido").html();
            $(".documento_cabecera").html(dni);
            $(".nombre_encabezado").html(nombre);
            $(".p_encabezado").attr('style', 'color:#F5F5F5;')

        });
    },
    VerificarMaximoDeAsignaciones: function () {
        _this = this;
        var clases = [$(".TareasGenerales"),
                      $(".TareasAdministrativas"),
                      $(".TareasTecnicas"),
                      $(".AsistenciaTecnica"),
                      $(".ServiciosProfesionales"),
                      $(".ProfesionalesAvanzados")]

        for (var i = 0; i < clases.length; i++) {
            _this.MaximoDeAsignaciones(clases[i]);
        }
    },

    MaximoDeAsignaciones: function (clase) {
        var contador = _this.ContarCantidadDeItemsCalificados(clase);
        _this.LimitarLaCantidadDeCalificacionesPorClase(clase, contador);
    },

    LimitarLaCantidadDeCalificacionesPorClase: function (clase, contador) {
        if (contador >= 5) {
            clase.each(function () {
                var campo = $(this);
                if (campo.val() == "") {
                    campo.val("");
                    campo.prop('disabled', true);
                }
            });
        } else {
            clase.each(function () {
                var campo = $(this);
                campo.prop('disabled', false);
            });
        }
    },

    ContarCantidadDeItemsCalificados: function (clase) {
        var contador = 0;
        clase.each(function () {
            var campo = $(this);
            if (campo.val() != "") {
                contador = contador + 1;
            }
        });
        return contador;
    },

    limpiarPantalla: function () {
        this.habilitar_registro_cambios = false;
        $("[campo]").each(function () {
            if ($(this).attr("type") == "checkbox") {
                $(this).prop("checked", false);
            }
            else $(this).val("");
            $(this).prop("disabled", false);
            $(this).change();
        });
        $("#listadoConocimientos .caja_estilo_conocimiento").hide();
        this.habilitar_registro_cambios = true;
    },
    dibujarEstudios: function () {
        var ocultos = 0;
        $('.caja_estudios').each(function () {
            if ($(this).find(".titulo_obtenido").val() == "") {
                $(this).hide();
                ocultos++;
            } else {
                //$(this).find(".bloque_estudios :input").prop("disabled", true);
            }


        });
        if (ocultos == 5) {
            $("#caja_estudio_1").show();
        }
        //        var div_estudios_extras = $(".caja_extra");
        //        div_estudios_extras.each(function () {
        //            if (this.children[0].children[1].value == "") {
        //                this.className = this.className + " ocultarEstudio";
        //            }
        //        })

        //        $('.input_estudio_extra').change(function () {
        //            var caja = this.parentNode.parentNode;
        //            if (this.value != "") {
        //                caja.className = caja.className.replace(/(?:^|\s)ocultarEstudio(?!\S)/g, '');
        //            } else {
        //                caja.className = caja.className + ' ocultarEstudio';
        //            }
        //        })

        //        $('.hidden').removeClass('hidden').hide();
        //        $("#cargar_mas_estudios").click(function () {
        //            $('.ocultarEstudio').toggleClass("mostrarEstudio");
        //            $(this).find('span').each(function () { $(this).toggle(); });
        //            return;
        //        })
    },
    ocultarTareas: function () {
        var _this = this;
        $('#contenedor_tarea_generales').show();
        $('#contenedor_tarea_administrativa').show();
        $('#contendor_tarea_tecnica').show();
        $('#contenedor_asistencia_tecnica').show();
        $('#contenedor_servicios_profesionales').show();
        $('#contenedor_tareas_adicionales').show();

        var esA = false;
        var esB = false;
        var esC = false;
        var esD = false;
        var esE = false;
        var esF = false;
        var esProfesional = false;
        var esTecnico = false;
        var esAdministrativo = false;


        var separador1 = "(";
        var separador2 = "-";
        var cadena = $('#funcion').val();
        var arregloDeSubCadenas = cadena.split(separador1);
        if (arregloDeSubCadenas.length > 1) {
            //me fijo que letra es en el primer caracter del segundo item
            switch (arregloDeSubCadenas[1].charAt(0)) {
                case 'A':
                    console.log('A');
                    esA = true;

                    break;
                case 'B':
                    esB = true;
                    console.log('B');
                    break;
                case 'C':
                    esC = true;
                    console.log('C');
                    break;
                case 'D':
                    esD = true;
                    console.log('D');
                    break;
                case 'E':
                    esE = true;
                    console.log('E');
                    break;
                case 'F':
                    esF = true;
                    console.log('F');
                    break;
                default:
                    console.log('Sin Letra');
                    break;
            } //end switch
            //divido el segundo item por el -, para detectar si es profesional o tec
            var arregloDeSubSubCadenas = arregloDeSubCadenas[1].split(separador2);
            if (arregloDeSubSubCadenas.length > 1) {
                //si es profesional o tecnico o administrativo
                switch (arregloDeSubSubCadenas[1].charAt(0)) {
                    case 'u':
                        esProfesional = true;
                        console.log('u');
                        break;
                    case 't':
                        esTecnico = true;
                        console.log('t');
                        break;
                    default:
                        esAdministrativo = true;
                        console.log('Administrativo');
                        break;
                } //end switch
            } else {
                esAdministrativo = true;
            } //end if

            if (!(esF || esE || (esD && esAdministrativo))) {
                $('#contenedor_tarea_generales').hide();
            }
            if (!((esC && esAdministrativo) || (esD && esAdministrativo) || esE || esF)) {
                $('#contenedor_tarea_administrativa').hide();
            }
            if (!((esC && esAdministrativo) || (esD && esAdministrativo))) {
                $('#contendor_tarea_tecnica').hide();
            }
            if (!((esB && esAdministrativo) || (esB && esTecnico) || (esC && esTecnico) || (esD && esTecnico))) {
                $('#contenedor_asistencia_tecnica').hide();
            }
            if (!((esB && esProfesional) || (esC && esProfesional) || (esD && esProfesional))) {
                $('#contenedor_servicios_profesionales').hide();
            }
            if (!(esA || (esB && esProfesional) || (esC && esProfesional))) {
                $('#contenedor_tareas_adicionales').hide();
            }

        } // end if
    },
    bindearBtnAgregarConocimiento: function () {
        var btn = $('#btn_Agregar_Conocimientos');

        btn.click(function () {
            var herramienta = $('#cboHerramientas').find('option:selected').text();
            var conocimiento = $('#cboConocimiento').find('option:selected').text();
            var nivel = $('#cboNivelCompetencia').find('option:selected').text();
            var utiliza = $('#utiliza_conocimiento').prop("checked");

            var texto = herramienta + ' - ' + conocimiento + ' - ' + nivel;

            var listo = false;
            $("#listadoConocimientos .caja_estilo_conocimiento").each(function () {
                if (!listo) {
                    var input_conocimiento = $(this).find(".conocimiento");
                    var chk_utiliza = $(this).find(".utiliza_conocimiento");

                    if (input_conocimiento.val() == "") {
                        input_conocimiento.val(texto);
                        input_conocimiento.change();
                        chk_utiliza.prop("checked", utiliza);
                        chk_utiliza.change();
                        $(this).show();
                        listo = true;
                    }
                }
            });
        })
    },
    bidearEventosImprimir: function (form) {
        (function () {
            var beforePrint = function () {
                //console.log('Functionality to run before printing.');
                $('.bloque_de_tareas :input').each(function () {
                    var _this = $(this);
                    if (_this.val() == "") {
                        _this.parent().hide();

                        //_this.parent().addClass("no_imprimir")         
                    } else {
                        _this.parent().show();
                        _this.prev().hide();
                        //_this.parent().removeClass("no_imprimir");
                    }

                })

            };
            var afterPrint = function () {
                console.log('Functionality to run after printing');
                Backend.GuardarCabeceraFormulario(form)
                    .onSuccess(function () {
                        //alertify.success("Formulario versionado correctamente");
                        $('.bloque_de_tareas :input').each(function () {
                            $(this).parent().show();
                            $(this).prev().show();
                        })
                    })
                    .onError(function () {
                        alertify.error("Error al versionar el formulario");
                    });
            };

            if (window.matchMedia) {
                var mediaQueryList = window.matchMedia('print');
                mediaQueryList.addListener(function (mql) {
                    if (mql.matches) {
                        beforePrint();
                    } else {
                        afterPrint();
                    }
                });
            }

            window.onbeforeprint = beforePrint;
            window.onafterprint = afterPrint;
        } ());
    },
    mostrarIdUltimoFormulario: function (form) {
        Backend.GetIdCabeceraFormulario(form)
                    .onSuccess(function (id) {
                        $("#CodigoBarra").barcode("FRH0313," + id, "code128", {
                            showHRI: true,
                            height: 30,
                            width: 100
                        });
                    })
                    .onError(function () {
                        alertify.error("Error al obtener el ID del formulario");
                    });
    }

}




    
