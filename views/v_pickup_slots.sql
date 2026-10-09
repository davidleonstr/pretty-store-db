-- Vista de lectura: ubicación, fecha, día y hora ya unidos
CREATE VIEW v_pickup_slots AS
SELECT fh.id         AS slot_id,
       p.id          AS pickup_id,
       p.name        AS pickup_name,
       p.address     AS pickup_address,
       f.id          AS pickup_fecha_id,
       f.fecha       AS fecha,
       d.id          AS dia_id,
       d.nombre      AS dia,
       h.id          AS hora_id,
       h.hora        AS hora,
       (p.is_active AND f.is_active AND fh.is_active) AS disponible
FROM pickup_fecha_horas fh
JOIN pickup_fechas f ON f.id = fh.pickup_fecha_id
JOIN pickups       p ON p.id = f.pickup_id
JOIN dias          d ON d.id = f.dia_id
JOIN horas         h ON h.id = fh.hora_id;
