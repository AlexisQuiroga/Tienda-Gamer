<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConsultaProductos.aspx.cs" Inherits="ConsultaProductos" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TiendaGamer - Consulta de Productos</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>TiendaGamer</h1>
            <p>Consulta de Productos</p>
        </div>

        <div class="contenedor">
            <h2>Listado de Productos</h2>

            <!-- GridView con JOIN entre productos y categorias -->
            <asp:GridView ID="GridView1" runat="server"
                DataSourceID="sqlProductos"
                AutoGenerateColumns="False"
                CssClass="gridview-tabla"
                EmptyDataText="No hay productos registrados.">
                <Columns>
                    <asp:BoundField DataField="idProducto" HeaderText="ID"         />
                    <asp:BoundField DataField="nombre"     HeaderText="Nombre"     />
                    <asp:BoundField DataField="precio"     HeaderText="Precio ($)" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="descripcion" HeaderText="Categoria" />
                </Columns>
            </asp:GridView>

            <!-- SqlDataSource con consulta JOIN -->
            <asp:SqlDataSource ID="sqlProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion
                               FROM   productos p
                               INNER JOIN categorias c ON p.categoria = c.idCategoria
                               ORDER BY p.nombre">
            </asp:SqlDataSource>

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
