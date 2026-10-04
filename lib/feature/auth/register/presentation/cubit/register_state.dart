part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterPasswordVisibilityChanged extends RegisterState {
  final bool isHidden;
  RegisterPasswordVisibilityChanged(this.isHidden);
}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthModel user;
  RegisterSuccess(this.user);
}

final class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}