import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/feature/home/presentation/ui/view/home_view.dart';
import 'package:wash_up/feature/login/presentation/ui/view/login_view.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/view/onboarding_view.dart';
import 'package:wash_up/feature/register/data/model/register_model.dart';
import 'package:wash_up/feature/register/data/repo/register_repo.dart';
import 'package:wash_up/feature/register/presentation/cubit/register_cubit.dart';
import 'package:wash_up/feature/register/presentation/ui/view/register_view.dart';
import 'package:wash_up/feature/selection/presentation/ui/view/selection_view.dart';
import 'package:wash_up/feature/splash/view/splash_view.dart';
import 'package:wash_up/feature/verification_code/presentation/ui/view/verification_code_view.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case AppRoutes.registerView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(RegisterRepo()),
            child: RegisterView(),
          ),
        );
      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case AppRoutes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.selectionView:
        return MaterialPageRoute(builder: (_) => SelectionView());
      case AppRoutes.verificationCodeView:
        final user = settings.arguments as RegisterModel;
        return MaterialPageRoute(
          builder: (_) => VerificationCodeView(user: user),
        );
    }
    return null;
  }
}
