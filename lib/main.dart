import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:syndeo_dating/routes/app_pages.dart';

import 'config/size_config.dart';
import 'modules/splash_module/splash_bindings.dart';

void main() {
  runApp(const MyApp());
}


GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.white),
      ),
      title: 'Syndeo',
      navigatorKey: navState,
      getPages: AppPages.routes,
      initialRoute: Routes.SPLASH,
      initialBinding: SplashBinding(),
    );
  }
}

