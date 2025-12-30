import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/utils.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/features/favorites_page/presentation/favorites_page.dart';
import 'package:online_library/core/routers/nav_ids.dart';
import 'package:online_library/features/own_books/presentation/own_books_page.dart';

class OwnBooksNav extends StatelessWidget {
  const OwnBooksNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.ownBooksPage),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case Routes.favorites:
            return GetPageRoute(
              settings: settings,
              page: () => FavoritesPage(),
            );
          default:
            return GetPageRoute(
              settings: settings,
              page: () => const OwnBooksPageWidget(),
            );
        }
      },
    );
  }
}
