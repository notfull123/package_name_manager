part of 'setting_tab_cubit.dart';

class SettingTabState extends Equatable {
  final LoadStatus signOutStatus;

  const SettingTabState({
    this.signOutStatus = LoadStatus.initial,
  });

  SettingTabState copyWith({
    LoadStatus? signOutStatus,
  }) {
    return SettingTabState(
      signOutStatus: signOutStatus ?? this.signOutStatus,
    );
  }

  @override
  List<Object> get props => [signOutStatus];
}
