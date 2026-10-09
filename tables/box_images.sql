CREATE TABLE box_images (
  box_id   uuid     NOT NULL REFERENCES boxes(id)  ON DELETE CASCADE,
  image_id uuid     NOT NULL REFERENCES images(id) ON DELETE RESTRICT,
  position smallint NOT NULL DEFAULT 0 CHECK (position >= 0),
  PRIMARY KEY (box_id, image_id),
  UNIQUE (box_id, position) DEFERRABLE INITIALLY DEFERRED
);
