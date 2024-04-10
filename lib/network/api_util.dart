import 'package:dio/dio.dart';
import 'package:package_name_manager/configs/app_config.dart';
import 'package:package_name_manager/network/amazon_client.dart';
import 'package:package_name_manager/network/api_client.dart';

import 'api_interceptors.dart';

class ApiUtil {
  static ApiClient getApiClient() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.interceptors.add(ApiInterceptors());
    final apiClient = ApiClient(dio, baseUrl: AppConfig.baseUrl);
    return apiClient;
  }

  static AmazonClient getAmazonClient() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(milliseconds: 60000);
    dio.interceptors.add(ApiInterceptors());
    final apiClient = AmazonClient(dio, baseUrl: AppConfig.baseUrl);
    return apiClient;
  }
}
