CREATE TRIGGER trg_boxes_updated BEFORE UPDATE ON boxes
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();
