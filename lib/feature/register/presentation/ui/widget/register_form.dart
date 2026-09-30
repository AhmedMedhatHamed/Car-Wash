import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wash_up/core/routing/app_routes.dart';
import 'package:wash_up/core/utils/app_strings.dart';
import 'package:wash_up/core/utils/validators.dart';
import 'package:wash_up/core/widget/custom_button.dart';
import 'package:wash_up/core/widget/custom_text_form_field.dart';
import 'package:wash_up/feature/register/presentation/cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: cubit.nameController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              hintText: 'Enter your full name',
              prefixIcon: CupertinoIcons.person,
              validator: Validators.name,
            ),
            const SizedBox(height: 15.0),
            CustomTextFormField(
              controller: cubit.phoneController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.phone,
              hintText: '+20 000 000 0000',
              prefixIcon: CupertinoIcons.phone,
              validator: Validators.phone,
            ),
            const SizedBox(height: 15.0),
            CustomTextFormField(
              controller: cubit.emailController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              hintText: 'example@email.com',
              prefixIcon: Icons.email_outlined,
              validator: Validators.email,
            ),
            const SizedBox(height: 15.0),
            BlocBuilder<RegisterCubit, RegisterState>(
              buildWhen: (previous, current) =>
              current is RegisterPasswordVisibilityChanged,
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
                  onFieldSubmitted: (_) => cubit.register(),
                );
              },
            ),
            const SizedBox(height: 25.0),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Account created successfully'),
                    ),
                  );
                  Navigator.pushNamed(context, AppRoutes.homeView);

                } else if (state is RegisterFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: AppStrings.signUp,
                  onPressed: () {
                    if (state is! RegisterLoading) cubit.register();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}