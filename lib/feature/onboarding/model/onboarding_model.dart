import 'package:wash_up/core/utils/app_strings.dart';

class OnboardingModel {
  final String title, description;

  OnboardingModel({required this.title, required this.description});
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    title: AppStrings.onboardingTextTitle1,
    description: AppStrings.onboardingDesc1,
  ),
  OnboardingModel(
    title: AppStrings.onboardingTextTitle2,
    description: AppStrings.onboardingDesc2,
  ),
  OnboardingModel(
    title: AppStrings.onboardingTextTitle3,
    description: AppStrings.onboardingDesc3,
  ),
];
