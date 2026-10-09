<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BajaProducto.aspx.cs" Inherits="BajaProducto" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TiendaGamer - Baja de Producto</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>TiendaGamer</h1>
            <p>Baja de Producto</p>
        </div>

        <div class="contenedor">
            <h2>Eliminar Producto</h2>

            <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="mensaje"></asp:Label>

            <p>Seleccione el producto que desea eliminar de la lista:</p>

            <!-- GridView con los productos disponibles -->
            <asp:GridView ID="GridView1" runat="server"
                DataSourceID="sqlProductos"
                DataKeyNames="idProducto"
                AutoGenerateColumns="False"
                CssClass="gridview-tabla"
                EmptyDataText="No hay productos para eliminar."
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"
                        SelectText="Seleccionar"
                        ControlStyle-CssClass="btn-seleccionar" />
                    <asp:BoundField DataField="idProducto"  HeaderText="ID"        />
                    <asp:BoundField DataField="nombre"      HeaderText="Nombre"    />
                    <asp:BoundField DataField="precio"      HeaderText="Precio ($)" DataFormatString="{0:N2}" />
                    <asp:BoundField DataField="descripcion" HeaderText="Categoria" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="sqlProductos" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                SelectCommand="SELECT p.idProducto, p.nombre, p.precio, c.descripcion
                               FROM   productos p
                               INNER JOIN categorias c ON p.categoria = c.idCategoria
                               ORDER BY p.nombre">
            </asp:SqlDataSource>

            <!-- SqlDataSource para el DELETE -->
            <asp:SqlDataSource ID="sqlEliminar" runat="server"
                ConnectionString="<%$ ConnectionStrings:TiendaGamerDB %>"
                DeleteCommand="DELETE FROM productos WHERE idProducto = @idProducto">
                <DeleteParameters>
                    <asp:Parameter Name="idProducto" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <!-- Panel de confirmacion (oculto hasta seleccionar una fila) -->
            <asp:Panel ID="panelEliminar" runat="server" Visible="false" CssClass="panel-eliminar">
                <p>Producto seleccionado:
                    <strong><asp:Label ID="lblProductoSeleccionado" runat="server"></asp:Label></strong>
                </p>
                <p class="aviso-rojo">Atencion: Esta accion no se puede deshacer.</p>
                <asp:Button ID="btnEliminar" runat="server"
                    Text="Confirmar Eliminacion"
                    OnClick="btnEliminar_Click"
                    CssClass="btn-confirmar"
                    OnClientClick="return confirm('Esta seguro que desea eliminar este producto?');" />
            </asp:Panel>

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
