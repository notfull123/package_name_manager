part of 'app_cubit.dart';

class AppState extends Equatable {
  final TokenEntity? token;
  final UserEntity? user;

  const AppState({
    this.token,
    this.user,
  });

  AppState copyWith({
    TokenEntity? token,
    UserEntity? user,
  }) {
    return AppState(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [token, user];
}
