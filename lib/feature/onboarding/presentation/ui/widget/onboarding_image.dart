import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_images.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 157.0,
        height: 157.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:AppColors.primaryColor,
          border: Border.all(color: AppColors.white, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(7, 7),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            AppImages.splashImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
