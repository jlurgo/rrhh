﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AdministracionDeUsuarios;
using General.MAU;

namespace AdministracionDeUsuarios
{
    public class TestObjectsMau
    {

        public static Usuario Jorge()
        {
            return new Usuario(1, "jorge", "BNlHU/MO3sKjsOIeSFRf8yCC8a4=");
        }

        public static Usuario Javier()
        {
            return new Usuario(2, "javier", "AFQCASWRGAWERGWEASGAV");
        }

        public static Usuario Zambri()
        {
            return new Usuario(3, "zambri", "AFQCASWRGAWERGWEASGAV");
        }

        private static Dictionary<Usuario, List<AdministracionDeUsuarios.Funcionalidad>> diccionario_permisos()
        {
            var diccionario = new Dictionary<Usuario, List<Funcionalidad>>();
            var permisos_jorge = new List<Funcionalidad>();
            permisos_jorge.Add(FuncionalidadIngresoMenuPrincipal());
            permisos_jorge.Add(FuncionalidadIngresoSacc());
            permisos_jorge.Add(FuncionalidadIngresoModi());
            diccionario.Add(Jorge(), permisos_jorge);
            return diccionario;
        }

        private static List<MenuDelSistema> menues()
        {
            var menues = new List<MenuDelSistema>();
            menues.Add(MenuPrincipal());
            return menues;
        }

        private static MenuDelSistema MenuPrincipal()
        {
            var items = new List<ItemDeMenu>();
            items.Add(new ItemDeMenu(1, "SACC", "SACC/Inicio.aspx", FuncionalidadIngresoSacc()));
            items.Add(new ItemDeMenu(2, "MODI", "modi/modi.aspx", FuncionalidadIngresoModi()));
            return new MenuDelSistema("PRINCIPAL", items);
        }

        public static Autorizador Autorizador()
        {
            return new Autorizador(diccionario_permisos(), menues(), TestObjectsMau.RepositorioDeUsuarios()); 
        }

        public static IRepositorioDeUsuarios RepositorioDeUsuarios()
        {
            var lista_usuarios = new List<Usuario>();
            lista_usuarios.Add(Jorge());
            lista_usuarios.Add(Javier());
            lista_usuarios.Add(Zambri());
            return new RepositorioDeUsuariosMock(lista_usuarios);
        }

        public static Funcionalidad FuncionalidadIngresoSacc()
        {
            return new Funcionalidad(1, "ingreso_a_sacc");
        }

        public static Funcionalidad FuncionalidadIngresoModi()
        {
            return new Funcionalidad(2, "ingreso_a_modi");
        }

        public static Funcionalidad FuncionalidadIngresoMenuPrincipal()
        {
            return new Funcionalidad(3, "ingreso_a_menu_principal");
        }
    }
}
