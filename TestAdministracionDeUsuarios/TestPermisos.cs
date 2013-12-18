﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using AdministracionDeUsuarios;
using General;

namespace TestAdministracionDeUsuarios
{
    [TestClass]
    public class TestPermisos
    {
        [TestMethod]
        public void jorge_deberia_poder_loguearse_si_ingresa_bien_su_clave()
        {
            Assert.IsTrue(TestObjectsMau.Autorizador().Login("jorge", "trespuntouno"));
        }

        [TestMethod]
        public void jorge_no_deberia_poder_loguearse_si_ingresa_mal_su_clave()
        {
            Assert.IsFalse(TestObjectsMau.Autorizador().Login("jorge", "blabla"));
        }

        [TestMethod]
        public void jorge_no_deberia_poder_loguearse_si_ingresa_mal_su_nombre_de_usuario()
        {
            Assert.IsFalse(TestObjectsMau.Autorizador().Login("jorgelintriple", "trespuntouno"));
        }

        [TestMethod]
        public void jorge_deberia_tener_permisos_para_ingresar_a_sacc()
        {
            Assert.IsTrue(TestObjectsMau.Autorizador().PuedeAcceder(TestObjectsMau.Jorge(), TestObjectsMau.FuncionalidadIngresoSacc()));
        }

        [TestMethod]
        public void jorge_no_deberia_tener_permisos_para_ingresar_a_modi()
        {
            Assert.IsFalse(TestObjectsMau.Autorizador().PuedeAcceder(TestObjectsMau.Jorge(), TestObjectsMau.FuncionalidadIngresoModi()));
        }

        [TestMethod]
        public void deberia_poder_darle_permisos_a_jorge_para_ingresar_a_modi()
        {
            var autorizador = TestObjectsMau.Autorizador();
            autorizador.ConcederPermisoA(TestObjectsMau.Jorge(), TestObjectsMau.FuncionalidadIngresoModi());
            Assert.IsTrue(autorizador.PuedeAcceder(TestObjectsMau.Jorge(), TestObjectsMau.FuncionalidadIngresoModi()));
        }

        [TestMethod]
        public void javier_no_deberia_tener_permisos_para_ingresar_a_sacc()
        {
            Assert.IsFalse(TestObjectsMau.Autorizador().PuedeAcceder(TestObjectsMau.Javier(), TestObjectsMau.FuncionalidadIngresoModi()));
        }

        [TestMethod]
        public void deberia_poder_darle_permisos_a_javier_para_ingresar_a_sacc()
        {
            var autorizador = TestObjectsMau.Autorizador();
            autorizador.ConcederPermisoA(TestObjectsMau.Javier(), TestObjectsMau.FuncionalidadIngresoSacc());
            Assert.IsTrue(autorizador.PuedeAcceder(TestObjectsMau.Javier(), TestObjectsMau.FuncionalidadIngresoSacc()));
        }

        [TestMethod]
        public void deberia_poder_obtener_el_menu_principal_para_jorge()
        {
            var autorizador = TestObjectsMau.Autorizador();
            var links = autorizador.EnlacesMenu("PRINCIPAL", TestObjectsMau.Jorge());

        }
    }
}
