using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AltaProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(this.txtNombre.Text.Trim()) || string.IsNullOrEmpty(this.txtPrecio.Text.Trim()))
        {
            this.lblMensaje.Text    = "Error: Todos los campos son obligatorios.";
            this.lblMensaje.CssClass = "mensaje mensaje-error";
            this.lblMensaje.Visible  = true;
            return;
        }

        decimal precio;
        if (!decimal.TryParse(this.txtPrecio.Text.Trim(), out precio) || precio <= 0)
        {
            this.lblMensaje.Text    = "Error: El precio debe ser un numero mayor a 0.";
            this.lblMensaje.CssClass = "mensaje mensaje-error";
            this.lblMensaje.Visible  = true;
            return;
        }

        this.sqlInsertarProducto.InsertParameters["nombre"].DefaultValue    = this.txtNombre.Text.Trim();
        this.sqlInsertarProducto.InsertParameters["precio"].DefaultValue    = precio.ToString(System.Globalization.CultureInfo.InvariantCulture);
        this.sqlInsertarProducto.InsertParameters["categoria"].DefaultValue = this.ddlCategoria.SelectedValue;

        this.sqlInsertarProducto.Insert();

        this.txtNombre.Text = string.Empty;
        this.txtPrecio.Text = string.Empty;

        this.lblMensaje.Text    = "Producto cargado correctamente.";
        this.lblMensaje.CssClass = "mensaje mensaje-ok";
        this.lblMensaje.Visible  = true;
    }
}
