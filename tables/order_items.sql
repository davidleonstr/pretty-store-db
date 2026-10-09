-- Líneas del pedido con snapshot de nombre y precio (el precio del catálogo puede cambiar).
-- Si kind = 'caja' hay una sola línea con box_id; si kind = 'productos', líneas con product_id.
CREATE TABLE order_items (
  id               uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id         uuid    NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id       uuid    REFERENCES products(id) ON DELETE SET NULL,
  box_id           uuid    REFERENCES boxes(id)    ON DELETE SET NULL,
  name             text    NOT NULL,
  unit_price_cents integer NOT NULL CHECK (unit_price_cents >= 0),
  qty              integer NOT NULL CHECK (qty > 0),
  CHECK ((product_id IS NOT NULL)::int + (box_id IS NOT NULL)::int <= 1)
);
