-- ============================================================
-- Script: CrearTablas.sql
-- Proyecto: TiendaGamer - Alexis Quiroga
-- ============================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TiendaGamer')
BEGIN
    CREATE DATABASE TiendaGamer;
END
GO

USE TiendaGamer;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'categorias')
BEGIN
    CREATE TABLE categorias (
        idCategoria INT PRIMARY KEY IDENTITY(1,1),
        descripcion VARCHAR(100) NOT NULL
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'productos')
BEGIN
    CREATE TABLE productos (
        idProducto INT PRIMARY KEY IDENTITY(1,1),
        nombre     VARCHAR(100) NOT NULL,
        precio     DECIMAL(10,2) NOT NULL,
        categoria  INT NOT NULL,
        CONSTRAINT FK_productos_categorias FOREIGN KEY (categoria)
            REFERENCES categorias(idCategoria)
    );
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM categorias)
BEGIN
    INSERT INTO categorias (descripcion) VALUES ('Perifericos');
    INSERT INTO categorias (descripcion) VALUES ('Monitores');
    INSERT INTO categorias (descripcion) VALUES ('Componentes');
    INSERT INTO categorias (descripcion) VALUES ('Accesorios');
    INSERT INTO categorias (descripcion) VALUES ('Consolas');
END
GO

IF NOT EXISTS (SELECT TOP 1 1 FROM productos)
BEGIN
    INSERT INTO productos (nombre, precio, categoria) VALUES ('Mouse Gamer RGB HyperX', 2500.00, 1);
    INSERT INTO productos (nombre, precio, categoria) VALUES ('Teclado Mecanico Redragon', 4800.00, 1);
    INSERT INTO productos (nombre, precio, categoria) VALUES ('Monitor 24 Full HD LG', 35000.00, 2);
    INSERT INTO productos (nombre, precio, categoria) VALUES ('Placa de Video GTX 1660 Super', 85000.00, 3);
    INSERT INTO productos (nombre, precio, categoria) VALUES ('Auriculares Gamer 7.1 Surround', 8500.00, 4);
    INSERT INTO productos (nombre, precio, categoria) VALUES ('PlayStation 5 Standard', 250000.00, 5);
END
GO
