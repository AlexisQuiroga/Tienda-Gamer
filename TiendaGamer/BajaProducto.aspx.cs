using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BajaProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string idProducto = this.GridView1.SelectedDataKey.Value.ToString();
        string nombre     = this.GridView1.SelectedRow.Cells[2].Text;
        ViewState["idSeleccionado"]          = idProducto;
        this.lblProductoSeleccionado.Text    = nombre;
        this.panelEliminar.Visible           = true;
        this.lblMensaje.Visible              = false;
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        if (ViewState["idSeleccionado"] == null)
        {
            this.lblMensaje.Text    = "Error: no hay producto seleccionado.";
            this.lblMensaje.CssClass = "mensaje mensaje-error";
            this.lblMensaje.Visible  = true;
            return;
        }

        this.sqlEliminar.DeleteParameters["idProducto"].DefaultValue = ViewState["idSeleccionado"].ToString();
        this.sqlEliminar.Delete();

        this.panelEliminar.Visible = false;
        this.GridView1.DataBind();

        this.lblMensaje.Text    = "Producto eliminado correctamente.";
        this.lblMensaje.CssClass = "mensaje mensaje-ok";
        this.lblMensaje.Visible  = true;
    }
}
