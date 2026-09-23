import 'package:flutter/material.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/widget/custom_button.dart';
import 'package:wash_up/core/widget/custom_floating_button.dart';
import 'package:wash_up/feature/onboarding/model/onboarding_model.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/widget/onboarding_image.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/widget/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 25,
              right: 25,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginView);
                },
                child: Text(AppStrings.skip, style: AppStyles.almarai400Size22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 120.0),
                  const OnboardingImage(),
                  const SizedBox(height: 65.0),
                  Expanded(
                    child: OnboardingPageView(pageController: pageController),
                  ),
                  AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) {
                      final page =
                          pageController.hasClients &&
                              pageController.page != null
                          ? pageController.page!.round()
                          : 0;

                      return page == onboardingList.length - 1
                          ? CustomButton(
                              text: AppStrings.getStarted,
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.loginView);
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomFloatingButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  icon: Icons.arrow_forward,
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
