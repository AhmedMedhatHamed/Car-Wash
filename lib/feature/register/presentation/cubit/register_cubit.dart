import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wash_up/feature/register/data/model/register_model.dart';
import 'package:wash_up/feature/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final RegisterRepo _registerRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(RegisterPasswordVisibilityChanged(isPasswordHidden));
  }

  Future<void> register() async {
    if (state is RegisterLoading) return;
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(RegisterLoading());
    try {
      final user = await _registerRepo.register(
        name: nameController.text.trim(),
        phone: phoneController.text.replaceAll(' ', ''),
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}