﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace General.Repositorios
{
    public class TipoCredencial
    {
        public int Id;
        public string Descripcion;
        public TipoCredencial()
        {

        }

        public TipoCredencial(int id, string desc)
        {
            this.Id = id;
            this.Descripcion = desc;
        }
    }
}
