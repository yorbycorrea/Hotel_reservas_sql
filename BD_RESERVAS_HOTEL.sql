CREATE DATABASE Reservas_Hotel;


-- ============================
-- 1. CREACIÓN DE TABLAS
-- ============================

-- Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    documento VARCHAR(15),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

-- Habitaciones
CREATE TABLE habitaciones (
    id_habitacion INT PRIMARY KEY,
    tipo VARCHAR(50), -- Simple, Doble, Suite
    precio_noche DECIMAL(10,2),
    piso INT,
    estado VARCHAR(20) -- Disponible, Ocupado, Mantenimiento
);

-- Reservas
CREATE TABLE reservas (
    id_reserva INT PRIMARY KEY,
    id_cliente INT,
    fecha_ingreso DATE,
    fecha_salida DATE,
    estado VARCHAR(20), -- Activa, Cancelada, Finalizada
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Detalle de reservas
CREATE TABLE detalle_reserva (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_reserva INT,
    id_habitacion INT,
    noches INT,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);

-- Facturas
CREATE TABLE facturas (
    id_factura INT PRIMARY KEY,
    id_reserva INT,
    total DECIMAL(10,2),
    fecha_pago DATE,
    metodo_pago VARCHAR(30),
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);


-- ============================
-- 2. INSERCIÓN DE DATOS DE EJEMPLO
-- ============================

SELECT * FROM detalle_reserva;