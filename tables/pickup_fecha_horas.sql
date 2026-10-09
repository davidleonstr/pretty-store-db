-- Horas disponibles de cada fecha de un punto: FECHA {dia, hora}.
--
-- Ejemplo, punto A:
--   Fecha lunes 2026-10-12   → 10:00, 13:30
--   Fecha martes 2026-10-13  → 16:00, 20:00
CREATE TABLE pickup_fecha_horas (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pickup_fecha_id  uuid     NOT NULL REFERENCES pickup_fechas(id) ON DELETE CASCADE,
  hora_id          smallint NOT NULL REFERENCES horas(id)         ON DELETE RESTRICT,
  is_active        boolean  NOT NULL DEFAULT true,
  UNIQUE (pickup_fecha_id, hora_id)
);
