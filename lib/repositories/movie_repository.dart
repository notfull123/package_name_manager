import 'package:package_name_manager/configs/app_config.dart';
import 'package:package_name_manager/models/entities/movie_entity.dart';
import 'package:package_name_manager/models/responses/array_response.dart';
import 'package:package_name_manager/network/api_client.dart';

abstract class MovieRepository {
  Future<ArrayResponse<MovieEntity>> getMovies({required int page});

  Future<MovieEntity> getMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  late ApiClient _apiClient;

  MovieRepositoryImpl(ApiClient client) {
    _apiClient = client;
  }

  @override
  Future<MovieEntity> getMovie(int id) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  @override
  Future<ArrayResponse<MovieEntity>> getMovies({required int page}) async {
    try {
      return _apiClient.getMovies(MovieAPIConfig.APIKey, page);
    } catch (e) {
      rethrow;
    }
  }
}
