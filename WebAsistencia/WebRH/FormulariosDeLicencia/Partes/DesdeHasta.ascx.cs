﻿#region

using System;
using WSViaticos;

#endregion

public partial class FormulariosDeLicencia_Partes_DesdeHasta : System.Web.UI.UserControl
{

    public event EventHandler DesplegoCalendario;
    public event EventHandler CambioFecha;

    public DateTime Desde
    {
        get { return DateTime.Parse(this.TBDesde.Text); }
    }

    public DateTime Hasta
    {
        get { return DateTime.Parse(this.TBHasta.Text); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BCalendarioHasta_Click(object sender, EventArgs e)
    {
        this.Calendar2.Visible = !this.Calendar2.Visible;
        if (this.Calendar1.Visible)
            this.DesplegoCalendario(sender, e);
    }

    protected void BCalendarioDesde_Click(object sender, EventArgs e)
    {
        this.Calendar1.Visible = !this.Calendar1.Visible;
        if (this.Calendar2.Visible)
            this.DesplegoCalendario(sender, e);
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        this.TBDesde.Text = Calendar1.SelectedDate.ToShortDateString();
        this.Calendar1.Visible = false;
        this.CambioFecha(sender, e);
    }

    protected void Calendar2_SelectionChanged(object sender, EventArgs e)
    {
        this.TBHasta.Text = Calendar2.SelectedDate.ToShortDateString();
        this.Calendar2.Visible = false;
        this.CambioFecha(sender, e);
    }

    public bool ValidarFechas()
    {
        if (this.TBDesde.Text == null || this.TBHasta.Text == null)
            return false;

        if (this.TBDesde.Text == "" || this.TBHasta.Text == "")
            return false;

        if (DateTime.Parse(this.TBDesde.Text) <= DateTime.Parse(this.TBHasta.Text))
            return true;
        else
            return false;
    }

    public int DiasEntreFechas()
    {
        if (FechasNoValidas())
        {
            return 0;
        }
        TimeSpan diff = DateTime.Parse(this.TBHasta.Text) - DateTime.Parse(this.TBDesde.Text);
        return diff.Days + 1;
    }

    protected bool FechasNoValidas()
    {
        if (this.TBDesde.Text == null || this.TBHasta.Text == null)
            return true;

        if (this.TBDesde.Text == "" || this.TBHasta.Text == "")
            return true;

        if (this.Desde > this.Hasta)
            return false;
        return false;
    }

    public int DiasHabilesEntreFechas(WSViaticosSoapClient dataProvider)
    {
        if (FechasNoValidas())
        {
            return 0;
        }
        return dataProvider.DiasHabilesEntreFechas(this.Desde, this.Hasta);
    }

    public bool DiasHabilitadosEntreFechas(int concepto)
    {
        if (FechasNoValidas())
        {
            return false;
        }
        var servicio = new WSViaticos.WSViaticosSoapClient();
        return servicio.DiasHabilitadosEntreFechas(DateTime.Parse(this.TBDesde.Text), DateTime.Parse(this.TBHasta.Text), concepto);
    }

    public bool EsAnteriorA(DateTime Fecha)
    {
        if (!ValidarFechas())
            return false;

        if (Fecha < DateTime.Parse(this.TBDesde.Text))
            return false;

        return true;
    }

    public bool EsPosteriorA(DateTime Fecha)
    {
        if (!ValidarFechas())
            return false;

        if (Fecha < DateTime.Parse(this.TBHasta.Text))
            return false;

        return true;
    }


    public bool EstaCargado()
    {
        if (this.TBDesde.Text == null || this.TBHasta.Text == null)
            return false;

        if (this.TBDesde.Text == "" || this.TBHasta.Text == "")
            return false;

        return true;
    }

}