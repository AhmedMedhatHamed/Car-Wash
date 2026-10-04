import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/widget/custom_back_icon.dart';
import 'package:wash_up/feature/auth/register/presentation/ui/widget/already_have_acc_row.dart';
import 'package:wash_up/feature/auth/register/presentation/ui/widget/register_form.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/widget/onboarding_image.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
            SliverToBoxAdapter(
              child: OnboardingImage(height: 120.0, width: 120.0),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  AppStrings.createAccount,
                  style: AppStyles.cairo700Size30,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  AppStrings.signUpDesc,
                  style: AppStyles.almarai400Size18,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.0)),
            SliverToBoxAdapter(child: RegisterForm()),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(child: AlreadyHaveAccRow()),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          ],
        ),
      ),
    );
  }
}
