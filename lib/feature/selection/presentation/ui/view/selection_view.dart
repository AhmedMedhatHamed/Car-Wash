import 'package:flutter/material.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_images.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/widget/custom_button.dart';
import 'package:wash_up/feature/onboarding/presentation/ui/widget/onboarding_image.dart';
import 'package:wash_up/feature/selection/presentation/ui/widget/role_selection_widget.dart';

enum UserRole { carOwner, serviceProvider }

class SelectionView extends StatefulWidget {
  const SelectionView({super.key});

  @override
  State<SelectionView> createState() => _SelectionViewState();
}

class _SelectionViewState extends State<SelectionView> {
  UserRole? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const OnboardingImage(height: 120.0, width: 120.0),
            const SizedBox(height: 14.0),
            Text(
              AppStrings.roleSelectionTitle,
              style: AppStyles.cairo700Size30,
            ),
            Text(
              AppStrings.roleSelectionDesc,
              style: AppStyles.almarai400Size18,
            ),
            const SizedBox(height: 60.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoleSelectionWidget(
                  title: AppStrings.carOwnerTitle,
                  desc: AppStrings.carOwnerDesc,
                  image: AppImages.carOwner,
                  isSelected: selectedRole == UserRole.carOwner,
                  onTap: () {
                    setState(() {
                      selectedRole = UserRole.carOwner;
                    });
                  },
                ),
                const SizedBox(height: 30.0),
                RoleSelectionWidget(
                  title: AppStrings.serviceProviderTitle,
                  desc: AppStrings.serviceProviderDesc,
                  image: AppImages.serviceProvider,
                  isSelected: selectedRole == UserRole.serviceProvider,
                  onTap: () {
                    setState(() {
                      selectedRole = UserRole.serviceProvider;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 60.0),
            CustomButton(
              text: AppStrings.continueButton,
              onPressed: () {
                if (selectedRole != null) {
                  Navigator.pushNamed(context, AppRoutes.loginView);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
