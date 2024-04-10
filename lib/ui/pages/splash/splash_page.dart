import 'dart:async';

import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/repositories/auth_repository.dart';
import 'package:package_name_manager/router/application.dart';
import 'package:package_name_manager/router/routers.dart';
import 'package:package_name_manager/ui/pages/splash/splash_cubit.dart';
import 'package:package_name_manager/ui/widgets/loading_indicator_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit _cubit;
  late StreamSubscription _navigationSubscription;

  @override
  void initState() {
    final authRepository = RepositoryProvider.of<AuthRepository>(context);
    _cubit = SplashCubit(repository: authRepository);
    super.initState();
    _navigationSubscription = _cubit.navigatorController.stream.listen((event) {
      switch (event) {
        case SplashNavigator.openHome:
          showHome();
          break;
        case SplashNavigator.openSignIn:
          showSignIn();
          break;
      }
    });
    _cubit.checkLogin();
  }

  @override
  void dispose() {
    _navigationSubscription.cancel();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.main,
      body: Center(
        child: LoadingIndicatorWidget(color: Colors.white),
      ),
    );
  }

  ///Navigate
  void showSignIn() async {
    await Application.router.navigateTo(context, Routes.signIn);
    _cubit.checkLogin();
  }

  void showHome() {
    Application.router.navigateTo(context, Routes.home);
  }
}
