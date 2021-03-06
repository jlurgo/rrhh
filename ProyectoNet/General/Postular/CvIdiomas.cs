﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.MAU;
using General.Repositorios;

namespace General
{
    public class CvIdiomas : ItemCv
    {
        protected string _diploma;
        protected string _establecimiento;
        protected string _idioma;
        protected int _lectura;
        protected int _escritura;
        protected int _oral;
        protected DateTime _fechaObtencion;
        //protected DateTime _fechaFin;
        protected string _localidad;
        protected int _pais;

        public string Diploma { get { return _diploma; } set { _diploma = value; } }
        public string Establecimiento { get { return _establecimiento; } set { _establecimiento = value; } }
        public string Idioma { get { return _idioma; } set { _idioma = value; } }
        public int Lectura { get { return _lectura; } set { _lectura = value; } }
        public int Escritura { get { return _escritura; } set { _escritura = value; } }
        public int Oral { get { return _oral; } set { _oral = value; } }
        public DateTime FechaObtencion { get { return _fechaObtencion; } set { _fechaObtencion = value; } }
        //public DateTime FechaFin { get { return _fechaFin; } set { _fechaFin = value; } }
        public string Localidad { get { return _localidad; } set { _localidad = value; } }
        public int Pais { get { return _pais; } set { _pais = value; } }

        public CvIdiomas()
        {
        }
        
        public CvIdiomas(int id, string diploma, string establecimiento, string idioma, int lectura, int escritura, int oral, DateTime fechaObtencion, string localidad, int pais)
            : base(id,idioma,9)
        {
            this.Id = id;
            this._diploma = diploma;
            this._establecimiento = establecimiento;
            this._idioma = idioma;
            this._lectura = lectura;
            this._escritura = escritura;
            this._oral = oral;
            this._fechaObtencion = fechaObtencion;
            //this._fechaFin = fechaFin;
            this._localidad = localidad;
            this._pais = pais;
        }

        override public void validarDatos()
        {
            var validador_idioma = new Validador();

            validador_idioma.DeberianSerNoVacias(new string[] { "Diploma", "Idioma", "Establecimiento", "Localidad" });
            validador_idioma.DeberianSerFechasNoVacias(new string[] { "FechaObtencion" });
            validador_idioma.DeberianSerNaturalesOCero(new string[] { "Lectura", "Escritura", "Oral", "Pais" });

            if (!validador_idioma.EsValido(this))
                throw new ExcepcionDeValidacion("El tipo de dato no es correcto");
        }

        override public Dictionary<string, object> Parametros(Usuario usuario, RepositorioDeCurriculum repo)
        {
            return repo.ParametrosDelIdioma(this, usuario);
        }

        override public string SpInsercion(RepositorioDeCurriculum repo)
        {
            return repo.SPIdiomas();
        }
    }
}
