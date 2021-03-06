﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using General.Csv;

namespace General.Repositorios
{
    public class RepositorioVerificador : RepositorioLazySingleton<CSV>    
    {
        private static RepositorioVerificador _instancia;

        private RepositorioVerificador(IConexionBD conexion)
            : base(conexion, 10)
        {
        }

        public static RepositorioVerificador NuevoRepositorioVerificador(IConexionBD conexion)
        {
            if (!(_instancia != null && !_instancia.ExpiroTiempoDelRepositorio())) _instancia = new RepositorioVerificador(conexion);
            return _instancia;
        }

        /*********BORRAR*****/
        public bool conformarRecibo(int idRecibo, int idUsuario, DateTime hoy, int recibo_aceptado, string observacion, string hash )
        {
            var parametros = new Dictionary<string, object>();            
            parametros.Add("@id_Recibo", idRecibo);
            parametros.Add("@id_Usuario", idUsuario);
            parametros.Add("@fechaConformidadUsuario", hoy);
            parametros.Add("@recibo_aceptado", recibo_aceptado);
            parametros.Add("@observacion", observacion);
            parametros.Add("@hash", hash);
            var resultado = conexion.EjecutarSinResultado("dbo.[PLA_UPD_ConformarRecibo]", parametros);
            //en ejecutar sinresultado hay un try catch pero en caso de catch no retorna false sino eleva una excepcion
            //no deberia retornar false? en caso de elevar la excepcion se la atenderia en el javascript del cliente
            return resultado;

        }

        protected override void QuitarDeLaBase(CSV csv, int usuario)

        {
            throw new NotImplementedException();
        }

        public  List<CSV> ObtenerDesdeLaBase(string csv)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@csv", csv);
            var tablaDatos = conexion.Ejecutar("dbo.VERI_Get_Csv", parametros);
            var csvs = new List<CSV>();
            if (tablaDatos.Rows.Count > 0)
            {
                tablaDatos.Rows.ForEach(row =>
                {
                    csvs.Add(new CSV(row.GetLong("id"), row.GetString("csv"), row.GetInt("tipo_doc_electronico"), row.GetInt("id_doc")));
                    
                    /*row.GetInt("Id"),
                    rto.GetString(8);
                    fechas.Add(row.GetDateTime("Fecha"));*/

                });
            }

            return csvs;
        }

        public bool agregarCsv(string csv, int tipo_doc_electronico, int id_doc)
        {
            var parametros = new Dictionary<string, object>();
            parametros.Add("@csv", csv);
            parametros.Add("@tipo_doc_electronico", tipo_doc_electronico);
            parametros.Add("@id_doc", id_doc);
            var resultado = conexion.EjecutarSinResultado("dbo.[VERI_ADD_Csv]", parametros);
            //en ejecutar sinresultado hay un try catch pero en caso de catch no retorna false sino eleva una excepcion
            //no deberia retornar false? en caso de elevar la excepcion se la atenderia en el javascript del cliente
            return resultado;

        }

        protected override List<CSV> ObtenerDesdeLaBase()
        {
            throw new NotImplementedException();
        }

        protected override void GuardarEnLaBase(CSV csv, int id_usuario_logueado)
        {
            throw new NotImplementedException();
        }

        //TODO agregar recibo firmado, leer recibo firmado
      

        /*
         public bool CambiarPassword(Usuario usuario, string pass_actual, string pass_nueva)
        {
            var pass_actual_encriptada = encriptarSHA1(pass_actual);
            var pass_nueva_encriptada = encriptarSHA1(pass_nueva);
            var parametros = new Dictionary<string, object>();
           // parametros.Add("@usuario", usuario.NombreDeUsuario);
            //parametros.Add("@password", pass_actual_encriptada);
            //Area area = new Area();

            //var tablaDatos = conexion_bd.Ejecutar("dbo.Web_Login", parametros);

           // if (tablaDatos.Rows.Count > 0)
           // {
                //parametros = new Dictionary<string, object>();

                parametros.Add("@idUsuario", usuario.Id);
                parametros.Add("@password_actual", pass_actual_encriptada);
                parametros.Add("@password_nuevo", pass_nueva_encriptada);
                var rto =   (int)conexion_bd.EjecutarEscalar("dbo.SACC_Upd_Password", parametros);

                if (rto > 0)
		            return true;
                return false;
                    
               
            //}

           // return false;
        }
         */


    }
}
