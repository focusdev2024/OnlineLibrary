import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:online_library/core/routers/app_routes.dart';
import 'package:online_library/features/category_page/presentation/category_page.dart';
import 'package:online_library/features/favorites_page/presentation/favorites_page.dart';
import 'package:online_library/features/home_page/presentation/pages/main_page_widget.dart';
import 'package:online_library/features/library_main_page/presentation/library_main_page.dart';
import 'package:online_library/features/otp/presentation/otp.dart';
import 'package:online_library/features/read_and_buy_page/presentation/read_and_buy_page.dart';
import 'package:online_library/features/sing_in_page/presentation/signin_page.dart';
import 'package:online_library/features/sing_up_page/presentation/sing_up_page.dart';
import 'package:online_library/features/welcome_page/presentation/welcome_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: Routes.singIn,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SingUpPage(),
    ),
    GetPage(
      name: Routes.getToken,
      page: () => const GetTokenPage(),
    ),
    GetPage(
      name: Routes.library,
      page: () => const LibraryMainPage(),
    ),
    GetPage(
      name: Routes.mainDetails,
      page: () => const MainPageWidget(),
    ),
    GetPage(
      name: Routes.category,
      page: () => const CategoryPage(),
    ),
    GetPage(
      name: Routes.readAndBuy,
      page: () => const ReadAndBuyPage(),
    ),
    GetPage(
      name: Routes.favorites,
      page: () => FavoritesPage(),
    ),
  ];
}
