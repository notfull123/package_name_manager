import 'package:package_name_manager/network/api_client.dart';

abstract class SettingRepository {
  Future<void> getSettings();
}

class SettingRepositoryImpl extends SettingRepository {
  late ApiClient _apiClient;

  SettingRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<void> getSettings() async {
    try {
      return await _apiClient.getSetting();
    } catch (error) {
      rethrow;
    }
  }
}
