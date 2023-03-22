import 'package:all_universe_flutter/pages/Index/Index_view.dart';
import 'package:all_universe_flutter/pages/details/details_view.dart';
import 'package:all_universe_flutter/pages/login/login_view.dart';
import 'package:all_universe_flutter/pages/notfound/notfound_view.dart';
import 'package:all_universe_flutter/pages/play/play_view.dart';
import 'package:all_universe_flutter/pages/proxy/proxy_view.dart';
import 'package:all_universe_flutter/pages/subscription/subscription_view.dart';
import 'package:all_universe_flutter/pages/tabbar/tabbar_view.dart';
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
    ),
    GetPage(
      name: AppRoutes.Subscription,
      page: () => SubscriptionPage(),
    ),
    GetPage(
      name: AppRoutes.Details,
      page: () => DetailsPage(),
    ),
    GetPage(
      name: AppRoutes.Tabbar,
      page: () => TabbarPage(),
    ),
    GetPage(
      name: AppRoutes.Play,
      page: () => PlayPage(),
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
