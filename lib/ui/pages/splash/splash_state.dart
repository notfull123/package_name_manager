part of 'splash_cubit.dart';

enum LoginState { initial, loggedIn, loggedOut }

class SplashState extends Equatable {
  final LoginState loginState;
  final LoadStatus loadUserStatus;
  final UserEntity? user;
  final LoadStatus loadServerConfigStatus;
  final RemoteConfigEntity? remoteConfig;

  const SplashState({
    this.loginState = LoginState.initial,
    this.loadUserStatus = LoadStatus.initial,
    this.user,
    this.loadServerConfigStatus = LoadStatus.initial,
    this.remoteConfig,
  });

  SplashState copyWith({
    LoginState? loginState,
    LoadStatus? loadUserStatus,
    UserEntity? user,
    LoadStatus? loadServerConfigStatus,
    RemoteConfigEntity? remoteConfig,
  }) {
    return SplashState(
      loginState: loginState ?? this.loginState,
      loadUserStatus: loadUserStatus ?? this.loadUserStatus,
      user: user ?? this.user,
      loadServerConfigStatus:
          loadServerConfigStatus ?? this.loadServerConfigStatus,
      remoteConfig: remoteConfig ?? this.remoteConfig,
    );
  }

  @override
  List<Object?> get props => [
        loginState,
        loadUserStatus,
        user,
        loadServerConfigStatus,
        remoteConfig,
      ];
}
