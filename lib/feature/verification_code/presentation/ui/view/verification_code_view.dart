import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/widget/custom_button.dart';
import 'package:wash_up/core/widget/logo_image.dart';
import 'package:wash_up/feature/register/data/model/register_model.dart';
import 'package:wash_up/feature/verification_code/presentation/ui/widget/custom_text_field.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key, required this.user});

  final RegisterModel user;

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  late TextEditingController firstDigitController;
  late TextEditingController secondDigitController;
  late TextEditingController thirdDigitController;
  late TextEditingController fourthDigitController;

  @override
  void initState() {
    super.initState();
    firstDigitController = TextEditingController();
    secondDigitController = TextEditingController();
    thirdDigitController = TextEditingController();
    fourthDigitController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    firstDigitController.dispose();
    secondDigitController.dispose();
    thirdDigitController.dispose();
    fourthDigitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, size: 30),
                  ),
                  LogoImage(width: size.width * 0.3, height: size.width * 0.3),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                AppStrings.verificationCode,
                style: AppStyles.cairo700Size30,
              ),
              SizedBox(height: size.height * 0.01),

              Text(
                AppStrings.verificationDesc,
                style: AppStyles.almarai400Size18,
              ),
              SizedBox(height: size.height * 0.01),

              Text(widget.user.phone, style: AppStyles.almarai700Size18),
              SizedBox(height: size.height * 0.08),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextField(controller: firstDigitController),
                    SizedBox(width: size.width * 0.02),
                    CustomTextField(controller: secondDigitController),
                    SizedBox(width: size.width * 0.02),
                    CustomTextField(controller: thirdDigitController),
                    SizedBox(width: size.width * 0.02),
                    CustomTextField(controller: fourthDigitController),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.08),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.didntReceiveTheCode,
                    style: AppStyles.almarai400Size18,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.resend,
                      style: AppStyles.almarai700Size18,
                    ),
                  ),
                  Text(
                    AppStrings.verificationTime,
                    style: AppStyles.almarai400Size18,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.16),
              CustomButton(onPressed: () {}, text: 'Confirm'),
            ],
          ),
        ),
      ),
    );
  }
}
