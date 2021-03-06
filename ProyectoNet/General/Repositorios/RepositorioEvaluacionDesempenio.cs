﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Newtonsoft.Json;
using General.MAU;
using System.Reflection;
using General.MED;

namespace General.Repositorios
{
    public class RepositorioEvaluacionDesempenio
    {
        private static RepositorioEvaluacionDesempenio _instancia;

        IConexionBD _conexion;
        private RepositorioEvaluacionDesempenio(IConexionBD conexion)
        {
            _conexion = conexion;
        }

        public static void Reset()
        {
            _instancia = null;
        }

        public static RepositorioEvaluacionDesempenio NuevoRepositorioEvaluacion(IConexionBD conexion)
        {
            if (!(_instancia != null)) _instancia = new RepositorioEvaluacionDesempenio(conexion);
            return _instancia;
        }

        public AprobacionPorComite InsertarAprobacionEvaluacion(int id_evaluacion, int id_comite, int id_usuario, DateTime fecha)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", id_evaluacion);
            parametros.Add("@id_comite", id_comite);
            parametros.Add("@id_usuario", id_comite);
            parametros.Add("@fecha", fecha);

            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_INS_AprobacionComite", parametros);

            var row = tablaDatos.Rows[0];
            var result = new AprobacionPorComite(row.GetDateTime("fecha"), row.GetSmallintAsInt("id"), row.GetSmallintAsInt("id_comite"), row.GetSmallintAsInt("id_evaluacion"), row.GetSmallintAsInt("id_usuario"));

            return result;

        }

        public List<DetallePreguntas> getFormularioDeEvaluacion(int nivel, int evaluado, int evaluacion)
        {
            var parametros = new Dictionary<string, object>();
            var list_de_pregYRtas = new List<FormEvaluacion> { };
            var list_de_pregYRtasRespondidas = new List<DetallePreguntas> { };
            var tablaDatos = new TablaDeDatos();

            if (evaluacion != 0)
            {
                parametros.Add("@id_evaluacion", evaluacion);
            }

            parametros.Add("@id_nivel", nivel);
            tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_Evaluacion", parametros);
            FormularioFromTabla(list_de_pregYRtasRespondidas, tablaDatos);

            return list_de_pregYRtasRespondidas;
        }

        protected void FormularioFromTabla(List<DetallePreguntas> list_de_pregYRtasRespondidas, TablaDeDatos tablaDatos)
        {
            tablaDatos.Rows.ForEach(row =>
            {
                AddDetallePreguntasA(list_de_pregYRtasRespondidas, row, true);
            });
        }

        public string GetNivelesFormulario(string id_nivel)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_nivel", int.Parse(id_nivel));
            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_CATEGORIAS_NIVEL", parametros);
            object respuesta;

