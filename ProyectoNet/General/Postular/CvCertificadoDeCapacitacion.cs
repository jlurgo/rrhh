﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.Repositorios;
using General.MAU;
using General.Postular;

namespace General
{
    public class CvCertificadoDeCapacitacion : ItemCv
    {
        protected string _diplomaDeCertificacion;
        protected string _establecimiento;
        protected DateTime _fechaInicio;
        protected DateTime _fechaFinalizacion;
        protected string _duracion;
        protected string _especialidad;
        protected int _unidadTiempo;

        protected string _localidad;
        protected int _pais;

        public string DiplomaDeCertificacion { get { return _diplomaDeCertificacion; } set { _diplomaDeCertificacion = value; } }
        public string Establecimiento { get { return _establecimiento; } set { _establecimiento = value; } }
        public string Especialidad { get { return _especialidad; } set { _especialidad = value; } }
        public string Duracion { get { return _duracion; } set { _duracion = value; } }
        public DateTime FechaInicio { get { return _fechaInicio; } set { _fechaInicio = value; } }
        public DateTime FechaFinalizacion { get { return _fechaFinalizacion; } set { _fechaFinalizacion = value; } }
        public string Localidad { get { return _localidad; } set { _localidad = value; } }
        public int Pais { get { return _pais; } set { _pais = value; } }
        public int UnidadTiempo { get { return _unidadTiempo; } set { _unidadTiempo = value; } }

        public CvCertificadoDeCapacitacion(int id, string diplomaDeCertificacion, string establecimiento, string especialidad, string duracion, DateTime fechaInicio, DateTime fechaFinalizacion, string localidad, int pais,int unidad_tiempo):base(id,diplomaDeCertificacion,2)
        {
            this.Id = id;
            this._diplomaDeCertificacion = diplomaDeCertificacion;
            this._establecimiento = establecimiento;
            this._especialidad = especialidad;
            this._fechaInicio = fechaInicio;
            this._fechaFinalizacion = fechaFinalizacion;
            this._duracion = duracion;
            this._localidad = localidad;
            this._pais = pais;
            this._unidadTiempo = unidad_tiempo;
        }





        public CvCertificadoDeCapacitacion()
        {
        }

        override public void validarDatos()
        {
            var validador_actividad = new Validador();

            validador_actividad.DeberianSerNoVacias(new string[] { "DiplomaDeCertificacion", "Duracion", "Establecimiento", "Localidad" });
            validador_actividad.DeberianSerFechasNoVacias(new string[] { "FechaInicio", "FechaFinalizacion" });
            validador_actividad.DeberianSerNaturalesOCero(new string[] { "Pais" });

            if (!validador_actividad.EsValido(this))
                throw new ExcepcionDeValidacion("El tipo de dato no es correcto");
        }

        override public Dictionary<string, object> Parametros(Usuario usuario, RepositorioDeCurriculum repo)
        {
            return repo.ParametrosDeActividadesDeCapacitacion(this, usuario);
        }

        override public string SpInsercion(RepositorioDeCurriculum repo)
        {
            return repo.SpActividadesCapacitacion();
        }
    }
}
