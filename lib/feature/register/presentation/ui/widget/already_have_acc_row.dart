import 'package:flutter/material.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';

class AlreadyHaveAccRow extends StatelessWidget {
  const AlreadyHaveAccRow({super.key});


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAcc,
          style: AppStyles.almarai400Size22,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.loginView);
          },
          child: Text(
            AppStrings.login,
            style: AppStyles.poppinsSize22.copyWith(
              fontSize: 18.0,
              color: Colors.blueGrey,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
