-- Cajas
CREATE TABLE boxes (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  slug         text        NOT NULL UNIQUE CHECK (slug ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),
  name         text        NOT NULL CHECK (char_length(name) BETWEEN 1 AND 120),
  emoji        text        NOT NULL DEFAULT '',
  price_cents  integer     NOT NULL CHECK (price_cents > 0),
  tipo_id      smallint    NOT NULL REFERENCES caja_tipos(id) ON DELETE RESTRICT,
  short        text        NOT NULL DEFAULT '',       -- frase corta para la tarjeta
  description  text        NOT NULL DEFAULT '',
  is_active    boolean     NOT NULL DEFAULT true,
  sort_order   integer     NOT NULL DEFAULT 0,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now()
);
