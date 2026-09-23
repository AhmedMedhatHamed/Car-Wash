import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_styles.dart';

class RoleSelectionWidget extends StatelessWidget {
  const RoleSelectionWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
  });

  final String title, desc, image;
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
              color: AppColors.grey,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width:8.0,),
          Container(
            padding: EdgeInsets.only(top:5.0),
            width: 176.0,
            height: 151.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.white,
              border: BoxBorder.all(color: AppColors.primaryColor, width: 3),
            ),
            child: Column(
              children: [
                Image.asset(image, fit: BoxFit.fill),
                Text(title, style: AppStyles.cairo700Size30.copyWith(fontSize: 28.0)),
              ],
            ),
          ),
          SizedBox(width: 16.0,),
          Text(desc, style: AppStyles.almarai400Size20),
        ],
      ),
    );
  }
}
