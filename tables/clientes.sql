-- Clientes (antes repetidos en cada pedido). Se identifican por correo.
CREATE TABLE clientes (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nombres     text        NOT NULL,
  apellidos   text        NOT NULL,
  celular     text        NOT NULL,
  correo      citext      NOT NULL UNIQUE,
  created_at  timestamptz NOT NULL DEFAULT now(),
  updated_at  timestamptz NOT NULL DEFAULT now()
);
