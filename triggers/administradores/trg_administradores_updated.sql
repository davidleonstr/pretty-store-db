CREATE TRIGGER trg_administradores_updated BEFORE UPDATE ON administradores
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
