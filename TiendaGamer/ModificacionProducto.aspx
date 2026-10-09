<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModificacionProducto.aspx.cs" Inherits="ModificacionProducto" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TiendaGamer - Modificar Producto</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>TiendaGamer</h1>
            <p>Modificacion de Producto</p>
        </div>

        <div class="contenedor">
            <h2>Modificar Producto</h2>

            Ingrese el codigo del producto a buscar:<br />
            <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar"
                OnClick="btnBuscar_Click" CssClass="btn-confirmar" />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>

            <asp:SqlDataSource ID="SqlDataSourceProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                SelectCommand="SELECT idProducto, nombre, precio, categoria FROM productos WHERE idProducto = @idProducto"
                UpdateCommand="UPDATE productos SET nombre=@nombre, precio=@precio, categoria=@categoria WHERE idProducto=@idProducto">
                <SelectParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre"     Type="String"  />
                    <asp:Parameter Name="precio"     Type="Decimal" />
                    <asp:Parameter Name="categoria"  Type="Int32"   />
                    <asp:Parameter Name="idProducto" Type="Int32"   />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />

            <label for="txtNombre">Nombre:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textbox" MaxLength="100"></asp:TextBox>

            <label for="txtPrecio">Precio ($):</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="textbox"></asp:TextBox>

            <label for="ddlCategoria">Categoria:</label>
            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="textbox"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSourceCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion">
            </asp:SqlDataSource>

            <br />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar"
                OnClick="btnModificar_Click" CssClass="btn-confirmar" />
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>

            <br />
            <asp:HyperLink ID="lnkVolver" runat="server"
                NavigateUrl="~/Default.aspx" CssClass="btn-volver">
                &larr; Volver al Inicio
            </asp:HyperLink>
        </div>

        <div class="footer">
            <p>Laboratorio de Programacion 3 &bull; Alexis Quiroga &bull; 2026</p>
        </div>

    </form>
</body>
</html>
