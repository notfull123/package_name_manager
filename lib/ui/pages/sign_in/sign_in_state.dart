part of 'sign_in_cubit.dart';

enum SignInStatus {
  initial,
  loading,
  success,
  failure,
  usernamePasswordInvalid,
}

class SignInState extends Equatable {
  final TokenEntity? token;
  final SignInStatus signInStatus;

  const SignInState({
    this.token,
    this.signInStatus = SignInStatus.initial,
  });

  SignInState copyWith({
    TokenEntity? token,
    SignInStatus? signInStatus,
  }) {
    return SignInState(
      token: token ?? this.token,
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }

  @override
  List<Object?> get props => [token, signInStatus];
}
