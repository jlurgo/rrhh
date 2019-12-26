﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General.MAU
{
    public class MAU_Perfil
    {
        public string Nombre { get; set; }
        public int Id { get; set; }
        public List<Funcionalidad> Funcionalidades { get; set; }
        public DateTime FechaDesde { get; set; }
        public List<Area> Areas { get; set; }


        public MAU_Perfil()
        {

        }
        public MAU_Perfil(int id, string nombre)
        {
            this.Id = id;
            this.Nombre = nombre;
            this.Areas = new List<Area>();
            this.Funcionalidades = new List<Funcionalidad>();

        }

       
    }
}