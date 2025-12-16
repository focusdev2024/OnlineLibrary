import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/core/routers/app_pages.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/l10n/app_localizations.dart';
import 'package:online_library/tools/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedThemeMode = await AdaptiveTheme.getThemeMode();
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
