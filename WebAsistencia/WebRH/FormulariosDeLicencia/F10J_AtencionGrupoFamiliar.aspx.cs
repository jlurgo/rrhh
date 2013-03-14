﻿#region

using System;
using System.Web.UI.WebControls;
using WSViaticos;
////using WSWebRH;

#endregion

public partial class FormulariosDeLicencia_Default : System.Web.UI.Page
{
    ConceptoDeLicencia _Concepto;

    #region CargaContenidos

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = Titulo();
        ((Label)this.Master.FindControl("LTitulo")).Text = Titulo();
        ((Label)this.Master.FindControl("LTituloSecundario")).Text = TituloSecundario();

        ((Button)this.Master.FindControl("BAceptar")).Click += new EventHandler(FormulariosDeLicencia_Default_Click);

        _Concepto = new ConceptoDeLicencia();
        _Concepto.Id = 12;

    }

    private string TituloSecundario()
    {
        return "(Decreto 3.413/79 - Anexo I - Cap. III - Art. 10 j)";
    }

    private string Titulo()
    {
        return "Licencia Especial por Atención del grupo familiar";
    } 

    #endregion

    #region LogicaDeEventos

    void FormulariosDeLicencia_Default_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    LicenciaE l = new LicenciaE();
        //    l.Desde = DateTime.Today;
        //    l.Hasta = DateTime.Today;
        //    l.Concepto = _Concepto;
        //    l.Agente = (Persona)Session["persona"];
        //    l.Agente.Area = (Area)Session["areaActual"];
        //    l.Auditoria = new Auditoria();
        //    l.Auditoria.UsuarioDeCarga = (Usuario)Session["usuario"];

        //    WSViaticosSoapClient s = new WSViaticosSoapClient();
        //    string error = s.CargarLicencia(l);
        //    if (error == null)
        //    {
        //        Response.Redirect("~\\Principal.aspx");
        //    }
        //    else
        //    {
        //        ((Label)this.Master.FindControl("LError")).Text = error;
        //    }
        //}
        //catch (Exception)
        //{
        //    Response.Redirect("~\\Principal.aspx");
        //}
    }
    #endregion
}
