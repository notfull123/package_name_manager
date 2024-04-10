import 'package:package_name_manager/database/preferences.dart';
import 'package:package_name_manager/models/entities/index.dart';
import 'package:package_name_manager/network/api_client.dart';

abstract class AuthRepository {
  Future<TokenEntity?> getToken();

  Future<void> saveToken(TokenEntity token);

  Future<void> removeToken();

  Future<TokenEntity> signIn(String username, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  late ApiClient _apiClient;

  AuthRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<TokenEntity?> getToken() async {
    final preferences = await Preferences.getInstance();
    return preferences.getToken();
  }

  @override
  Future<void> removeToken() async {
    final preferences = await Preferences.getInstance();
    return preferences.removeToken();
  }

  @override
  Future<void> saveToken(TokenEntity token) async {
    final preferences = await Preferences.getInstance();
    return preferences.setToken(token);
  }

  @override
  Future<TokenEntity> signIn(String username, String password) async {
    //Todo
    await Future.delayed(const Duration(seconds: 2));
    return TokenEntity(token: 'app_token', refreshToken: 'app_refresh_token');
  }
}
