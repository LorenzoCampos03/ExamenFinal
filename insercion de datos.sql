create database ventas;
use  ventas;
CREATE TABLE categoria (
    id int  NOT NULL COMMENT 'identificador de la categoría de producto',
    nombre varchar(50)  NOT NULL COMMENT 'nombre de la categoria',
    descripcion varchar(50)  NOT NULL COMMENT 'descripción de la categoría',
    CONSTRAINT categoria_pk PRIMARY KEY (id)
);

-- Table: cliente
CREATE TABLE cliente (
    DNI int  NOT NULL COMMENT 'Identificador del cliente',
    nombre varchar(50)  NOT NULL COMMENT 'Nombre del cliente ',
    direccion varchar(50)  NOT NULL COMMENT 'dirección del cliente',
    contacto varchar(50)  NOT NULL COMMENT 'contacto del cliente ',
    CONSTRAINT cliente_pk PRIMARY KEY (DNI)
);

-- Table: producto
CREATE TABLE producto (
    id int  NOT NULL COMMENT 'identificador del producto',
    nombre varchar(50)  NOT NULL COMMENT 'nombre del producto',
    precio varchar(50)  NOT NULL COMMENT 'precio del producto',
    stock varchar(50)  NOT NULL COMMENT 'cantidad del producto disponible',
    categoria_id int  NOT NULL COMMENT 'identificador de la categoría de producto',
    proveedor_ruc varchar(11)  NOT NULL,
    CONSTRAINT producto_pk PRIMARY KEY (id)
);

-- Table: proveedor
CREATE TABLE proveedor (
    ruc varchar(11)  NOT NULL COMMENT 'identificador del proveedor',
    nombre varchar(50)  NOT NULL COMMENT 'nombre del proveedor',
    direccion varchar(50)  NOT NULL COMMENT 'direccion del proveedor',
    telefono varchar(50)  NOT NULL COMMENT 'telefono del proveedor',
    pagina_web varchar(80)  NOT NULL COMMENT 'pagina del proveedor',
    CONSTRAINT proveedor_pk PRIMARY KEY (ruc)
);

-- Table: venta_detalle
CREATE TABLE venta_detalle (
    id int  NOT NULL COMMENT 'identificador de la venta',
    fecha timestamp  NOT NULL COMMENT 'fecha de la venta',
    detalle_producto varchar(50)  NOT NULL COMMENT 'detalles de la venta',
    monto varchar(50)  NOT NULL COMMENT 'monto de la venta',
    cliente_DNI int  NOT NULL COMMENT 'Identificador del cliente',
    producto_id int  NOT NULL,
    CONSTRAINT venta_detalle_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: categoria_producto (table: producto)
ALTER TABLE producto ADD CONSTRAINT categoria_producto FOREIGN KEY categoria_producto (categoria_id)
    REFERENCES categoria (id);

-- Reference: cliente_venta (table: venta_detalle)
ALTER TABLE venta_detalle ADD CONSTRAINT cliente_venta FOREIGN KEY cliente_venta (cliente_DNI)
    REFERENCES cliente (DNI);

-- Reference: producto_proveedor (table: producto)
ALTER TABLE producto ADD CONSTRAINT producto_proveedor FOREIGN KEY producto_proveedor (proveedor_ruc)
    REFERENCES proveedor (ruc);

-- Reference: venta_detalle_producto (table: venta_detalle)
ALTER TABLE venta_detalle ADD CONSTRAINT venta_detalle_producto FOREIGN KEY venta_detalle_producto (producto_id)
    REFERENCES producto (id);

INSERT INTO categoria (id, nombre, descripcion) VALUES
(1, 'Electrónica', 'Dispositivos electrónicos'),
(2, 'Ropa', 'Vestimenta para todas las edades'),
(3, 'Hogar', 'Artículos para el hogar'),
(4, 'Juguetes', 'Juguetes para niños de todas las edades'),
(5, 'Libros', 'Libros de todos los géneros');

INSERT INTO cliente (DNI, nombre, direccion, contacto) VALUES
(12345678, 'Juan Perez', 'Av. Siempre Viva 742', 'juan.perez@example.com'),
(87654321, 'Maria Garcia', 'Calle Falsa 123', 'maria.garcia@example.com'),
(11223344, 'Carlos Ramirez', 'Calle Luna 456', 'carlos.ramirez@example.com'),
(44332211, 'Ana Lopez', 'Av. Sol 789', 'ana.lopez@example.com'),
(55667788, 'Luis Martinez', 'Calle Estrella 101', 'luis.martinez@example.com');

INSERT INTO proveedor (ruc, nombre, direccion, telefono, pagina_web) VALUES
('12345678901', 'Proveedor A', 'Av. Principal 123', '123456789', 'www.proveedor1.com'),
('98765432109', 'Proveedor B', 'Calle Secundaria 456', '987654321', 'www.proveedor2.com'),
('11223344556', 'Proveedor C', 'Av. Terciaria 789', '112233445', 'www.proveedor3.com'),
('66554433221', 'Proveedor D', 'Calle Cuarta 101', '665544332', 'www.proveedor4.com'),
('55667788990', 'Proveedor E', 'Av. Quinta 202', '556677889', 'www.proveedor5.com');

INSERT INTO producto (id, nombre, precio, stock, categoria_id, proveedor_ruc) VALUES
(1, 'Televisor', '500.00', '100', 1, '12345678901'),
(2, 'Laptop', '800.00', '50', 1, '98765432109'),
(3, 'Camisa', '20.00', '200', 2, '11223344556'),
(4, 'Sofá', '300.00', '10', 3, '66554433221'),
(5, 'Libro de cocina', '15.00', '150', 5, '55667788990');

-- Insertar datos en la tabla venta_detalle
INSERT INTO venta_detalle (id, fecha, detalle_producto, monto, cliente_DNI, producto_id) VALUES
(1, '2024-07-04 10:30:00', 'Venta de televisor', '500.00', 12345678, 1),
(2, '2024-07-04 11:00:00', 'Venta de laptop', '800.00', 87654321, 2),
(3, '2024-07-04 12:00:00', 'Venta de camisa', '20.00', 11223344, 3),
(4, '2024-07-04 13:00:00', 'Venta de sofá', '300.00', 44332211, 4),
(5, '2024-07-04 14:00:00', 'Venta de libro de cocina', '15.00', 55667788, 5);

select * from categoria;
select * from cliente;
select * from proveedor;
select * from producto;
select * from venta_detalle;



