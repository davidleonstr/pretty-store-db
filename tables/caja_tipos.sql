-- Tipos de caja (antes CHECK de texto en boxes.tag)
CREATE TABLE caja_tipos (
  id      smallint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre  text NOT NULL UNIQUE
);
