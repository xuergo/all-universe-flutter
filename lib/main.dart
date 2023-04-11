import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:all_universe_flutter/common/langs/translation_service.dart';
import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/pages/Index/Index_view.dart';
import 'package:all_universe_flutter/pages/Index/index_binding.dart';
import 'package:all_universe_flutter/router/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => Global.init().then((e) {
      runApp(MyApp());
    });

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          title: '大宇宙',
          home: IndexPage(),
          initialBinding: IndexBinding(),
          debugShowCheckedModeBanner: false,
          enableLog: true,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          unknownRoute: AppPages.unknownRoute,
          builder: EasyLoading.init(),
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
        );
      },
    );
  }
}
