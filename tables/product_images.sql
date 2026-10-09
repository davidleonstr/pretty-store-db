-- Galería del producto (position 0 = foto principal)
CREATE TABLE product_images (
  product_id uuid     NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  image_id   uuid     NOT NULL REFERENCES images(id)   ON DELETE RESTRICT,
  position   smallint NOT NULL DEFAULT 0 CHECK (position >= 0),
  PRIMARY KEY (product_id, image_id),
  UNIQUE (product_id, position) DEFERRABLE INITIALLY DEFERRED
);
