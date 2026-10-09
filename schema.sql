-- =====================================================================
-- Pretty Store · Esquema PostgreSQL (>= 14)
-- Fuente de verdad de la base de datos. Aplicar DESDE ESTA CARPETA con:
--     psql -d <base_de_datos> -f schema.sql
-- (los \i son relativos al directorio actual)
--
-- Convenciones:
--   * Todos los precios en CENTAVOS de USD (integer), igual que el frontend.
--   * PK uuid (gen_random_uuid) excepto pickups, que usa ids de texto
--     legibles porque el frontend ya los usa así.
--   * Fechas en timestamptz (UTC).
--   * Días (tabla dias, ISO 1 = lunes ... 7 = domingo) y horas (tabla horas)
--     son catálogos. Cada punto tiene fechas concretas (pickup_fechas) y
--     cada fecha tiene sus horas (pickup_fecha_horas).
--     horas.hora y las fechas son hora/fecha LOCAL (El Salvador, UTC-6).
--   * Tabla de administradores en español por requisito: `administradores`.
-- =====================================================================

\set ON_ERROR_STOP on
BEGIN;

-- Extensions
\i extensions/pgcrypto.sql
\i extensions/citext.sql

-- Types
\i types/order_status.sql
\i types/order_kind.sql

-- Functions
\i functions/set_updated_at.sql

-- Tables (en orden de dependencia)
\i tables/administradores.sql
\i tables/images.sql
\i tables/categorias.sql
\i tables/products.sql
\i tables/product_images.sql
\i tables/caja_tipos.sql
\i tables/boxes.sql
\i tables/box_items.sql
\i tables/box_images.sql
\i tables/pickups.sql
\i tables/dias.sql
\i tables/horas.sql
\i tables/pickup_fechas.sql
\i tables/pickup_fecha_horas.sql
\i tables/clientes.sql
\i tables/orders.sql
\i tables/order_items.sql

-- Indexes
\i indexes/categorias/categorias_nombre_uq.sql
\i indexes/products/products_listing_idx.sql
\i indexes/products/products_categoria_idx.sql
\i indexes/product_images/product_images_image_idx.sql
\i indexes/boxes/boxes_listing_idx.sql
\i indexes/boxes/boxes_tipo_idx.sql
\i indexes/box_items/box_items_product_idx.sql
\i indexes/box_images/box_images_image_idx.sql
\i indexes/pickup_fechas/pickup_fechas_fecha_idx.sql
\i indexes/pickup_fechas/pickup_fechas_dia_idx.sql
\i indexes/pickup_fecha_horas/pickup_fecha_horas_hora_idx.sql
\i indexes/orders/orders_status_created_idx.sql
\i indexes/orders/orders_created_idx.sql
\i indexes/orders/orders_cliente_idx.sql
\i indexes/orders/orders_slot_idx.sql
\i indexes/order_items/order_items_order_idx.sql
\i indexes/order_items/order_items_product_idx.sql

-- Triggers
\i triggers/administradores/trg_administradores_updated.sql
\i triggers/products/trg_products_updated.sql
\i triggers/boxes/trg_boxes_updated.sql
\i triggers/pickups/trg_pickups_updated.sql
\i triggers/clientes/trg_clientes_updated.sql
\i triggers/orders/trg_orders_updated.sql

-- Seeds (datos de catálogo)
\i seeds/caja_tipos.sql
\i seeds/dias.sql

-- Views
\i views/v_pickup_slots.sql
\i views/v_pickups_sin_horarios.sql
\i views/v_orders_retiro.sql

COMMIT;
