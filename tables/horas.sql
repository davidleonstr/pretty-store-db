-- Catálogo de horas de retiro (hora local de El Salvador, UTC-6)
-- Se define una vez y se reutiliza en cualquier punto y fecha.
CREATE TABLE horas (
  id    smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  hora  time(0)  NOT NULL UNIQUE          -- ej. '10:00', '13:30', '16:00', '20:00'
);