            respuesta = new
            {
                id_nivel = tablaDatos.Rows[0].GetSmallintAsInt("id_nivel"),
                deficiente = tablaDatos.Rows[0].GetSmallintAsInt("deficiente"),
                regular = tablaDatos.Rows[0].GetSmallintAsInt("regular"),
                bueno = tablaDatos.Rows[0].GetSmallintAsInt("bueno"),
                destacado = tablaDatos.Rows[0].GetSmallintAsInt("destacado"),
                descripcion_nivel = tablaDatos.Rows[0].GetString("descripcion")
            };
            return JsonConvert.SerializeObject(respuesta);
        }

        public DescripcionAreaEvaluacion GetDescripcionAreaEvaluacion(int idArea, Dictionary<int, DescripcionAreaEvaluacion> cache, string codigo)
        {
            if (!cache.ContainsKey(idArea))
            {
                var parametros = new Dictionary<string, object>();
                parametros.Add("@idArea", idArea);
                var tablaDatos = _conexion.Ejecutar("[dbo].[EVAL_GET_DATA_ESTR_pc_dotaciones_con_bajas]", parametros);

                tablaDatos.Rows.ForEach(row =>
                {
                    if (!cache.ContainsKey(idArea))
                    {
                        cache.Add(idArea, new DescripcionAreaEvaluacion(row.GetString("Organismo", ""), row.GetString("Secretaria", ""), row.GetString("Subsecretaria", ""), row.GetString("DireccionNacional", ""), row.GetString("Area_Coordinacion", ""), row.GetString("Nombre_Area", ""), codigo));
                    }
                }
                );
            }

            return cache[idArea];
        }

        public bool EsAgenteVerificador(Usuario usuario)
        {
            var parametros = new Dictionary<string, object>();
            var id_persona_evaluadora = usuario.Owner.Id;
            parametros.Add("@id_persona", id_persona_evaluadora);

            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_Verificador_Evaluacion", parametros);

            return tablaDatos.Rows.Count > 0;
        }


        public RespuestaGetAgentesEvaluablesPor GetAgentesEvaluablesParaImprimir(Usuario usuario)
        {
            return GetAgentesEvaluablesPor(0, usuario, false, true, true);
        }

        public RespuestaGetAgentesEvaluablesPor GetAgentesEvaluablesPor(Usuario usuario)
        {
            return GetAgentesEvaluablesPor(0, usuario, false, false, true);
        }

        public RespuestaGetAgentesEvaluablesPor GetAgentesEvaluablesParaVerificarGDE(Usuario usuario)
        {
            return GetAgentesEvaluablesPor(0, usuario, true, false, true);
        }

        public RespuestaGetAgentesEvaluablesPor GetAsignacionEvaluacionCompleta(int id_evaluacion, Usuario usuario)
        {
            var res = GetAgentesEvaluablesPor(id_evaluacion, usuario, true, true, true);
            return res;
        }

        public RespuestaGetAgentesEvaluablesParaComites GetAgentesEvaluablesParaComites(Usuario usuario)
        {
            var res = GetAgentesEvaluablesPor(0, usuario, true, true, false);
            return new RespuestaGetAgentesEvaluablesParaComites(res.asignaciones, res.EsAgenteVerificador, res.UsuarioRequest);
        }

        public List<PeriodoEvaluacion> GetPeriodosEvaluacion()
        {
            var parametros = new Dictionary<string, object>();
            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_PERIODOS_EVALUACION", parametros);
            var result = new List<PeriodoEvaluacion>();
            tablaDatos.Rows.ForEach(row =>
                {
                    result.Add(new PeriodoEvaluacion(row.GetSmallintAsInt("id"), row.GetString("descripcion"), row.GetDateTime("desde"), row.GetDateTime("hasta"), row.GetString("Descr_Tipo_Periodo", "No Especifica")));
                });
            return result;
        }

        /*public ComiteEvaluacionDesempenio GuardarComiteEvaluacionDesempenio(ComiteEvaluacionDesempenio comite)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idPeriodo", comite.Periodo.id_periodo);
            parametros.Add("@fecha", comite.Fecha);
            parametros.Add("@lugar", comite.Lugar);

            comite.Id = (int)_conexion.EjecutarEscalar("dbo.EVAL_INS_Comite", parametros);

            comite.Integrantes.ForEach(i => AgregarIntegranteComite(comite.Id, i));
            comite.UnidadesEvaluacion.ForEach(i => AgregarUnidadEvaluacionComite(comite.Id, i.Id));

            return comite;
        }*/

        public void AgregarUnidadEvaluacionComite(int idComite, int idUnidadEvaluacion)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", idComite);
            parametros.Add("@idUnidadEvaluacion", idUnidadEvaluacion);
            _conexion.EjecutarEscalar("dbo.EVAL_INS_UnidadEvaluacionComite", parametros);
        }

        public void RemoverUnidadEvaluacionAComite(int idComite, int idUnidadEvaluacion)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", idComite);
            parametros.Add("@idUnidadEvaluacion", idUnidadEvaluacion);
            _conexion.EjecutarEscalar("dbo.EVAL_DEL_UnidadEvaluacionComite", parametros);
        }

        public void AgregarIntegranteComite(int idComite, IntegranteComiteEvalDesempenio integrante)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", idComite);
            parametros.Add("@idPersona", integrante.IdPersona);
            parametros.Add("@idEnCaracterDe", integrante.IdEnCaracterDe);
            _conexion.EjecutarEscalar("dbo.EVAL_INS_IntegranteComite", parametros);
        }

        public void RemoverIntegranteComite(int idComite, int idPersonaIntegrante)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", idComite);
            parametros.Add("@idPersona", idPersonaIntegrante);
            _conexion.EjecutarEscalar("dbo.EVAL_DEL_IntegranteComite", parametros);
        }

        public ComiteEvaluacionDesempenio GetComiteById(int idComite)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", idComite);
            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_Comite", parametros);


            var resultado = new List<ComiteEvaluacionDesempenio>();
            if (tablaDatos.Rows.Count > 0)
            {
                tablaDatos.Rows.ForEach(row =>
                {
                    this.CrearOCompletarComite(row, resultado);
                });
            }
            return resultado[0];
        }

        public List<ComiteEvaluacionDesempenio> GetAllComites()
        {
            var parametros = new Dictionary<string, object>();
            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_Comites", parametros);

            var resultado = new List<ComiteEvaluacionDesempenio>();
            if (tablaDatos.Rows.Count > 0)
            {
                tablaDatos.Rows.ForEach(row =>
                {
                    this.CrearOCompletarComite(row, resultado);
                });
            }
            return resultado;
        }

        protected void CrearOCompletarComite(RowDeDatos row, List<ComiteEvaluacionDesempenio> resultado)
        {
            if (!resultado.Any(c => c.Id == row.GetInt("id_comite")))
            {
                resultado.Add(ConstruirCabeceraComite(row));
            }
            else
            {
                var new_comite = resultado.Find(c => c.Id == row.GetInt("id_comite"));
                //resultado.Add(new_comite);
            }
            var comite = resultado.Find(c => c.Id == row.GetInt("id_comite"));
            ConstruirIntegranteComite(comite, row);
            //ConstruirUnidadEvaluacionComite(comite, row);
        }

        private void ConstruirUnidadEvaluacionComite(ComiteEvaluacionDesempenio comite, RowDeDatos row)
        {
            if (!comite.UnidadesEvaluacion.Any(u => u.Id == row.GetInt("id_ue")))
            {
                var ue = new UnidadDeEvaluacion(row.GetInt("id_ue", 0), row.GetString("codigo_ue", "No Especifica"), row.GetString("nombre_area", "No Especifica"), row.GetSmallintAsInt("idPeriodo"));
                comite.UnidadesEvaluacion.Add(ue);
            }
        }

        private void ConstruirIntegranteComite(ComiteEvaluacionDesempenio comite, RowDeDatos row)
        {
            if (row.GetSmallintAsInt("id_persona_integrante", 0) == 0) { return; }
            if (!comite.Integrantes.Any(i => i.IdPersona == row.GetInt("id_persona_integrante")))
            {
                var integrante = new IntegranteComiteEvalDesempenio();
                integrante.IdPersona = row.GetInt("id_persona_integrante");
                integrante.Apellido = row.GetString("apellido_integrante");
                integrante.Nombre = row.GetString("nombre_integrante");
                integrante.Dni = row.GetInt("documento_integrante");
                integrante.IdEnCaracterDe = row.GetSmallintAsInt("idEnCaracterDe");
                comite.Integrantes.Add(integrante);
            }
        }

        private ComiteEvaluacionDesempenio ConstruirCabeceraComite(RowDeDatos row)
        {
            var comite = new ComiteEvaluacionDesempenio();
            comite.Id = row.GetInt("id_comite");
            comite.Fecha = row.GetDateTime("fecha_comite");
            comite.Lugar = row.GetString("lugar_comite");
            comite.Hora = row.GetString("hora_comite");
            comite.Descripcion = row.GetString("descripcion_comite");
            comite.Integrantes = new List<IntegranteComiteEvalDesempenio>();
            comite.UnidadesEvaluacion = new List<UnidadDeEvaluacion>();
            comite.Periodo = GetPeriodosEvaluacion().Find(p => p.id_periodo.Equals(row.GetInt("idPeriodo")));

            AgregarUnidadesEvaluacion(comite);

            return comite;
        }

        protected void AgregarUnidadesEvaluacion(ComiteEvaluacionDesempenio comite)
        {
            if (comite.UnidadesEvaluacion.Count > 0) return;
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idComite", comite.Id);
            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_UES_Comite", parametros);
            var resultado = new List<ComiteEvaluacionDesempenio>();
            if (tablaDatos.Rows.Count > 0)
            {
                tablaDatos.Rows.ForEach(row =>
                {
                    ConstruirUnidadEvaluacionComite(comite, row);
                });
            }

        }



        /// <summary>
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="ModoVerificadorGDE">Existe un perfil de usuario que se encarga de verificar que los codigos de GDE esten bien cargados, para ese usuario, este param va en true</param>
        /// <param name="ModoComitesEvaluacion">Cuando el usuario es de un comite de evaluacion, puede ver todas las evaluaciones, con/sin codigo gde. Y de todas las personas (sin importar el evaluador)</param>
        /// <param name="IncludeTextosPreguntas">Para evitar transferir por el webservice responses demasiado grande, se quitan las respuestas de las evaluaciones</param>
        /// <returns></returns>
        protected RespuestaGetAgentesEvaluablesPor GetAgentesEvaluablesPor(int id_evaluacion, Usuario usuario, bool ModoVerificadorGDE, bool ModoComitesEvaluacion, bool IncludeTextosPreguntas)
        {
            var parametros = new Dictionary<string, object>();
            var id_persona_usuario = usuario.Owner.Id;
            var es_agente_verificador = true;
            if (!ModoComitesEvaluacion)
            {
                if (!EsAgenteVerificador(usuario) || !ModoVerificadorGDE)
                {
                    parametros.Add("@id_persona_evaluadora", id_persona_usuario);
                    es_agente_verificador = false;
                }
                else
                {
                    parametros.Add("@solo_con_codigo_gde", 1);
                }
            }

            if (id_evaluacion > 0)
            {
                parametros.Add("@id_evaluacion", id_evaluacion);
            }


            var sp = IncludeTextosPreguntas ? "dbo.EVAL_GET_Evaluados_Evaluador" : "dbo.EVAL_GET_Evaluados_Evaluador_Slim";
            //var sp = "dbo.EVAL_GET_Evaluados_Evaluador";
            var tablaDatos = _conexion.Ejecutar(sp, parametros);

            var asignaciones = new List<AsignacionEvaluadoAEvaluador> { };
            var detalle_preguntas = new List<DetallePreguntas> { };
            var cache_areas = new Dictionary<int, DescripcionAreaEvaluacion>();
            var cache_evaluadores = new Dictionary<int, AgenteEvaluacionDesempenio>();
            var primer_row = true;
            //var usuario_evaluador = GetAgenteEvaluadorEvaluacionDesempenio(id_persona_usuario, cache_evaluadores);
            AsignacionEvaluadoAEvaluador asignacion_evaluado_a_evaluador = new AsignacionEvaluadoAEvaluador();

            if (tablaDatos.Rows.Count > 0)
            {
                var id_evaluacion_anterior = 0;
                var id_evaluado_anterior = 0;
                tablaDatos.Rows.ForEach(row =>
                {
                    var resp_primario_ue = GetAgenteEvaluadorEvaluacionDesempenio(row.GetSmallintAsInt("idResponsablePrimarioUe"), row.GetSmallintAsInt("id_Periodo"), cache_evaluadores);
                    //usuario_evaluador.area = GetDescripcionAreaEvaluacion(row.GetInt("id_area_ue", 0), cache_areas, row.GetString("codigo_unidad_eval", ""));

                    if (primer_row == true)
                    {
                        primer_row = false;
                        id_evaluacion_anterior = row.GetSmallintAsInt("id_evaluacion", 0);
                        id_evaluado_anterior = row.GetSmallintAsInt("id_evaluado", 0);
                        var id_evaluado = row.GetSmallintAsInt("id_evaluado", 0);
                        asignacion_evaluado_a_evaluador = newAsignacionEvaluadoAEvaluadorFromRow(row, detalle_preguntas, id_evaluado, cache_areas, resp_primario_ue);
                    }

                    if (row.GetSmallintAsInt("id_evaluado", 0) != id_evaluado_anterior || row.GetSmallintAsInt("id_evaluacion", 0) != id_evaluacion_anterior)
                    {
                        asignaciones.Add(asignacion_evaluado_a_evaluador);
                        id_evaluacion_anterior = row.GetSmallintAsInt("id_evaluacion", 0);
                        id_evaluado_anterior = row.GetSmallintAsInt("id_evaluado", 0);
                        detalle_preguntas = new List<DetallePreguntas>();
                        var id_evaluado = row.GetSmallintAsInt("id_evaluado", 0);
                        asignacion_evaluado_a_evaluador = newAsignacionEvaluadoAEvaluadorFromRow(row, detalle_preguntas, id_evaluado, cache_areas, resp_primario_ue);
                        AddDetallePreguntasA(detalle_preguntas, row, IncludeTextosPreguntas);
                    }
                    else
                    {
                        AddDetallePreguntasA(detalle_preguntas, row, IncludeTextosPreguntas);
                    }
                });
            }
            if (tablaDatos.Rows.Count > 0)
            {
                asignaciones.Add(asignacion_evaluado_a_evaluador);
            }
            asignaciones = asignaciones.OrderBy(a => a.agente_evaluado.apellido).ThenBy(a => a.agente_evaluado.nombre).ToList();
            return new RespuestaGetAgentesEvaluablesPor(asignaciones, es_agente_verificador, usuario);

        }

        protected AgenteEvaluacionDesempenio GetAgenteEvaluadorEvaluacionDesempenio(int id_evaluador, int id_periodo, Dictionary<int, AgenteEvaluacionDesempenio> cache)
        {
            if (!cache.ContainsKey(id_evaluador))
            {
                var parametros = new Dictionary<string, object>();
                parametros.Add("@Id_evaluador", id_evaluador);
                parametros.Add("@Id_periodo", id_periodo);
                var tablaDatos = _conexion.Ejecutar("[dbo].[EVAL_GET_DATOS_Evaluador]", parametros);
                var evaluador = new AgenteEvaluacionDesempenio();
                if (tablaDatos.Rows.Count > 0)
                {
                    var row = tablaDatos.Rows[0];
                    evaluador = new AgenteEvaluacionDesempenio(id_evaluador, row.GetString("apellido"), row.GetString("nombre"),
                                                        row.GetInt("NroDocumento"), row.GetString("escalafon"), row.GetString("nivel"), row.GetString("grado"), row.GetString("agrupamiento"), row.GetString("puesto"), string.Empty, DescripcionAreaEvaluacion.Nula(), row.GetInt("NroDocumento"));
                }
                cache.Add(id_evaluador, evaluador);
            }

            return cache[id_evaluador];

        }

        protected AgenteEvaluacionDesempenio GetAgenteEvaluadoEvaluacionDesempenio(int id_evaluado, DescripcionAreaEvaluacion area, RowDeDatos row)
        {
            //var parametros = new Dictionary<string, object>();
            //parametros.Add("@Id_evaluado", id_evaluado);
            //var tablaDatos = _conexion.Ejecutar("[dbo].[EVAL_GET_DATOS_Evaluado]", parametros);
            var evaluador = new AgenteEvaluacionDesempenio();
            //if (tablaDatos.Rows.Count > 0)
            //{
            //    var row = tablaDatos.Rows[0];
            evaluador = new AgenteEvaluacionDesempenio(id_evaluado, row.GetString("apellido"), row.GetString("nombre"),
                                                row.GetInt("NroDocumento"), "SINEP", row.GetString("nivel_evaluado"), row.GetString("grado_evaluado"), row.GetString("agrupamiento_evaluado", "No Especificado"), string.Empty, row.GetString("Nivel_Estudios", ""), area, row.GetInt("legajo"));
            //}
            return evaluador;
        }

        protected void AddDetallePreguntasA(List<DetallePreguntas> detalle_preguntas, RowDeDatos row, bool IncludeTextosPreguntas)
        {
            var rpta1 = IncludeTextosPreguntas ? row.GetString("rpta1", "") : String.Empty;
            var rpta2 = IncludeTextosPreguntas ? row.GetString("rpta2", "") : String.Empty;
            var rpta3 = IncludeTextosPreguntas ? row.GetString("rpta3", "") : String.Empty;
            var rpta4 = IncludeTextosPreguntas ? row.GetString("rpta4", "") : String.Empty;
            var rpta5 = IncludeTextosPreguntas ? row.GetString("rpta5", "") : String.Empty;
            var enunciado = IncludeTextosPreguntas ? row.GetString("enunciado", "") : String.Empty;

            if (IncludeTextosPreguntas)
            {
                detalle_preguntas.Add(new DetallePreguntas(row.GetSmallintAsInt("id_pregunta", 0), row.GetSmallintAsInt("orden_pregunta", 0),
                    row.GetSmallintAsInt("opcion_elegida", 0), enunciado,
                    rpta1, rpta2, rpta3,
                    rpta4, rpta5, row.GetString("factor", "")));
            }
        }

        protected AsignacionEvaluadoAEvaluador newAsignacionEvaluadoAEvaluadorFromRow(RowDeDatos row, List<DetallePreguntas> detalle_preguntas, int id_evaluado, Dictionary<int, DescripcionAreaEvaluacion> cache_areas, AgenteEvaluacionDesempenio evaluador)
        {

            var area_evaluado = GetDescripcionAreaEvaluacion(row.GetSmallintAsInt("id_area_ue", 0), cache_areas, row.GetString("codigo_unidad_eval", ""));

            var nivel = new NivelEvaluacionDesempenio(row.GetSmallintAsInt("id_nivel", 0),
                                                        row.GetString("descripcion_nivel", ""),
                                                        row.GetString("detalle_nivel", ""),
                                                        row.GetSmallintAsInt("deficiente", 0),
                                                        row.GetSmallintAsInt("regular", 0),
                                                        row.GetSmallintAsInt("bueno", 0),
                                                        row.GetSmallintAsInt("destacado", 0));

            var periodo = this.PeridoFrom(row);

            var evaluacion = EvaluacionDesempenio.Nula();

            if (row.GetInt("id_evaluacion", 0) != 0)
            {

                evaluacion = new EvaluacionDesempenio(row.GetInt("id_evaluacion", 0),
                                            row.GetSmallintAsInt("estado_evaluacion", 0),
                                            nivel,
                                            detalle_preguntas,
                                            row.GetString("codigo_gde", ""),
                                            row.GetString("codigo_doc_electronico", ""),
                                            row.GetDateTime("fecha"),
                                            new VerificacionCodigoGdeDocumento(row.GetDateTime("fechaVerificacionGDE", DateTime.MinValue), VerificacionCodigoGdeDocumento.UsuarioVerifFromDB(row.GetSmallintAsInt("idUsuarioVerificadorGDE", 0))),
                                            row.GetSmallintAsInt("sum_puntaje", 0),
                                            new AprobacionPorComite(row.GetDateTime("fecha_aprobacion_comite", DateTime.MinValue), row.GetInt("id_aprobacion_comite", 0), row.GetInt("comite_aprobador", 0), row.GetInt("id_evaluacion", 0), row.GetSmallintAsInt("id_usuario_aprobacion", 0))
                                            );
            }

            var unidad_evaluacion = UnidadDeEvaluacion.Nulio();
            if (row.GetInt("id_unidad_eval", 0) != 0)
            {
                unidad_evaluacion = new UnidadDeEvaluacion(row.GetInt("id_unidad_eval"), row.GetString("codigo_unidad_eval"), row.GetString("nombre_area_ue", ""), row.GetSmallintAsInt("id_Periodo"));
            }

            return new AsignacionEvaluadoAEvaluador(
                GetAgenteEvaluadoEvaluacionDesempenio(id_evaluado, area_evaluado, row),
                evaluador,
                evaluacion,
                periodo,
                nivel,
                unidad_evaluacion);

        }

        public int insertarEvaluacion(int idEvaluado, int idEvaluador, int idFormulario, int periodo, int estado, string id_doc_electronico)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", 0);
            parametros.Add("@id_evaluador", idEvaluador); //AGU: 27/11/2018 - Este dato se ignora en el SP por el bug de que lo está tomando desde el usuario logueado, y eso está mal.
            parametros.Add("@id_evaluado", idEvaluado);
            parametros.Add("@id_formulario", idFormulario);
            parametros.Add("@id_periodo", periodo);
            parametros.Add("@estado", estado);
            parametros.Add("@baja", 0);
            parametros.Add("@id_doc_electronico", id_doc_electronico);
            //parametros.Add("@fecha", DateTime());
            return (int)_conexion.EjecutarEscalar("dbo.EVAL_INS_Evaluacion", parametros);
        }

        public void updateEvaluacion(int idEval, int idEvaluado, int idEvaluador, int idFormulario, int periodo, int estado, string id_doc_electronico)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", idEval);
            parametros.Add("@id_evaluador", idEvaluador);
            parametros.Add("@id_evaluado", idEvaluado);
            parametros.Add("@id_formulario", idFormulario);
            parametros.Add("@id_periodo", periodo);
            parametros.Add("@estado", estado);
            parametros.Add("@baja", 0);
            parametros.Add("@fecha", DateTime.Today);
            parametros.Add("@id_doc_electronico", id_doc_electronico);

            _conexion.Ejecutar("dbo.EVAL_UPD_Evaluacion", parametros);

        }

        public void insertarEvaluacionDetalle(int idEvaluacion, int idPregunta, int opcion)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", idEvaluacion);
            parametros.Add("@id_pregunta", idPregunta);
            parametros.Add("@opcion_elegida", opcion);

            _conexion.Ejecutar("dbo.EVAL_INS_Evaluacion_Detalle", parametros);
        }

        public int GetIdEvaluadorDelUsuario(Usuario usuario)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_persona_responsable", usuario.Owner.Id);

            var tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_IdEvaluadorResponsableUnidadEval", parametros);

            if (tablaDatos.Rows.Count > 0)
            {
                return tablaDatos.Rows[0].GetSmallintAsInt("id");
            }
            else
            {
                parametros = new Dictionary<string, object>();
                parametros.Add("@id_persona", usuario.Owner.Id);

                tablaDatos = _conexion.Ejecutar("dbo.EVAL_GET_IdEvaluador_Persona", parametros);
                if (tablaDatos.Rows.Count > 0)
                {
                    return tablaDatos.Rows[0].GetSmallintAsInt("id");
                }
                else
                {
                    throw new Exception("No existe un id de evaluador para la persona solicitada");
                }
            }
        }


        public void deleteEvaluacionDetalle(int idEval)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", idEval);

            _conexion.Ejecutar("dbo.EVAL_DEL_Evaluacion_Detalle", parametros);
        }

        public void VerificarCodigoGDE(int id_evaluacion, Usuario usuario)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@idEvaluacion", id_evaluacion);
            parametros.Add("@idPersonaVerificadora", usuario.Owner.Id);

            _conexion.Ejecutar("dbo.EVAL_INS_VerificarCodigoGDE", parametros);
        }

        public void EvalGuardarCodigoGDE(int id_evaluacion, string codigo_gde)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", id_evaluacion);
            parametros.Add("@codigo_gde", codigo_gde);

            _conexion.Ejecutar("dbo.EVAL_UPD_CodigoGdeEvaluacion", parametros);
        }

        public void EvalCorregirCodigoGDE(int id, string codigo)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_evaluacion", id);
            parametros.Add("@codigo_gde", codigo);

            _conexion.Ejecutar("dbo.EVAL_ActualizarCodigoDocumentoGDE", parametros);
        }

        public PeriodoEvaluacion GetUltimoPeriodoEvaluacion()
        {
            var tabla = _conexion.Ejecutar("dbo.EVAL_GET_UltimoPeriodoEvaluacion");
            if (tabla.Rows.Count != 1)
            {
                throw new Exception("No se pudo determinar un periodo actual de evaluacion");
            }
            return PeridoFrom(tabla.Rows[0]);
        }

        protected PeriodoEvaluacion PeridoFrom(RowDeDatos row)
        {
            return new PeriodoEvaluacion(row.GetInt("id_periodo", 0),
                            row.GetString("descripcion_periodo", ""), row.GetDateTime("periodo_desde"), row.GetDateTime("periodo_hasta"), row.GetString("Descr_Tipo_Periodo", "No Especifica"));
        }




        public List<UnidadDeEvaluacion> GetEstadosEvaluaciones(bool excluirPeriodosDeBaja)
        {
            var result = new List<UnidadDeEvaluacion>();
            var parametros = new Dictionary<string, object>();
            if (excluirPeriodosDeBaja)
            {
                parametros.Add("@excluirPeriodosDeBaja", 1);
            }

            var tablaDeDatos = _conexion.Ejecutar("dbo.[EVAL_GET_Estado_Evaluaciones_TdeC]", parametros);
            tablaDeDatos.Rows.ForEach(row =>
            {
                var ue = new UnidadDeEvaluacion(row.GetSmallintAsInt("id_unidad_evaluacion"), row.GetString("codigo_unidad_de_evaluacion"), row.GetString("unidad_de_evaluacion"), row.GetSmallintAsInt("id_periodo"));
                ue.DetalleEvaluados = new DetalleEvaluadosPorUnidadEvaluacion(row.GetSmallintAsInt("Evaluado_Destacado"), row.GetSmallintAsInt("Evaluado_Bueno"), row.GetSmallintAsInt("Evaluado_Regular"), row.GetSmallintAsInt("Evaluado_Deficiente"), row.GetSmallintAsInt("Provisoria"), row.GetSmallintAsInt("Pendiente"));
                result.Add(ue);
            }
            );
            return result;
        }

        public ComiteEvaluacionDesempenio AgregarComite(string descripcion, DateTime fecha, string hora, string lugar, int periodo)
        {
            //ComiteEvaluacionDesempenio comite = new ComiteEvaluacionDesempenio();
            var parametros = new Dictionary<string, object>();

            parametros.Add("@descripcion", descripcion);
            parametros.Add("@fecha", fecha);
            parametros.Add("@hora", hora);
            parametros.Add("@lugar", lugar);
            parametros.Add("@periodo", periodo);

            var tablaDeDatos = _conexion.Ejecutar("dbo.EVAL_ADD_Comite", parametros);
            //comite.Id = tablaDeDatos.Rows[0].GetSmallintAsInt("Id");
            return GetComiteById(tablaDeDatos.Rows[0].GetSmallintAsInt("Id"));
            //return comite;
        }

        public ComiteEvaluacionDesempenio UpdateComite(int id_comite, string descripcion, DateTime fecha, string hora, string lugar, int periodo)
        {
            ComiteEvaluacionDesempenio comite = new ComiteEvaluacionDesempenio();
            var parametros = new Dictionary<string, object>();

            parametros.Add("@descripcion", descripcion);
            parametros.Add("@fecha", fecha);
            parametros.Add("@hora", hora);
            parametros.Add("@lugar", lugar);
            parametros.Add("@id_periodo", periodo);
            parametros.Add("@id_comite", periodo);

            var tablaDeDatos = _conexion.Ejecutar("dbo.EVAL_UPD_Comite", parametros);

            if (tablaDeDatos.Rows.Count.Equals(0))
            {
                throw new Exception("No se pudo actualizar el comité");
            }

            var row = tablaDeDatos.Rows[0];
            comite.Descripcion = row.GetString("descripcion");
            comite.Fecha = row.GetDateTime("fecha");
            comite.Hora = row.GetString("hora");
            comite.Lugar = row.GetString("lugar");
            comite.Periodo = new PeriodoEvaluacion(row.GetInt("id_periodo"), row.GetString("desc_periodo"), row.GetDateTime("desde"), row.GetDateTime("hasta"), row.GetString("Descr_Tipo_Periodo", ""));
            comite.Id = id_comite;

            return comite;
        }
    }

}
