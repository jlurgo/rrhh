﻿namespace General
{

    using System;
    using System.Collections.Generic;
    using System.Text;

    public class Auditoria
    {
        private Usuario _UsuarioDeCarga;
        public Usuario UsuarioDeCarga
        {
            get { return _UsuarioDeCarga; }
            set { _UsuarioDeCarga = value;  }
        }
    }
}
