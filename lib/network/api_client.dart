import 'package:dio/dio.dart';
import 'package:package_name_manager/configs/app_config.dart';
import 'package:package_name_manager/models/entities/movie_entity.dart';
import 'package:package_name_manager/models/responses/array_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfig.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///Setting
  @GET("/settings")
  Future<void> getSetting();

  ///Auth

  /// Movie
  @GET("/discover/movie")
  Future<ArrayResponse<MovieEntity>> getMovies(@Query('api_key') String apiKey, @Query('page') int page);
}
