import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';

class OnBoardingDescription extends StatelessWidget {
  const OnBoardingDescription({super.key, required this.title, required this.desc});

  final String title, desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w800,
            color: AppColors.primaryColor,
            height: 1.25,
          ),
        ),
        SizedBox(height: 50.0),
        Text(
          desc,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
