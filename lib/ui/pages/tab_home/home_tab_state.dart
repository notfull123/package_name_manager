part of 'home_tab_cubit.dart';

class HomeTabState extends Equatable {
  final LoadStatus loadMovieStatus;
  final List<MovieEntity> movies;
  final int page;
  final int totalResults;
  final int totalPages;

  const HomeTabState({
    this.loadMovieStatus = LoadStatus.initial,
    this.movies = const [],
    this.page = 0,
    this.totalResults = 0,
    this.totalPages = 0,
  });

  HomeTabState copyWith({
    LoadStatus? loadMovieStatus,
    List<MovieEntity>? movies,
    int? page,
    int? totalResults,
    int? totalPages,
  }) {
    return HomeTabState(
      loadMovieStatus: loadMovieStatus ?? this.loadMovieStatus,
      movies: movies ?? this.movies,
      page: page ?? this.page,
      totalResults: totalResults ?? this.totalResults,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [
        loadMovieStatus,
        movies,
        page,
        totalResults,
        totalPages,
      ];

  bool get hasReachedMax {
    return page >= totalPages;
  }
}
