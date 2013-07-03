﻿using System.Collections.Generic;
using System;


namespace General.Repositorios
{
    public class RepositorioDeEvaluacion
    {
        List<Evaluacion> evaluaciones = new List<Evaluacion>();
        public IConexionBD conexion_bd { get; set; }

        public RepositorioDeEvaluacion(IConexionBD conexion)
        {
            this.conexion_bd = conexion;
        }

        public List<Evaluacion> GetEvaluaciones()
        {
            var tablaDatos = conexion_bd.Ejecutar("dbo.SACC_Get_Evaluaciones");
            
            tablaDatos.Rows.ForEach(row =>
                {
                    
                    Evaluacion evaluacion = new Evaluacion{

                        InstanciaEvaluacion = new InstanciaDeEvaluacion(row.GetSmallintAsInt("idInstanciaEvaluacion"), row.GetString("DescripcionInstanciaEvaluacion")),
                        Alumno = new RepositorioDeAlumnos(conexion_bd).GetAlumnoByDNI(row.GetSmallintAsInt("idAlumno")),
                        Curso = new RepositorioDeCursos(conexion_bd).GetCursoById(row.GetSmallintAsInt("idCurso")),
                        Calificacion = new CalificacionNoNumerica(row.GetString("Calificacion")),
                        Fecha = row.GetDateTime("FechaEvaluacion")
                    };
                    evaluaciones.Add(evaluacion);
                 });  

            return evaluaciones;
        }

        public List<Evaluacion> GetEvaluacionesPorCursoYAlumno(int id_curso, int id_alumno)
        {
            GetEvaluaciones();
            return this.evaluaciones.FindAll(evaluaciones => evaluaciones.Curso.Id.Equals(id_curso) && evaluaciones.Alumno.Id.Equals(id_alumno));
        }

        public void GuardarEvaluacion(Evaluacion evaluacion, Usuario usuario)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("id_alumno", evaluacion.Alumno.Id);
            parametros.Add("id_curso", evaluacion.Curso.Id);
            parametros.Add("fecha_evaluacion", evaluacion.Fecha);
            parametros.Add("calificacion", evaluacion.Calificacion);
            parametros.Add("id_usuario", usuario.Id);
            parametros.Add("fecha", DateTime.Now);

            conexion_bd.EjecutarSinResultado("dbo.SACC_Ins_Evaluacion", parametros);

        }


        public void GuardarEvaluaciones(List<Evaluacion> evaluaciones_a_guardar, Usuario usuario)
        {
            foreach (var e in evaluaciones_a_guardar)
            {
                BorrarEvaluacion(e);
            }
            foreach (var e in evaluaciones_a_guardar)
            {
                //if (e.Calificacion != 0)
                GuardarEvaluacion(e, usuario);
            }
        }

        private void BorrarEvaluacion(Evaluacion evaluacion)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("id_alumno", evaluacion.Alumno.Id);
            parametros.Add("id_curso", evaluacion.Curso.Id);
            parametros.Add("fecha_evaluacion", evaluacion.Fecha);
            conexion_bd.EjecutarSinResultado("dbo.SACC_Upd_Del_Evaluacion", parametros);

        }
    }
}