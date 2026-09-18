import 'package:flutter/material.dart';
import 'package:wash_up/core/routing/app_router.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/core/utils/app_strings.dart';

class WashCarApp extends StatelessWidget {
  const WashCarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: AppRoutes.splashView,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
