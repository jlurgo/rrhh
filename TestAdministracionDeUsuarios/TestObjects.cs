﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdministracionDeUsuarios;

namespace TestAdministracionDeUsuarios
{
    public class TestObjects
    {

        public static Usuario Jorge()
        {
            return new Usuario() { Id = 1, NombreDeUsuario = "jorge" };
        }
        public static Funcionalidad FuncionalidadIngresoSacc()
        {
            return new Funcionalidad(1, "ingreso_a_sacc");
        }

        private static Dictionary<Usuario, List<AdministracionDeUsuarios.Funcionalidad>> diccionario_permisos()
        {
            var diccionario = new Dictionary<Usuario, List<AdministracionDeUsuarios.Funcionalidad>>();
            var permisos_jorge = new List<Funcionalidad>();
            permisos_jorge.Add(FuncionalidadIngresoSacc());
            diccionario.Add(Jorge(), permisos_jorge);
            return diccionario;
        }

        public static Autorizador Autorizador()
        {
            return new Autorizador(diccionario_permisos()); 
        }
    }
}
