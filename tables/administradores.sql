-- Administradores
CREATE TABLE administradores (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nombre          text        NOT NULL CHECK (char_length(nombre) BETWEEN 1 AND 120),
  correo          citext      NOT NULL UNIQUE,
  password_hash   text        NOT NULL,              -- argon2id (o bcrypt); NUNCA texto plano
  activo          boolean     NOT NULL DEFAULT true,
  ultimo_login_at timestamptz,
  created_at      timestamptz NOT NULL DEFAULT now(),
  updated_at      timestamptz NOT NULL DEFAULT now()
);
