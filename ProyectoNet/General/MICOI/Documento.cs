﻿namespace General
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;

    public class Documento
    {
        private int _id;
        private TipoDeDocumentoSICOI _tipoDeDocumento;
        private string _numero;
        private CategoriaDeDocumentoSICOI _categoriaDeDocumento;
        private string _extracto;
        private string _comentarios;
        private string _ticket;
        private DateTime _fecha;

        private DateTime? _fecha_documento;




        public int Id { get { return _id; } set { _id = value; } }
        public TipoDeDocumentoSICOI tipoDeDocumento { get { return _tipoDeDocumento; } set { _tipoDeDocumento = value; } }
        public string numero { get { return _numero; } set { _numero = value; } }
        public CategoriaDeDocumentoSICOI categoriaDeDocumento { get { return _categoriaDeDocumento; } set { _categoriaDeDocumento = value; } }
        public string extracto { get { return _extracto; } set { _extracto = value; } }
        public string comentarios { get { return _comentarios; } set { _comentarios = value; } }
        public string ticket { get { return _ticket; } set { _ticket = value; } }
        public DateTime fecha { get { return _fecha; } set { _fecha = value; } }


        public DateTime? fecha_documento { get { return _fecha_documento; } set { _fecha_documento = value; } }


        public Documento()
        {
        }

        public Documento(int id, TipoDeDocumentoSICOI tipoDeDocumento, string numero, CategoriaDeDocumentoSICOI categoria, Area areaOrigen, string extracto)
            : this(tipoDeDocumento, numero, categoria, areaOrigen, extracto)
        {
            this.Id = id;
        }


        public Documento(TipoDeDocumentoSICOI tipoDeDocumento, string numero, CategoriaDeDocumentoSICOI categoria, Area areaOrigen, string extracto)
            : this()
        {
            Validador().EsValidoComoId(tipoDeDocumento.Id, "para el tipo de un documento");
            this._tipoDeDocumento = tipoDeDocumento;
            this._numero = numero;
            Validador().EsValidoComoId(categoria.Id, "para la categoria de un documento");
            this._categoriaDeDocumento = categoria;
            this._extracto = extracto;
        }


        /**/
        public Documento(TipoDeDocumentoSICOI tipoDeDocumento, string numero, CategoriaDeDocumentoSICOI categoria, Area areaOrigen, string extracto, DateTime? Fecha_de_documento)
            : this()
        {
            Validador().EsValidoComoId(tipoDeDocumento.Id, "para el tipo de un documento");
            this._tipoDeDocumento = tipoDeDocumento;
            this._numero = numero;
            Validador().EsValidoComoId(categoria.Id, "para la categoría de un documento");
            this._categoriaDeDocumento = categoria;
            this._extracto = extracto;
            this.fecha_documento = Fecha_de_documento;
        }

        /**/
        private ValidadorMICOI Validador()
        {
            return new ValidadorMICOI();
        }

        public Documento(TipoDeDocumentoSICOI tipoDeDocumento, string numero, CategoriaDeDocumentoSICOI categoria, Area areaOrigen, string extracto, string comentarios)
            : this(tipoDeDocumento, numero, categoria, areaOrigen, extracto)
        {
            this._comentarios = comentarios;
        }


        /**/
        public Documento(TipoDeDocumentoSICOI tipoDeDocumento, string numero, CategoriaDeDocumentoSICOI categoria, Area areaOrigen, string extracto, string comentarios, DateTime? fecha_documento)
            : this(tipoDeDocumento, numero, categoria, areaOrigen, extracto,fecha_documento)
        {
            this._comentarios = comentarios;

        }
        /**/



        public override bool Equals(object obj)
        {
            if (obj.GetType() != this.GetType())
            {
                return false;
            }
            if (base.Equals(obj)) { return true; }
            if (((Documento)obj)._id == this._id) { return true; }
            return false;
        }

        public override int GetHashCode()
        {
            return this._id;
        }

        public static Documento fromDTO(string documento_DTO)
        {
            throw new NotImplementedException();
        }
    }
}
