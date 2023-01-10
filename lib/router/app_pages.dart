import 'package:all_universe_flutter/pages/Index/Index_view.dart';
import 'package:all_universe_flutter/pages/home/home.binding.dart';
import 'package:all_universe_flutter/pages/home/home_view.dart';
import 'package:all_universe_flutter/pages/login/login_binding.dart';
import 'package:all_universe_flutter/pages/login/login_view.dart';
import 'package:all_universe_flutter/pages/notfound/notfound_view.dart';
import 'package:all_universe_flutter/pages/proxy/proxy_view.dart';
import 'package:all_universe_flutter/pages/tabbar/tabbar.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Tabbar,
      page: () => TabbarPage(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );

  static final proxyRoute = GetPage(
    name: AppRoutes.Proxy,
    page: () => ProxyPage(),
  );
}
