import 'package:dio/dio.dart';
import 'package:package_name_manager/configs/app_config.dart';
import 'package:retrofit/retrofit.dart';

part 'amazon_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class AmazonClient {
  factory AmazonClient(Dio dio, {String baseUrl}) = _AmazonClient;

  /// Update avatar
  @POST("/avatar")
  Future<void> uploadAvatar();
}
