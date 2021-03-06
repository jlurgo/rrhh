﻿using System;
using System.Collections.Generic;
using System.Data;
namespace General.Repositorios
{
    public interface IConexionBD
    {
        TablaDeDatos Ejecutar(string procedimiento, int segundos_timeout = 30);
        List<DataTable> EjecutarConVariosResultados(string procedimiento, int segundos_timeout = 30);
        TablaDeDatos Ejecutar(string procedimiento, System.Collections.Generic.Dictionary<string, object> parametros, int segundos_timeout = 30);
        object EjecutarEscalar(string nombreProcedimiento);
        object EjecutarEscalar(string nombreProcedimiento, Dictionary<string, object> parametros);
        bool EjecutarSinResultado(string nombreProcedimiento);
        bool EjecutarSinResultado(string nombreProcedimiento, Dictionary<string, object> parametros);
        IDbTransaction BeginTransaction();

        //void PseudoBulk(AnalisisDeLicenciaOrdinaria analisis);

        void Bulk(System.Data.DataTable analisis, string p);
    }
}
