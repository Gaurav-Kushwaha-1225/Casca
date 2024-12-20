part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final bool rememberMeCheckbox;

  LoginEvent(
      {required this.email,
      required this.password,
      required this.rememberMeCheckbox});
}

class SignupEvent extends AuthenticationEvent {
  final String username;
  final String name;
  final String dOB;
  final String email;
  final String password;
  final int mobNo;
  final String gender;
  final String? image;
  final bool rememberMeCheckbox;

  SignupEvent(
      {required this.username,
      required this.name,
      required this.dOB,
      required this.email,
      required this.password,
      required this.mobNo,
      required this.gender,
      this.image,
      required this.rememberMeCheckbox});
}

class PasswordUpdateEvent extends AuthenticationEvent {
  final String id;
  final bool rememberMeCheckbox;
  final String newPassword;

  PasswordUpdateEvent({required this.id, required this.rememberMeCheckbox, required this.newPassword});
}

class UserProfileUpdateEvent extends AuthenticationEvent {
  final String id;
  final String username;
  final String name;
  final String dOB;
  final String email;
  final String password;
  final int mobNo;
  final String gender;
  final String? image;

  UserProfileUpdateEvent(
      {required this.id,
        required this.username,
        required this.name,
        required this.dOB,
        required this.email,
        required this.password,
        required this.mobNo,
        required this.gender,
        required this.image});
}