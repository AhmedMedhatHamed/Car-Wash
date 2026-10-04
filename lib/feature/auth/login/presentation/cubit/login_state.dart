
import 'package:flutter/material.dart';
import 'package:wash_up/feature/auth/register/data/model/register_model.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginPasswordVisibilityChanged extends LoginState {
  final bool isHidden;
  LoginPasswordVisibilityChanged(this.isHidden);
}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthModel user;
  LoginSuccess(this.user);
}

final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

final class ForgotPasswordEmailSent extends LoginState {}