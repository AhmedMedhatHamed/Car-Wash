import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_styles.dart';

class RoleSelectionWidget extends StatelessWidget {
  const RoleSelectionWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  final String title, desc, image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primaryColor : AppColors.grey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8.0),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(top: 5.0),
              width: 176.0,
              height: 151.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: isSelected ? AppColors.primaryColor : AppColors.white,
                border: Border.all(
                  color: isSelected ? AppColors.white : AppColors.primaryColor,
                  width: 3,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.fill,
                    color: isSelected ? AppColors.white : AppColors.primaryColor,
                  ),
                  Text(
                    title,
                    style: AppStyles.cairo700Size30.copyWith(
                      fontSize: 28.0,
                      color: isSelected ? AppColors.white : AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Text(
            desc,
            style: AppStyles.almarai400Size20.copyWith(
              color:AppColors.primaryColor
            ),
          ),
        ],
      ),
    );
  }
}