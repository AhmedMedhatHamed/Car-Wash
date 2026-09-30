import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_outlined,
        color: AppColors.primaryColor,
        size: 40.0,
      ),
    );
  }
}
