import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_name_manager/models/entities/token_entity.dart';
import 'package:package_name_manager/models/entities/user_entity.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  void getData() {

  }

  // void updateToken(TokenEntity token) {
  //   emit(state.copyWith(token: token));
  // }
  //
  // void updateUser(TokenEntity token) {
  //   emit(state.copyWith(token: token));
  // }
}
