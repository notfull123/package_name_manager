import 'package:flutter/material.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/ui/pages/home/home_cubit.dart';
import 'package:package_name_manager/ui/pages/tab_home/home_tab_page.dart';
import 'package:package_name_manager/ui/pages/tab_notification/notification_tab_page.dart';
import 'package:package_name_manager/ui/pages/tab_setting/setting_tab_page.dart';
import 'package:package_name_manager/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0, keepPage: true);

  final tabs = [Tabs.home, Tabs.notification, /*Tabs.setting*/];

  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = HomeCubit();
    super.initState();
    _cubit.stream.listen((state) {
      logger.d('Change tab1 ${state.currentTabIndex}');
      _pageController.jumpToPage(state.currentTabIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageView() {
    return PageView(
      // physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: tabs.map((e) => e.page).toList(),
      onPageChanged: (index) {
        _cubit.changeTab(index);
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      buildWhen: (prev, current) {
        return prev.currentTabIndex != current.currentTabIndex;
      },
      builder: (context, state) {
        return Theme(
          data: ThemeData(),
          child: BottomNavigationBar(
            currentIndex: state.currentTabIndex,
            unselectedItemColor: Colors.black54,
            selectedItemColor: AppColors.main,
            items: tabs.map((e) => e.tab).toList(),
            onTap: (index) {
              _cubit.changeTab(index);
            },
          ),
        );
      },
    );
  }
}

enum Tabs {
  home,
  notification,
  // setting,
}

extension TabsExtension on Tabs {
  Widget get page {
    switch (this) {
      case Tabs.home:
        return const HomeTabPage();
      case Tabs.notification:
        return const NotificationTabPage();
      // case Tabs.setting:
      //   return const SettingTabPage();
    }
  }

  BottomNavigationBarItem get tab {
    switch (this) {
      case Tabs.home:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.download), label: 'Installed App');
      case Tabs.notification:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: 'System App');
      // case Tabs.setting:
      //   return const BottomNavigationBarItem(
      //       icon: Icon(Icons.settings), label: 'Setting');
    }
  }

  String get title {
    switch (this) {
      case Tabs.home:
        return 'Installed App';
      case Tabs.notification:
        return 'System App';
      // case Tabs.setting:
      //   return 'Setting';
    }
  }
}
