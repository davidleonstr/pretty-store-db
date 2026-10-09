-- Productos
CREATE TABLE products (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug         text        NOT NULL UNIQUE CHECK (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  name         text        NOT NULL CHECK (char_length(name) BETWEEN 1 AND 120),
  emoji        text        NOT NULL DEFAULT '',     -- ilustración de respaldo si no hay imágenes
  price_cents  integer     NOT NULL CHECK (price_cents > 0),
  categoria_id uuid        NOT NULL REFERENCES categorias(id) ON DELETE RESTRICT,  -- Cuidado, Dormir, Aroma, ...
  description  text        NOT NULL DEFAULT '',
  stock        integer     NOT NULL DEFAULT 0 CHECK (stock >= 0),  -- agotado <=> stock = 0
  is_active    boolean     NOT NULL DEFAULT true,     -- false = oculto en la tienda
  sort_order   integer     NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);
