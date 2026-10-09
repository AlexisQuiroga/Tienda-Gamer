<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaProducto.aspx.cs" Inherits="AltaProducto" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TiendaGamer - Alta de Producto</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>TiendaGamer</h1>
            <p>Alta de Producto</p>
        </div>

        <div class="contenedor">
            <h2>Cargar Nuevo Producto</h2>

            <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="mensaje"></asp:Label>

            <label for="txtNombre">Nombre del Producto:</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="textbox" MaxLength="100"></asp:TextBox>

            <label for="txtPrecio">Precio ($):</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="textbox" placeholder="Ej: 1500.00"></asp:TextBox>

            <label for="ddlCategoria">Categoria:</label>
            <asp:DropDownList ID="ddlCategoria" runat="server"
                DataSourceID="sqlCategorias"
                DataTextField="descripcion"
                DataValueField="idCategoria"
                CssClass="textbox">
            </asp:DropDownList>

            <!-- SqlDataSource para cargar las categorias -->
            <asp:SqlDataSource ID="sqlCategorias" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                SelectCommand="SELECT idCategoria, descripcion FROM categorias ORDER BY descripcion">
            </asp:SqlDataSource>

            <!-- SqlDataSource para insertar el nuevo producto -->
            <asp:SqlDataSource ID="sqlInsertarProducto" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                InsertCommand="INSERT INTO productos (nombre, precio, categoria) VALUES (@nombre, @precio, @categoria)">
                <InsertParameters>
                    <asp:Parameter Name="nombre"    Type="String"  />
                    <asp:Parameter Name="precio"    Type="Decimal" />
                    <asp:Parameter Name="categoria" Type="Int32"   />
                </InsertParameters>
            </asp:SqlDataSource>

            <br />
            <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar"
                OnClick="btnConfirmar_Click" CssClass="btn-confirmar" />

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
