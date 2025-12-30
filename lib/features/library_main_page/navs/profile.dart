import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/utils.dart';
import 'package:online_library/core/routers/nav_ids.dart';
import 'package:online_library/features/profile_page/presentation/profile_page_widget.dart';

class ProfileNav extends StatelessWidget {
  const ProfileNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profilePage),
      onGenerateRoute: (settings) {
        if (settings.name != '/profile') {
          return GetPageRoute(
            settings: settings,
            page: () => const ProfilePageWidget(),
          );
        }
        return null;
      },
    );
  }
}
