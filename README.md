# Pretty Store - Base de datos

PostgreSQL 14+.

```bash
createdb pretty_store
cd pretty-store-db
psql -d pretty_store -f schema.sql
```

Ejecuta siempre desde esta carpeta: los `\i` de `schema.sql` son rutas relativas.
Todo corre en una sola transacción; si algo falla, no queda nada a medias.

| Carpeta | Contenido |
|---|---|
| `extensions/` | pgcrypto, citext |
| `types/` | enums (`order_status`, `order_kind`) |
| `functions/` | funciones (`set_updated_at`) |
| `tables/` | una tabla por archivo |
| `indexes/<tabla>/` | un índice por archivo |
| `triggers/<tabla>/` | un trigger por archivo |
| `seeds/` | datos de catálogo (`dias`, `caja_tipos`) |
| `views/` | vistas de lectura |

Para agregar algo nuevo: crea el archivo en su carpeta y añade su `\i` en `schema.sql`.
