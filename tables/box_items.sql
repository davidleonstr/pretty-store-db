-- Contenido de cada caja. Un producto en uso NO se puede borrar (RESTRICT);
-- para retirarlo se desactiva con is_active = false.
CREATE TABLE box_items (
  box_id     uuid     NOT NULL REFERENCES boxes(id)    ON DELETE CASCADE,
  product_id uuid     NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
  qty        integer  NOT NULL DEFAULT 1 CHECK (qty > 0),
  position   smallint NOT NULL DEFAULT 0 CHECK (position >= 0),
  PRIMARY KEY (box_id, product_id)
);
