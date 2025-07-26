-- Habitaciones disponibles
SELECT * FROM habitaciones WHERE estado='Disponible';

--Clientes con mas de una reserva

SELECT c.nombre, COUNT(r.id_reserva) AS cantidad_reservas
FROM clientes c
JOIN reservas r ON c.id_cliente = r.id_cliente
GROUP BY c.nombre
HAVING COUNT(r.id_reserva) > 1;

-- Historial de reservas
SELECT r.id_reserva, c.nombre, h.id_habitacion, r.fecha_ingreso, r.fecha_salida
FROM reservas r
JOIN clientes c ON r.id_cliente = c.id_cliente
JOIN detalle_reserva d ON r.id_reserva = d.id_reserva
JOIN habitaciones h ON d.id_habitacion = h.id_habitacion;

--Total pagado por cliente 
SELECT c.nombre, SUM(f.total) AS total_pagado
FROM clientes c
JOIN reservas r ON c.id_cliente = r.id_cliente
JOIN facturas f ON r.id_reserva = f.id_reserva
GROUP BY c.nombre;

--Habitaciones mas reservadas

SELECT h.id_habitacion, COUNT(*) AS veces_reservada
FROM detalle_reserva d
JOIN habitaciones h ON d.id_habitacion = h.id_habitacion
GROUP BY h.id_habitacion
ORDER BY veces_reservada DESC;


