import 'package:flutter/material.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/feature/home/presentation/ui/view/home_view.dart';
import 'package:wash_up/feature/login/presentation/ui/view/login_view.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/view/onboarding_view.dart';
import 'package:wash_up/feature/register/presentation/ui/view/register_view.dart';
import 'package:wash_up/feature/selection/presentation/ui/view/selection_view.dart';
import 'package:wash_up/feature/splash/view/splash_view.dart';

class AppRouter {

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case AppRoutes.registerView:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case AppRoutes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.selectionView:
        return MaterialPageRoute(builder: (_) => SelectionView());
    }
    return null;
  }
}
