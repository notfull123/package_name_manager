import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:package_name_manager/repositories/auth_repository.dart';
import 'package:package_name_manager/models/enums/load_status.dart';

part 'setting_tab_state.dart';

class SettingTabCubit extends Cubit<SettingTabState> {
  AuthRepository repository;

  SettingTabCubit({required this.repository}) : super(const SettingTabState());

  void signOut() async {
    emit(state.copyWith(signOutStatus: LoadStatus.loading));
    await repository.removeToken();
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(signOutStatus: LoadStatus.success));
  }
}
