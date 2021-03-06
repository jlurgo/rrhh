﻿using System;
using System.Collections.Generic;
using System.Text;
using General;
using System.Data.SqlClient;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace General.Repositorios
{
    public class RepositorioDeNivelesDeDocencia : RepositorioLazySingleton<NivelDeDocencia>
    {
        private static RepositorioDeNivelesDeDocencia _instancia;

        private RepositorioDeNivelesDeDocencia(IConexionBD conexion)
            :base(conexion, 10)
        {
        }

        public static RepositorioDeNivelesDeDocencia Nuevo(IConexionBD conexion)
        {
            if (!(_instancia != null && !_instancia.ExpiroTiempoDelRepositorio())) _instancia = new RepositorioDeNivelesDeDocencia(conexion);
            return _instancia;
        }

        public List<NivelDeDocencia> All()
        {
            return this.Obtener();
        }        

        protected override List<NivelDeDocencia> ObtenerDesdeLaBase()
        {
            var tablaDatos = conexion.Ejecutar("dbo.CV_Get_NivelesDeDocencias");
            var niveles = new List<NivelDeDocencia>();
            if (tablaDatos.Rows.Count > 0)
            {
                tablaDatos.Rows.ForEach(row =>
                {
                    niveles.Add(new NivelDeDocencia(row.GetSmallintAsInt("Id"), row.GetString("Descripcion")));
                });
            }

            return niveles;
        }

        protected override void GuardarEnLaBase(NivelDeDocencia objeto, int id_usuario_logueado)
        {
 	        throw new NotImplementedException();
        }

        protected override void QuitarDeLaBase(NivelDeDocencia objeto, int id_usuario_logueado)
        {
 	        throw new NotImplementedException();
        }
    }
}
