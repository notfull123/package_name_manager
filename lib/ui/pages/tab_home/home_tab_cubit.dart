import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_name_manager/models/entities/movie_entity.dart';
import 'package:package_name_manager/models/enums/load_status.dart';
import 'package:package_name_manager/repositories/movie_repository.dart';
import 'package:package_name_manager/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  MovieRepository repository;
  final messageController = PublishSubject<String>();

  HomeTabCubit({required this.repository}) : super(HomeTabState());

  void fetchInitialMovies() async {
    emit(state.copyWith(loadMovieStatus: LoadStatus.loading));
    try {
      final result = await repository.getMovies(page: 1);
      emit(state.copyWith(
        loadMovieStatus: LoadStatus.success,
        movies: result.results,
        page: result.page,
        totalPages: result.totalPages,
      ));
      messageController.sink.add("Success");
    } catch (e) {
      emit(state.copyWith(loadMovieStatus: LoadStatus.failure));
      messageController.sink.add("Failure");
      logger.e(e);
    }
  }

  void fetchNextMovies() async {
    if (state.page == state.totalPages) {
      return;
    }
    if (state.loadMovieStatus != LoadStatus.success) {
      return;
    }
    emit(state.copyWith(loadMovieStatus: LoadStatus.loadingMore));
    try {
      final result = await repository.getMovies(page: state.page + 1);
      emit(state.copyWith(
        loadMovieStatus: LoadStatus.success,
        movies: state.movies + result.results,
        page: result.page,
        totalPages: result.totalPages,
      ));
    } catch (e) {
      emit(state.copyWith(loadMovieStatus: LoadStatus.success));
      logger.e(e);
    }
  }

  @override
  Future<void> close() {
    messageController.close();
    return super.close();
  }
}
