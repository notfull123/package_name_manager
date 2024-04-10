import 'dart:async';

import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:package_name_manager/commons/app_colors.dart';
import 'package:package_name_manager/generated/l10n.dart';
import 'package:package_name_manager/ui/pages/tab_home/widget/app_info.dart';
import 'package:package_name_manager/ui/widgets/app_bar_widget.dart';
import 'package:package_name_manager/ui/widgets/error_list_widget.dart';
import 'package:package_name_manager/ui/widgets/loading_list_widget.dart';
import 'package:package_name_manager/ui/widgets/status_bar_widget.dart';

class NotificationTabPage extends StatefulWidget {
  const NotificationTabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotificationTabPageState();
  }
}

class _NotificationTabPageState extends State<NotificationTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const StatusBarWidget(),
          AppBarWidget(title: S.of(context).appName),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Future<List<AppInfo>> listSystemApp() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(false, true);
    List<AppInfo> appMaps = [];
    for (AppInfo app in apps) {
      bool isSys = await InstalledApps.isSystemApp(app.packageName) ?? false;
      if (isSys) {
        appMaps.add(app);
      }
    }
    return appMaps;
  }

  Widget _buildBody() {
    return FutureBuilder<List<AppInfo>>(
      future: listSystemApp(),
      builder: (
        BuildContext buildContext,
        AsyncSnapshot<List<AppInfo>> snapshot,
      ) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData
                ? _buildListView(snapshot.data ?? [])
                : _buildFailureList()
            : _buildLoadingList();
      },
    );
  }

  Widget _buildListView(List<AppInfo> apps) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: apps.length,
      itemBuilder: (context, index) => _buildListItem(context, apps[index]),
    );
  }

  Widget _buildListItem(BuildContext context, AppInfo app) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.memory(app.icon!),
        ),
        title: Text(app.name),
        subtitle: Text(app.getVersionInfo()),
        onTap: () => _buildActionBottomSheet(app),
      ),
    );
  }

  Widget _buildLoadingList() {
    return const LoadingListWidget();
  }

  Widget _buildFailureList() {
    return ErrorListWidget(
      onRefresh: _onRefreshData,
    );
  }

  Future<void> _onRefreshData() async {}

  void _buildActionBottomSheet(AppInfo app) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        isDismissible: true,
        context: context,
        useRootNavigator: true,
        isScrollControlled: true,
        builder: (BuildContext ctx) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Navigator.pop(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: SafeArea(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildActionButton(
                                      () => InstalledApps.startApp(
                                          app.packageName),
                                      "Open App",
                                      Icons.open_in_new),
                                  _buildActionButton(
                                      () => InstalledApps.uninstallApp(
                                          app.packageName),
                                      "Uninstall App",
                                      Icons.delete),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildActionButton(
                                      () => InstalledApps.openSettings(
                                          app.packageName),
                                      "Settings App",
                                      Icons.settings),
                                  _buildActionButton(
                                      () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AppInfoScreen(app: app)),
                                          ),
                                      "Get Info",
                                      Icons.info)
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _buildActionButton(
      VoidCallback onTap, String title, IconData iconData) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          onPressed: onTap,
          child: Row(
            children: [
              Icon(iconData),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
