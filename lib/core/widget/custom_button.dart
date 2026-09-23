import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      width: 244.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30.0),
            side: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppStyles.cairo700Size30),
      ),
    );
  }
}
