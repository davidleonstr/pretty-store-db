-- Auditoría: puntos activos que NO tienen ninguna fecha/hora disponible
CREATE VIEW v_pickups_sin_horarios AS
SELECT p.id, p.name
FROM pickups p
WHERE p.is_active
  AND NOT EXISTS (
    SELECT 1
    FROM pickup_fechas f
    JOIN pickup_fecha_horas fh ON fh.pickup_fecha_id = f.id AND fh.is_active
    WHERE f.pickup_id = p.id AND f.is_active
  );
