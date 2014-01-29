﻿using System;
using System.Collections.Generic;

using System.Text;
using System.Data.SqlClient;
using General;
using System.Security.Cryptography;

namespace General.MAU
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Alias { get; set; }
        public Persona Owner { get; set; }

        protected string clave_encriptada { get; set; }

        public Usuario()
        {
        }

        public Usuario(int id, string alias, string clave_encriptada, Persona owner)
        {
            this.Id = id;
            this.Alias = alias;
            this.clave_encriptada = clave_encriptada;
            this.Owner = owner;
        }

        public Usuario(int id, string alias, string clave_encriptada)
        {
            this.Id = id;
            this.Alias = alias;
            this.clave_encriptada = clave_encriptada;
        }

        public bool EsFirmante { get; set; }

        public virtual bool ValidarClave(string clave)
        {
            return this.clave_encriptada == RepositorioDeUsuarios.EncriptarSHA1(clave);
        }

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            return this.Id == ((Usuario)obj).Id; 
        }

        // override object.GetHashCode
        public override int GetHashCode()
        {
            return this.Id;
        }
    }
}
