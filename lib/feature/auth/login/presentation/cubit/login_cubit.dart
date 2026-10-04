import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wash_up/feature/auth/login/data/repo/login_repo.dart';

import 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(LoginInitial());

  final LoginRepo _repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(LoginPasswordVisibilityChanged(isPasswordHidden));
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());
    try {
      final user = await _repo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }


  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}