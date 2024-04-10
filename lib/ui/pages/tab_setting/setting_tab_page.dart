import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/models/enums/load_status.dart';
import 'package:package_name_manager/repositories/auth_repository.dart';
import 'package:package_name_manager/router/application.dart';
import 'package:package_name_manager/router/routers.dart';
import 'package:package_name_manager/ui/components/app_button.dart';
import 'package:package_name_manager/ui/pages/tab_setting/setting_tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingTabPage extends StatefulWidget {
  const SettingTabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SettingTabPageState();
  }
}

class _SettingTabPageState extends State<SettingTabPage> {
  late SettingTabCubit _cubit;

  @override
  void initState() {
    final repository = RepositoryProvider.of<AuthRepository>(context);
    _cubit = SettingTabCubit(repository: repository);
    super.initState();
    _cubit.stream.listen((state) {
      if (state.signOutStatus == LoadStatus.success) {
        _onSignOutSuccess();
      }
    });
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: Center(
        child: Center(
          child: buildSignOutButton(),
        ),
      ),
    );
  }

  Widget buildSignOutButton() {
    return BlocBuilder<SettingTabCubit, SettingTabState>(
      bloc: _cubit,
      buildWhen: (prev, current) {
        return prev.signOutStatus != current.signOutStatus;
      },
      builder: (context, state) {
        final isLoading = state.signOutStatus == LoadStatus.loading;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: AppTintButton(
            title: 'Logout',
            isLoading: isLoading,
            onPressed: isLoading ? null : _handleSignOut,
          ),
        );
      },
    );
  }

  void _handleSignOut() {
    _cubit.signOut();
  }

  void _onSignOutSuccess() {
    Application.router.navigateTo(context, Routes.root, clearStack: true);
  }
}
