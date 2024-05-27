CREATE DATABASE ventas_automotrices;

USE ventas_automotrices;

CREATE TABLE Usuario (
    CUI INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Tipo ENUM('cliente', 'administrador')
);

CREATE TABLE Producto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2)
);

CREATE TABLE Venta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Usuario(CUI)
);

CREATE TABLE DetalleVenta (
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT,
    Precio_unitario DECIMAL(10, 2),
    PRIMARY KEY (ID_Venta, ID_Producto),
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID)
);

-- INSERTS
INSERT INTO Usuario (CUI, Nombre, Direccion, Telefono, Tipo) VALUES
(123456789, 'Juan Perez', 'Zona 13', '1234 5678', 'cliente'),
(987654321, 'Maria Lopez', 'Zona 1', '9876 5432', 'cliente'),
(111111111, 'Admin', 'Mixco', '9999 9999', 'administrador');

INSERT INTO Producto (Nombre, Precio) VALUES
('Llantas', 200),
('Aceite de motor', 50),
('Batería', 150);

INSERT INTO Venta (Fecha, ID_Cliente) VALUES
('2020-01-05', 123456789),
('2020-02-15', 987654321),
('2020-03-20', 123456789),
('2020-04-10', 987654321);

INSERT INTO DetalleVenta (ID_Venta, ID_Producto, Cantidad, Precio_unitario) VALUES
(1, 1, 4, 200),
(2, 2, 2, 50),
(3, 3, 1, 150),
(4, 1, 2, 200);


-- a. El cliente con más compras en el año 2020 y el total que se le facturó.
SELECT u.nombre AS nombre_cliente, COUNT(*) AS total_compras, SUM(dv.precio_unitario * dv.cantidad) AS total_facturado
FROM Usuario u
JOIN Venta v ON u.CUI = v.ID_Cliente
JOIN DetalleVenta dv ON v.ID = dv.ID_Venta
WHERE v.Fecha >= '2020-01-01' AND v.Fecha <= '2020-12-31'
GROUP BY u.nombre
ORDER BY total_compras DESC
LIMIT 1;

-- b. El top 10 de productos menos vendidos en el mes de febrero del 2020.
SELECT p.Nombre AS nombre_producto, COALESCE(SUM(dv.Cantidad), 0) AS total_vendido
FROM Producto p
LEFT JOIN DetalleVenta dv ON p.ID = dv.ID_Producto
LEFT JOIN Venta v ON dv.ID_Venta = v.ID
WHERE v.Fecha >= '2020-02-01' AND v.Fecha <= '2020-02-28'
GROUP BY p.Nombre
ORDER BY total_vendido
LIMIT 10;