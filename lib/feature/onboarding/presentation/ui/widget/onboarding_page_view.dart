import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/feature/onboarding/model/onboarding_model.dart';
import 'onboarding_description.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      itemCount: onboardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            OnBoardingDescription(
              title: onboardingList[index].title,
              desc: onboardingList[index].description,
            ),
            const SizedBox(height: 25.0),
            DotsIndicator(
              dotsCount: onboardingList.length,
              position: index.toDouble(),
              decorator: DotsDecorator(
                color: const Color(0xffB8B8B8),
                activeColor: AppColors.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
