import 'package:flutter/material.dart';
import 'package:micro_app_home/app/controllers/home_controller.dart';
import 'package:micro_app_home/app/pages/home_page.dart';
import 'package:micro_core/app/micro_core_utils.config.dart';

import 'package:micro_core/micro_core.dart';

import 'package:micro_app_login/micro_app_login.dart';
import 'package:micro_app_home/micro_app_home.dart';

void main() {
  configureInjection();
  manageInjections();
  runApp(MyApp());
}

void manageInjections() {
  getIt.registerFactory<HomeController>(() => HomeController());
  getIt.registerFactory(() => HomePage(controller: getIt<HomeController>()));
}

class MyApp extends StatelessWidget with BaseApp {
  @override
  Widget build(BuildContext context) {
    super.registerRouters();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: '/login',
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        MicroAppLoginResolver(),
        MicroAppHomeResolver(),
      ];
}
