﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.Repositorios;

namespace General.MAU
{
    public class RepositorioDeFuncionalidadesDeUsuarios : RepositorioLazySingleton<KeyValuePair<int, int>>, IRepositorioDeFuncionalidadesDeUsuarios
    {
        protected IRepositorioDeFuncionalidades repositorioDeFuncionalidades;

        private static RepositorioDeFuncionalidadesDeUsuarios _instancia;

        private RepositorioDeFuncionalidadesDeUsuarios(IConexionBD conexion, IRepositorioDeFuncionalidades repo_funcionalidades)
            :base(conexion, 10)
        {
            repositorioDeFuncionalidades = repo_funcionalidades;
        }

        public static RepositorioDeFuncionalidadesDeUsuarios NuevoRepositorioDeFuncionalidadesDeUsuarios(IConexionBD conexion, IRepositorioDeFuncionalidades repo_funcionalidades)
        {
            if (!(_instancia != null && !_instancia.ExpiroTiempoDelRepositorio())) _instancia = new RepositorioDeFuncionalidadesDeUsuarios(conexion, repo_funcionalidades);
            return _instancia;
        }

        public List<Funcionalidad> FuncionalidadesPara(Usuario usuario)
        {
            return this.FuncionalidadesPara(usuario.Id);
        }

        public List<Funcionalidad> FuncionalidadesPara(int id_usuario)
        {
            return this.Obtener().FindAll(p => p.Key == id_usuario).Select(p => this.repositorioDeFuncionalidades.GetFuncionalidadPorId(p.Value)).ToList();
        }

        public void ConcederFuncionalidadA(Usuario usuario, Funcionalidad funcionalidad)
        {
            this.ConcederFuncionalidadA(usuario.Id, funcionalidad.Id);
        }

        public void ConcederFuncionalidadA(int id_usuario, int id_funcionalidad)
        {
            this.Guardar(new KeyValuePair<int, int>(id_usuario, id_funcionalidad));
        }

        public void DenegarFuncionalidadA(int id_usuario, int id_funcionalidad)
        {
            this.Quitar(new KeyValuePair<int, int>(id_usuario, id_funcionalidad));
        }

        protected override List<KeyValuePair<int, int>> ObtenerDesdeLaBase()
        {
            return conexion.Ejecutar("dbo.MAU_GetFuncionalidadesDeUsuarios")
                .Rows.Select(row => new KeyValuePair<int, int>(row.GetInt("id_usuario"), row.GetInt("id_funcionalidad")))
                .ToList();
        }

        protected override void GuardarEnLaBase(KeyValuePair<int, int> objeto)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_usuario", objeto.Key);
            parametros.Add("@id_funcionalidad", objeto.Value);
            var tablaDatos = conexion.Ejecutar("dbo.MAU_ConcederFuncionalidadA", parametros);
        }

        protected override void QuitarDeLaBase(KeyValuePair<int, int> objeto)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@id_usuario", objeto.Key);
            parametros.Add("@id_funcionalidad", objeto.Value);
            var tablaDatos = conexion.Ejecutar("dbo.MAU_DenegarFuncionalidadA", parametros);
        }
    }
}