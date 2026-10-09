-- Vista de lectura: pedido con ubicación, fecha, día y hora ya unidos
CREATE VIEW v_orders_retiro AS
SELECT o.*,
       c.nombres,
       c.apellidos,
       c.celular,
       c.correo,
       s.pickup_id,
       s.pickup_name,
       s.pickup_address,
       s.fecha AS fecha_retiro,
       s.dia,
       s.hora
FROM orders o
JOIN clientes        c ON c.id = o.cliente_id
JOIN v_pickup_slots s ON s.slot_id = o.pickup_fecha_hora_id;
