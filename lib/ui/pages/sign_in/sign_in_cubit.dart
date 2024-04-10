import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_name_manager/models/entities/index.dart';
import 'package:package_name_manager/repositories/auth_repository.dart';
import 'package:package_name_manager/utils/logger.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  AuthRepository repository;

  SignInCubit({required this.repository}) : super(SignInState());

  void signIn(String username, String password) async {
    emit(state.copyWith(signInStatus: SignInStatus.loading));
    try {
      final result = await repository.signIn(username, password);
      await repository.saveToken(result);
      emit(state.copyWith(signInStatus: SignInStatus.success));
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(signInStatus: SignInStatus.failure));
    }
  }
}
