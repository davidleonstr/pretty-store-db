-- Fechas de retiro por ubicación: UBICACIÓN + FECHA CONCRETA (+ su día).
-- Una fila = "el punto X entrega el día 2026-10-12 (lunes)".
-- El día debe ser el que corresponde a la fecha (lo verifica el CHECK),
-- así no puede existir "lunes 14 de octubre" si ese día es miércoles.
CREATE TABLE pickup_fechas (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pickup_id   text     NOT NULL REFERENCES pickups(id) ON DELETE CASCADE,
  fecha       date     NOT NULL,
  dia_id      smallint NOT NULL REFERENCES dias(id) ON DELETE RESTRICT,
  is_active   boolean  NOT NULL DEFAULT true,
  sort_order  integer  NOT NULL DEFAULT 0,
  UNIQUE (pickup_id, fecha),                                   -- una sola fila por punto y fecha
  CHECK (extract(isodow FROM fecha) = dia_id)                  -- fecha y día coinciden
);
