CREATE TRIGGER trg_pickups_updated BEFORE UPDATE ON pickups
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
