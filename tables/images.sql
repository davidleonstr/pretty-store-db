-- Imágenes (subidas y alojadas por la propia web)
-- El archivo físico vive en UPLOAD_DIR/<storage_key>; la URL pública se
-- calcula como  <MEDIA_BASE_URL>/<storage_key>  (no se guarda).
CREATE TABLE images (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  storage_key   text        NOT NULL UNIQUE,          -- ej. '3f2a...c1.webp'
  original_name text,
  mime_type     text        NOT NULL CHECK (mime_type IN ('image/jpeg','image/png','image/webp','image/gif')),
  size_bytes    integer     NOT NULL CHECK (size_bytes > 0),
  width         integer,
  height        integer,
  alt_text      text        NOT NULL DEFAULT '',
  uploaded_by   uuid        REFERENCES administradores(id) ON DELETE SET NULL,
  created_at    timestamptz NOT NULL DEFAULT now()
);
