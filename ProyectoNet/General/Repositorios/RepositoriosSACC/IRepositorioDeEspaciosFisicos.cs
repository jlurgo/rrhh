﻿using System;
using General.MAU;
namespace General.Repositorios
{
   public interface IRepositorioDeEspaciosFisicos
    {
        void ActualizarEspacioFisico(General.EspacioFisico espacio_fisico, Usuario usuario);
        bool EspacioFisicoAsignadoACurso(General.EspacioFisico un_espacio_fisico);
        System.Collections.Generic.List<General.Edificio> GetEdificios();
        General.EspacioFisico GetEspacioFisicoById(int id);
        System.Collections.Generic.List<General.EspacioFisico> GetEspaciosFisicos();
        General.EspacioFisico GuardarEspaciosFisicos(General.EspacioFisico espacio_fisico, Usuario usuario);
        General.EspacioFisico ModificarEspacioFisico(General.EspacioFisico espacio_fisico, Usuario usuario);
        void QuitarEspacioFisico(General.EspacioFisico espacio_fisico, Usuario usuario);
    }
}
