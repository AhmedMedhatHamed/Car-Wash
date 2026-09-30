import 'package:flutter/material.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.textInputType,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPressed,
    this.obscureText = false,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      obscureText: obscureText,
      style: AppStyles.poppinsSize22.copyWith(
        color: AppColors.primaryColor,
        fontSize: 16.0,
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18.0),
        fillColor: AppColors.white,
        filled: true,
        hintText: hintText,
        hintStyle: AppStyles.poppinsSize22,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon,color: AppColors.primaryColor,) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon,color: AppColors.primaryColor,),
          onPressed: onSuffixPressed,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: AppColors.primaryColor,width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: AppColors.primaryColor,width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: AppColors.primaryColor,width: 2),
        ),
      ),
    );
  }
}