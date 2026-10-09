-- Pedidos (reservas). PK uuid + `code` con el formato que muestra la web.
-- El retiro es UNA relación: pickup_fecha_hora_id (punto + fecha + día + hora).
-- Ubicación, fecha, día y hora se obtienen por JOIN.
CREATE TABLE orders (
  id                    uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  code                  text         NOT NULL UNIQUE CHECK (code ~ '^PS-[A-Z0-9]{6}$'),  -- ej. 'PS-7K2QF9'
  kind                  order_kind   NOT NULL,
  status                order_status NOT NULL DEFAULT 'pendiente',

  cliente_id            uuid NOT NULL REFERENCES clientes(id) ON DELETE RESTRICT,
  nota                  text NOT NULL DEFAULT '' CHECK (char_length(nota) <= 300),

  -- Retiro: relación a la fecha y hora concretas de un punto
  pickup_fecha_hora_id  uuid NOT NULL REFERENCES pickup_fecha_horas(id) ON DELETE RESTRICT,

  total_cents           integer      NOT NULL CHECK (total_cents >= 0),
  delivered_at          timestamptz,
  created_at            timestamptz  NOT NULL DEFAULT now(),
  updated_at            timestamptz  NOT NULL DEFAULT now()
);
