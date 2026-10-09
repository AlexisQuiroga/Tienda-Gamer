using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ModificacionProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        this.SqlDataSourceProductos.SelectParameters["idProducto"].DefaultValue = this.TextBox1.Text;
        this.SqlDataSourceProductos.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader registros;
        registros = (SqlDataReader)this.SqlDataSourceProductos.Select(DataSourceSelectArguments.Empty);
        if (registros.Read())
        {
            this.txtNombre.Text = registros["nombre"].ToString();
            this.txtPrecio.Text = registros["precio"].ToString();
            ViewState["nomOrig"] = this.txtNombre.Text;
            ViewState["preOrig"] = this.txtPrecio.Text;
            ViewState["catOrig"] = registros["categoria"].ToString();
            this.ddlCategoria.DataSource = this.SqlDataSourceCategorias;
            this.ddlCategoria.DataTextField = "descripcion";
            this.ddlCategoria.DataValueField = "idCategoria";
            this.ddlCategoria.DataBind();
            this.ddlCategoria.SelectedValue = registros["categoria"].ToString();
            this.Label1.Text = "";
        }
        else
            this.Label1.Text = "No existe un producto con dicho codigo";
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        if (ViewState["nomOrig"] == null)
        {
            this.lblMensaje.Text = "Primero debe buscar un producto";
            return;
        }
        bool nombreCambio    = this.txtNombre.Text.Trim() != ViewState["nomOrig"].ToString();
        bool precioCambio    = this.txtPrecio.Text.Trim() != ViewState["preOrig"].ToString();
        bool categoriaCambio = this.ddlCategoria.SelectedValue != ViewState["catOrig"].ToString();
        if (!nombreCambio && !precioCambio && !categoriaCambio)
        {
            this.lblMensaje.Text = "No se realizaron cambios en el producto";
            return;
        }
        this.SqlDataSourceProductos.UpdateParameters["nombre"].DefaultValue    = this.txtNombre.Text.Trim();
        this.SqlDataSourceProductos.UpdateParameters["precio"].DefaultValue    = this.txtPrecio.Text.Trim();
        this.SqlDataSourceProductos.UpdateParameters["categoria"].DefaultValue = this.ddlCategoria.SelectedValue;
        this.SqlDataSourceProductos.UpdateParameters["idProducto"].DefaultValue = this.TextBox1.Text;
        int cant;
        cant = this.SqlDataSourceProductos.Update();
        if (cant == 1)
            this.lblMensaje.Text = "Se modifico el producto correctamente";
        else
            this.lblMensaje.Text = "No existe el codigo ingresado";
    }
}
