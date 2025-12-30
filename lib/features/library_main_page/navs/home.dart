import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/utils.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/features/category_page/presentation/category_page.dart';
import 'package:online_library/core/routers/nav_ids.dart';
import 'package:online_library/features/home_page/presentation/pages/main_page_widget.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.mainPage),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.mainDetails:
            return GetPageRoute(
              settings: settings,
              page: () => const MainPageWidget(),
            );
          case Routes.category:
            return GetPageRoute(
              settings: settings,
              page: () => const CategoryPage(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () => const MainPageWidget(),
            );
        }
      },
    );
  }
}
