import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final void Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.white,
      shape: CircleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      child: Icon(icon, color: AppColors.primaryColor, size: 32.0),
    );
  }
}
