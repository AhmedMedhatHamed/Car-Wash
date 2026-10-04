import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/widget/custom_back_icon.dart';
import 'package:wash_up/core/widget/logo_image.dart';
import 'package:wash_up/feature/auth/login/presentation/ui/widget/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconBack(),
              backgroundColor: Colors.transparent,
            ),
            SliverToBoxAdapter(child: LogoImage(height: 120.0, width: 120.0)),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: Text(
                AppStrings.welcomeBack,
                style: AppStyles.cairo700Size30,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                AppStrings.loginDesc,
                style: AppStyles.almarai400Size18,
                textAlign: TextAlign.center,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            SliverToBoxAdapter(child: LoginForm()),
          ],
        ),
      ),
    );
  }
}
