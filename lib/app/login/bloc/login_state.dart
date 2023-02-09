part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  final usernameTEC = TextEditingController();
  final passwordTEC = TextEditingController();
}

class LoginInitial extends LoginState {}

class LoginError extends LoginState {}

class LoginSuccess extends LoginState {}
