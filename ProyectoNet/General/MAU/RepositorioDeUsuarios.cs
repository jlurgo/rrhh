﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.Repositorios;
using System.Security.Cryptography;

namespace General.MAU
{
    public class RepositorioDeUsuarios:IRepositorioDeUsuarios
    {
        private IConexionBD conexion;
        private IRepositorioDePersonas repositorio_de_personas;

        public RepositorioDeUsuarios(IConexionBD conexion, IRepositorioDePersonas repo_personas)
        {
            this.conexion = conexion;
            this.repositorio_de_personas = repo_personas;
        }

        public Usuario GetUsuarioPorAlias(string alias)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@alias", alias);
            var tablaDatos = conexion.Ejecutar("dbo.Web_GetUsuario", parametros);
            if (tablaDatos.Rows.Count > 1) throw new Exception("hay mas de un usuario con el mismo alias: " + alias);

            return GetUsuarioDeTablaDeDatos(tablaDatos);                                 
        }

        public Usuario GetUsuarioPorIdPersona(int id_persona)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_persona", id_persona);
            var tablaDatos = conexion.Ejecutar("dbo.Web_GetUsuario", parametros);
            
            if (tablaDatos.Rows.Count > 1) throw new Exception("hay mas de un usuario con el mismo id persona: " + id_persona);
            return GetUsuarioDeTablaDeDatos(tablaDatos);
        }

        private Usuario GetUsuarioDeTablaDeDatos(TablaDeDatos tablaDatos)
        {
            if (tablaDatos.Rows.Count == 0) return new UsuarioNulo();
            var row = tablaDatos.Rows.First();
            var legajo = "";
            if (!(row.GetObject("Id_Persona") is DBNull))
            {
                var persona = repositorio_de_personas.GetPersonaPorId(row.GetInt("Id_Persona"));
                return new Usuario(row.GetSmallintAsInt("Id"), row.GetString("Alias"), row.GetString("Clave_Encriptada"), persona);
            }
            return new Usuario(row.GetSmallintAsInt("Id"), row.GetString("Alias"), row.GetString("Clave_Encriptada"));            
        }
        
        public Usuario CrearUsuarioPara(int id_persona)
        {
            var persona = repositorio_de_personas.GetPersonaPorId(id_persona);
            var alias = persona.Nombre.First() + persona.Apellido;
            var contador = 1;
            while (!GetUsuarioPorAlias(alias).Equals(new UsuarioNulo()))
            {
                alias = persona.Nombre.First() + persona.Apellido + contador.ToString();
                contador++;
            }
            var clave_encriptada = EncriptarSHA1("1234");

            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_persona", id_persona);
            parametros.Add("@alias", alias);
            parametros.Add("@clave_encriptada", clave_encriptada);
            int id_usuario = (int)conexion.EjecutarEscalar("dbo.MAU_CrearUsuario", parametros);

            return new Usuario(id_usuario, alias, clave_encriptada, persona);
        }

        public static string EncriptarSHA1(string CadenaOriginal)
        {
            HashAlgorithm hashValue = new SHA1CryptoServiceProvider();
            byte[] bytes = Encoding.UTF8.GetBytes(CadenaOriginal); byte[] byteHash = hashValue.ComputeHash(bytes);
            hashValue.Clear();
            return (Convert.ToBase64String(byteHash));
        }
    }
}
