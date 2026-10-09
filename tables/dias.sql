-- Catálogo de días de la semana (ISO: 1 = lunes ... 7 = domingo)
CREATE TABLE dias (
  id      smallint PRIMARY KEY CHECK (id BETWEEN 1 AND 7),
  nombre  text     NOT NULL UNIQUE
);
