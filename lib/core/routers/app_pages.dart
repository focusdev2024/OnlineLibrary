import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/features/home_page/presentation/pages/home_page_widget.dart';
import 'package:online_library/features/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/features/otp/presentation/otp.dart';
import 'package:online_library/features/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/features/welcome_page/presentation/welcome_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.library,
      page: () => const LibraryMainPage(),
    ),
    GetPage(
      name: Routes.readAndBuy,
      page: () => const ReadAndBuyPage(),
    ),
    GetPage(
      name: Routes.mainDetails,
      page: () => const MainPageWidget(),
    ),
    GetPage(
      name: Routes.getToken,
      page: () => const GetTokenPage(),
    ),
  ];
}
