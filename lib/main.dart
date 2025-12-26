import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_library/core/routers/app_pages.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/features/favorites_page/controller/favorite_controller.dart';
import 'package:online_library/features/favorites_page/data/models/favorite_book_model.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/tools/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await Hive.initFlutter();

  // Регистрируем адаптер, который создали в шаге 1
  Hive.registerAdapter(FavoriteBookModelAdapter());
  Get.put(FavoriteController(), permanent: true);

  // Открываем бокс для избранного
  await Hive.openBox<FavoriteBookModel>('favorites_box');

  runApp(
    OnlineLibrary(
      savedThemeMode: savedThemeMode,
    ),
  );
}

class OnlineLibrary extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const OnlineLibrary({super.key, this.savedThemeMode});

  @override
  State<OnlineLibrary> createState() => _OnlineLibraryState();
}

class _OnlineLibraryState extends State<OnlineLibrary> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppThemes.lightTheme,
        dark: AppThemes.darkTheme,
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Online Library",
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: theme,
              darkTheme: darkTheme,
              initialRoute: Routes.library,
              getPages: AppPages.pages,
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(builder: (context) {
                  return const Text('Default Route');
                });
              },
            ));
  }
}
