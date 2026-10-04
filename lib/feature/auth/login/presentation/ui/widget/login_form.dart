import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/core/utils/app_colors.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/app_styles.dart';
import 'package:wash_up/core/utils/validators.dart';
import 'package:wash_up/core/widget/custom_button.dart';
import 'package:wash_up/core/widget/custom_text_form_field.dart';
import 'package:wash_up/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:wash_up/feature/auth/login/presentation/cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextFormField(
              controller: cubit.emailController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              hintText: 'example@email.com',
              prefixIcon: Icons.email_outlined,
              validator: Validators.email,
            ),
            const SizedBox(height: 30.0),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
              current is LoginPasswordVisibilityChanged,
              builder: (context, state) {
                return CustomTextFormField(
                  controller: cubit.passwordController,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  hintText: '***************',
                  prefixIcon: CupertinoIcons.lock,
                  obscureText: cubit.isPasswordHidden,
                  suffixIcon: cubit.isPasswordHidden
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash,
                  onSuffixPressed: cubit.togglePasswordVisibility,
                  validator: Validators.password,
                  onFieldSubmitted: (_) => cubit.login(),
                );
              },
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, AppRoutes.forgotPassword);
              },
              child: Text(
                AppStrings.forgotPassword,
                style: AppStyles.almarai700Size18,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged in successfully')),
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.homeView,
                    arguments: state.user,
                  );
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else {
                  return Center(
                    child: CustomButton(
                      text: AppStrings.login,
                      onPressed: () {
                        cubit.login();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}