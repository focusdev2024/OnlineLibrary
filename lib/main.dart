import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_library/features/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/features/otp/presentation/otp.dart';
import 'package:online_library/features/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/features/welcome_page/presentation/welcome_page.dart';
import 'package:online_library/features/home_page/presentation/pages/home_page_widget.dart';
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
              initialRoute: '/libraryMain',
              getPages: [
                GetPage(name: '/welcome', page: () => const WelcomePage()),
                GetPage(
                    name: '/libraryMain', page: () => const LibraryMainPage()),
                GetPage(
                    name: '/readAndBuyPage',
                    page: () => const ReadAndBuyPage()),
                GetPage(
                    name: '/libraryMain/mainDetails',
                    page: () => const MainPageWidget()),
                GetPage(
                    name: '/get-token-page', page: () => const GetTokenPage())
              ],
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(builder: (context) {
                  return const Text('Default Route');
                });
              },
            ));
  }
}
