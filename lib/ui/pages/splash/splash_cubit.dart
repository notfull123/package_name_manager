import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_name_manager/models/entities/index.dart';
import 'package:package_name_manager/models/enums/load_status.dart';
import 'package:package_name_manager/repositories/auth_repository.dart';
import 'package:package_name_manager/utils/logger.dart';
import 'package:rxdart/rxdart.dart';

part 'splash_state.dart';

enum SplashNavigator {
  openHome,
  openSignIn,
}

class SplashCubit extends Cubit<SplashState> {
  AuthRepository repository;

  final messageController = PublishSubject<String>();
  final navigatorController = PublishSubject<SplashNavigator>();

  SplashCubit({required this.repository}) : super(const SplashState());

  void checkLogin() async {
    TokenEntity? token = await repository.getToken();
    if (token != null) {
      logger.d('emit LOGGED_OUT');
      emit(state.copyWith(loginState: LoginState.loggedOut));
      navigatorController.sink.add(SplashNavigator.openSignIn);
    } else {
      logger.d('emit LOGGED_IN');
      emit(state.copyWith(loginState: LoginState.loggedIn));
      navigatorController.sink.add(SplashNavigator.openHome);
    }
  }

  void getUser() {}

  void getRemoteConfig() {}

  @override
  Future<void> close() {
    messageController.close();
    navigatorController.close();
    return super.close();
  }
}
