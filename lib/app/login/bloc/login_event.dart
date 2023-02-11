part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SignIn extends LoginEvent {
  final String username;
  final String password;

  SignIn({required this.username, required this.password});
}
