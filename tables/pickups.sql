-- Puntos de retiro (ubicación)
CREATE TABLE pickups (
  id          text PRIMARY KEY CHECK (id ~ '^[a-z0-9]+(-[a-z0-9]+)*$'),  -- ej. 'entrada-tazumal'
  name        text             NOT NULL,
  address     text             NOT NULL,
  lat         double precision NOT NULL CHECK (lat BETWEEN -90  AND 90),
  lon         double precision NOT NULL CHECK (lon BETWEEN -180 AND 180),
  is_active   boolean          NOT NULL DEFAULT true,
  sort_order  integer          NOT NULL DEFAULT 0,
  created_at  timestamptz      NOT NULL DEFAULT now(),
  updated_at  timestamptz      NOT NULL DEFAULT now()
);
