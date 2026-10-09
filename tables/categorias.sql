-- Categorías de productos (antes texto libre en products.tag)
CREATE TABLE categorias (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre      text    NOT NULL CHECK (char_length(nombre) BETWEEN 1 AND 60),
  sort_order  integer NOT NULL DEFAULT 0
);
