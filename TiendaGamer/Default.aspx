<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TiendaGamer - Inicio</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="header">
            <h1>TiendaGamer</h1>
            <p>Sistema de Gestion de Productos</p>
        </div>

        <div class="contenedor">
            <h2>Menu Principal</h2>
            <p>Seleccione una opcion:</p>

            <div class="menu-nav">
                <asp:HyperLink ID="lnkAlta" runat="server"
                    NavigateUrl="~/AltaProducto.aspx"
                    CssClass="btn-menu">
                    Alta de Producto
                </asp:HyperLink>

                <asp:HyperLink ID="lnkConsulta" runat="server"
                    NavigateUrl="~/ConsultaProductos.aspx"
                    CssClass="btn-menu">
                    Consultar Productos
                </asp:HyperLink>

                <asp:HyperLink ID="lnkModificacion" runat="server"
                    NavigateUrl="~/ModificacionProducto.aspx"
                    CssClass="btn-menu">
                    Modificar Producto
                </asp:HyperLink>

                <asp:HyperLink ID="lnkBaja" runat="server"
                    NavigateUrl="~/BajaProducto.aspx"
                    CssClass="btn-menu">
                    Baja de Producto
                </asp:HyperLink>
            </div>
        </div>

        <div class="footer">
            <p>Laboratorio de Programacion 3 &bull; Alexis Quiroga &bull; 2026</p>
        </div>

    </form>
</body>
</html>
