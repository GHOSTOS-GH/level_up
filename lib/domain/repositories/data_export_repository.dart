abstract class DataExportRepository {
  Future<String> exportToJson();
  Future<void> importFromJson(String jsonContent);
}
